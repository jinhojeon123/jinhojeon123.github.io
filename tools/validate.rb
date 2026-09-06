#!/usr/bin/env ruby
# frozen_string_literal: true

# Source checks use only Ruby standard libraries, so they can run before Bundler.
# Rendered HTML and link checks are performed separately by HTMLProofer.
require "date"
require "digest"
require "json"
require "optparse"
require "pathname"
require "set"
require "uri"
require "yaml"

class SourceValidator
  STATUSES = %w[note working-note outline].freeze
  NOTE_TYPES = %w[concept numerical-method paper-note experiment research-log short-note seminar].freeze
  SLUG = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/
  FRONT_MATTER = /\A---\r?\n(.*?)^---\r?(?:\n|\z)/m
  SKIP_DIRECTORIES = %w[archive assets docs node_modules templates tools vendor].freeze

  attr_reader :errors

  def initialize(root)
    @root = File.expand_path(root)
    @errors = []
    @documents = {}
    @date_literals = {}
    @urls = {}
    @series = {}
    @counts = Hash.new(0)
  end

  def run
    config = yaml_file("_config.yml")
    taxonomy = yaml_file("_data/taxonomy.yml")
    references = yaml_file("_data/references.yml")
    categories = taxonomy.is_a?(Array) ? taxonomy.filter_map { |item| item["name"] if item.is_a?(Hash) } : []
    error("_data/taxonomy.yml", "must define unique nonempty category names") if
      categories.empty? || categories.any? { |name| !string?(name) } || categories.uniq != categories
    error("_data/references.yml", "must contain a mapping of reference keys") unless references.is_a?(Hash)
    reference_keys = references.is_a?(Hash) ? references.keys : []
    check_exclusions(config)

    project_ids = {}
    paths("_projects/**/*.{md,html}").each do |path|
      data = front_matter(path)
      next unless data

      id = data["project_id"]
      error(path, "project_id must use lowercase kebab-case") unless slug?(id)
      error(path, "duplicate project_id #{id.inspect} in #{project_ids[id]}") if project_ids.key?(id)
      project_ids[id] = path if slug?(id)
      @counts[:projects] += 1
    end

    paths("_posts/**/*").each do |path|
      next unless File.file?(absolute(path))
      next if path == "_posts/measure-theory/README.md"

      filename = File.basename(path)
      match = /\A(\d{4}-\d{2}-\d{2})-.+\.(?:md|markdown)\z/.match(filename)
      unless match
        error(path, "post filename must be YYYY-MM-DD-descriptive-slug.md; archive other files")
        next
      end
      data = front_matter(path)
      next unless data

      check_post(path, data, match[1], categories)
      @counts[:posts] += 1
    end

    page_paths.each { |path| front_matter(path, required: path.start_with?("_tabs/")) }
    @documents.each do |path, data|
      next if data["published"] == false

      check_relationships(path, data, project_ids.keys, reference_keys)
      register_url(path, data["permalink"] || default_url(path))
    end
    paths("templates/**/*.{md,html}").each do |path|
      data = front_matter(path, register: false)
      next unless data

      # Dates remain placeholder strings in these excluded, unpublished examples.
      error(path, "authoring template must have published: false") unless data["published"] == false
      @counts[:templates] += 1
    end
    check_preservation
    check_archive
    check_legacy_urls
    report
    @errors.empty?
  end

  def front_matter(path, required: true, register: true)
    raw = File.binread(absolute(path)).force_encoding(Encoding::UTF_8)
    unless raw.valid_encoding?
      error(path, "must be valid UTF-8")
      return nil
    end
    match = FRONT_MATTER.match(raw)
    unless match
      error(path, "missing or malformed exact --- front-matter boundaries") if required || raw.start_with?("---")
      return nil
    end
    data = safe_yaml(match[1], path)
    unless data.is_a?(Hash)
      error(path, "front matter must be a YAML mapping")
      return nil
    end
    @documents[path] = data if register
    data
  rescue SystemCallError => e
    error(path, e.message)
    nil
  end

  private

  def error(path, message)
    @errors << "#{path}: #{message}"
  end

  def string?(value)
    value.is_a?(String) && !value.strip.empty?
  end

  def slug?(value)
    value.is_a?(String) && SLUG.match?(value)
  end

  def absolute(relative)
    path = File.expand_path(relative, @root)
    unless path.start_with?(@root + File::SEPARATOR)
      raise ArgumentError, "path must stay inside the repository: #{relative.inspect}"
    end
    path
  end

  def paths(pattern)
    Dir.glob(pattern, base: @root).sort
  end

  def safe_yaml(text, path)
    tree = Psych.parse_stream(text, filename: path)
    check_yaml_keys(tree, path)
    root = tree.children.first&.root
    if root.is_a?(Psych::Nodes::Mapping)
      pair = root.children.each_slice(2).find do |key, _value|
        key.is_a?(Psych::Nodes::Scalar) && key.value == "date"
      end
      @date_literals[path] = pair.last.value if pair && pair.last.is_a?(Psych::Nodes::Scalar)
    end
    YAML.safe_load(text, permitted_classes: [Date, Time], aliases: false, filename: path)
  rescue Psych::Exception, ArgumentError => e
    error(path, "invalid or unsafe YAML: #{e.message.lines.first.strip}")
    nil
  end

  def check_yaml_keys(node, path)
    if node.is_a?(Psych::Nodes::Mapping)
      keys = node.children.each_slice(2).filter_map do |key, _value|
        key.value if key.is_a?(Psych::Nodes::Scalar)
      end
      keys.group_by(&:itself).each do |key, entries|
        error(path, "duplicate YAML key #{key.inspect}") if entries.size > 1
      end
    end
    Array(node.children).each { |child| check_yaml_keys(child, path) } if node.respond_to?(:children)
  end

  def yaml_file(path)
    safe_yaml(File.read(absolute(path), encoding: "UTF-8"), path)
  rescue SystemCallError => e
    error(path, e.message)
    nil
  end

  def json_file(path)
    JSON.parse(File.read(absolute(path), encoding: "UTF-8"))
  rescue SystemCallError, JSON::ParserError => e
    error(path, "cannot read manifest: #{e.message}")
    nil
  end

  def check_exclusions(config)
    return unless config.is_a?(Hash)

    excluded = Array(config["exclude"]).map { |entry| entry.to_s.delete_suffix("/") }
    %w[archive docs templates].each do |path|
      error("_config.yml", "exclude must include #{path} to keep authoring evidence out of the site") unless excluded.include?(path)
    end
  end

  def page_paths
    result = paths("_tabs/**/*.{md,html}") + paths("*.{md,html}")
    Dir.children(@root).sort.each do |directory|
      next if directory.start_with?(".", "_") || SKIP_DIRECTORIES.include?(directory)
      next unless File.directory?(File.join(@root, directory))

      result.concat(paths("#{directory}/**/*.{md,html}"))
    end
    result.reject { |path| %w[README.md CONTRIBUTING.md].include?(path) }.uniq
  end

  def check_post(path, data, filename_date, categories)
    %w[title date categories tags permalink status note_type].each do |key|
      error(path, "missing required front matter #{key}") unless data.key?(key)
    end
    error(path, "title must be a nonempty string") unless string?(data["title"])
    begin
      # Psych converts an impossible timestamp such as February 30 into a Time
      # in March. Check the original YAML scalar before that normalization.
      date = parse_date(@date_literals.fetch(path, data["date"]))
      error(path, "front-matter date must match filename date #{filename_date}") unless date == Date.iso8601(filename_date)
    rescue ArgumentError, TypeError
      error(path, "date and filename must contain a real ISO calendar date; use YYYY-MM-DD HH:MM:SS +0900")
    end
    unless data["categories"].is_a?(Array) && data["categories"].size == 1 && categories.include?(data["categories"].first)
      error(path, "categories must contain exactly one taxonomy name: #{categories.join(', ')}")
    end
    tags = data["tags"]
    unless tags.is_a?(Array) && tags.all? { |tag| slug?(tag) } && tags.uniq == tags
      error(path, "tags must be a unique array of lowercase kebab-case values")
    end
    error(path, "status must be one of #{STATUSES.join(', ')}") unless STATUSES.include?(data["status"])
    error(path, "note_type must be one of #{NOTE_TYPES.join(', ')}") unless NOTE_TYPES.include?(data["note_type"])
    error(path, "permalink must be an explicit local path") unless string?(data["permalink"])
    if data.key?("series") || data.key?("series_order")
      unless slug?(data["series"]) && data["series_order"].is_a?(Integer) && data["series_order"].positive?
        error(path, "series requires a kebab-case ID and a positive integer series_order")
        return
      end
      key = [data["series"], data["series_order"]]
      error(path, "duplicate series_order #{key.last} for #{key.first} in #{@series[key]}") if @series.key?(key)
      @series[key] = path
    end
  end

  def parse_date(value)
    return value.to_date if value.is_a?(Time) || value.is_a?(Date)
    raise ArgumentError unless value.is_a?(String)
    raise ArgumentError unless /\A\d{4}-\d{2}-\d{2}(?:[ T]\d{2}:\d{2}(?::\d{2})?(?:\s?(?:Z|[+-]\d{2}:?\d{2}))?)?\z/.match?(value)

    return Date.iso8601(value) if value.length == 10

    DateTime.iso8601(value.sub(" ", "T").sub(/ ([+-]\d{2}:?\d{2})\z/, '\1')).to_date
  end

  def check_relationships(path, data, project_ids, reference_keys)
    { "projects" => project_ids, "references" => reference_keys }.each do |key, known|
      next unless data.key?(key)

      values = data[key]
      unless values.is_a?(Array) && values.all? { |value| string?(value) } && values.uniq == values
        error(path, "#{key} must be a unique array of string IDs")
        next
      end
      values.each { |value| error(path, "unknown #{key} ID #{value.inspect}") unless known.include?(value) }
    end
  end

  def default_url(path)
    return "/projects/#{File.basename(path, '.*')}/" if path.start_with?("_projects/")
    return "/#{File.basename(path, '.*')}/" if path.start_with?("_tabs/")

    "/" + path.sub(/\.md\z/, ".html").sub(%r{(?:\A|/)index\.html\z}, "/").sub(%r{\A/}, "")
  end

  def canonical_url(url)
    raise ArgumentError, "URL must be a local absolute path" unless string?(url) && url.start_with?("/") && !url.start_with?("//")
    raise ArgumentError, "URL must not include query, fragment, backslash, or invalid percent encoding" if /[?#\\]/.match?(url) || /%(?![0-9a-fA-F]{2})/.match?(url)

    decoded = URI::DEFAULT_PARSER.unescape(url).force_encoding(Encoding::UTF_8)
    raise ArgumentError, "URL must be valid UTF-8 without control characters or traversal" unless decoded.valid_encoding? &&
      !/[\x00-\x1f\x7f\\]/.match?(decoded) && !decoded.split("/").any? { |part| %w[. ..].include?(part) }

    decoded.sub(%r{/index\.html\z}, "/")
  end

  def register_url(path, url)
    canonical = canonical_url(url)
    error(path, "duplicate decoded URL #{canonical.inspect} in #{@urls[canonical]}") if @urls.key?(canonical)
    @urls[canonical] = path
  rescue ArgumentError => e
    error(path, "invalid permalink: #{e.message}")
  end

  def body_bytes(path)
    bytes = File.binread(absolute(path))
    match = /\A---\r?\n.*?^---\r?(?:\n|\z)/m.match(bytes)
    raise ArgumentError, "cannot identify exact front-matter boundary" unless match

    bytes.byteslice(match.end(0)..) || "".b
  end

  def manifest_entries(path)
    data = json_file(path)
    entries = data.is_a?(Hash) ? data["files"] : nil
    unless entries.is_a?(Array) && !entries.empty? && entries.all? { |entry| entry.is_a?(Hash) }
      error(path, "must contain a nonempty files array")
      return []
    end
    entries
  end

  def check_preservation
    path = "docs/content-preservation.json"
    manifest_entries(path).each do |entry|
      current = entry["current_path"]
      begin
        body = body_bytes(current)
        raw_ok = Digest::SHA256.hexdigest(body) == entry["body_sha256"]
        expected_lf = entry["body_lf_sha256"] || entry["normalized_body_sha256"]
        lf_ok = expected_lf && Digest::SHA256.hexdigest(body.gsub("\r\n", "\n")) == expected_lf
        error(current, "preserved mathematical body changed (raw and LF-normalized checksums differ)") unless raw_ok || lf_ok
        snapshot = entry["original_snapshot"]
        if snapshot
          digest = Digest::SHA256.file(absolute(snapshot)).hexdigest
          error(snapshot, "original snapshot checksum differs") unless digest == entry["original_file_sha256"]
          @counts[:snapshots] += 1
        end
        @counts[:preserved_bodies] += 1
      rescue SystemCallError, ArgumentError, TypeError => e
        error(path, "#{current.inspect}: #{e.message}")
      end
    end
  end

  def check_archive
    path = "archive/manifest.json"
    manifest_entries(path).each do |entry|
      archived = entry["archived_path"]
      begin
        file = absolute(archived)
        error(archived, "archive byte count differs") unless File.size(file) == entry["bytes"]
        error(archived, "archive SHA256 differs") unless Digest::SHA256.file(file).hexdigest == entry["sha256"]
        @counts[:archived_files] += 1
      rescue SystemCallError, ArgumentError, TypeError => e
        error(path, "#{archived.inspect}: #{e.message}")
      end
    end
  end

  def check_legacy_urls
    path = "docs/legacy-urls.json"
    data = json_file(path)
    urls = data.is_a?(Hash) ? data["urls"] : data
    unless urls.is_a?(Array) && !urls.empty?
      error(path, "must contain a nonempty URL array or an object with urls")
      return
    end
    urls.each do |entry|
      url = entry.is_a?(Hash) ? entry["url"] || entry["permalink"] : entry
      begin
        canonical = canonical_url(url)
        error(path, "legacy URL no longer has a source page: #{url}") unless @urls.key?(canonical)
        @counts[:legacy_urls] += 1
      rescue ArgumentError => e
        error(path, "#{url.inspect}: #{e.message}")
      end
    end
  end

  def report
    if @errors.empty?
      puts "Source validation passed: #{@counts.map { |key, count| "#{count} #{key.to_s.tr('_', ' ')}" }.join(', ')}."
    else
      warn "Source validation failed (#{@errors.size} errors):"
      @errors.each { |message| warn "  - #{message}" }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  options = { root: File.expand_path("..", __dir__) }
  parser = OptionParser.new do |opts|
    opts.banner = "Usage: ruby tools/validate.rb [--root REPOSITORY]\nValidates source metadata, relationships, URLs, and preservation manifests."
    opts.on("--root PATH", "Validate another checkout (defaults to this repository)") { |path| options[:root] = path }
    opts.on("-h", "--help", "Show help") { puts opts; exit }
  end
  begin
    parser.parse!
    raise OptionParser::InvalidArgument, ARGV.join(" ") unless ARGV.empty?

    exit(SourceValidator.new(options[:root]).run ? 0 : 1)
  rescue OptionParser::ParseError, SystemCallError, ArgumentError => e
    warn e.message
    exit 1
  end
end
