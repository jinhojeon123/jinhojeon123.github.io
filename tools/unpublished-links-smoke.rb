#!/usr/bin/env ruby
# frozen_string_literal: true

# Build an isolated site with the real plugin; no notebook sources are changed.
# Usage: bundle exec ruby tools/unpublished-links-smoke.rb
require "bundler/setup"
require "jekyll"
require "fileutils"
require "nokogiri"
require "tmpdir"

def assert(condition, message)
  abort message unless condition
end

def build(source, destination, unpublished: false)
  config = Jekyll.configuration(
    "config" => [], "source" => source, "destination" => destination,
    "baseurl" => "/preview", "quiet" => true, "unpublished" => unpublished,
    "collections" => { "projects" => { "output" => true } },
    "exclude" => %w[_site-production _site-preview _site-missing _site-non-post]
  )
  site = Jekyll::Site.new(config)
  site.process
  site
end

def html(path)
  Nokogiri::HTML(File.read(path, encoding: "UTF-8"))
end

def assert_missing_link_error(source, destination, target)
  File.write(File.join(source, "broken.md"), <<~MARKDOWN)
    ---
    permalink: /broken/
    ---
    [Broken note]({% link #{target} %})
  MARKDOWN
  begin
    build(source, destination)
    abort "Jekyll unexpectedly accepted an invalid post link: #{target}"
  rescue ArgumentError => error
    assert(error.message.include?(target), "Jekyll did not identify the invalid target: #{error.message}")
  ensure
    FileUtils.rm_f(File.join(source, "broken.md"))
  end
end

plugin = File.expand_path("../_plugins/unpublished-post-links.rb", __dir__)
Dir.mktmpdir("unpublished-post-links-") do |source|
  %w[_plugins _posts/notes _projects].each { |path| FileUtils.mkdir_p(File.join(source, path)) }
  FileUtils.cp(plugin, File.join(source, "_plugins", File.basename(plugin)))
  File.write(File.join(source, "_plugins", "empty-page-fixture.rb"), <<~'RUBY')
    class EmptyPageFixture < Jekyll::Generator
      def generate(site)
        page = Jekyll::PageWithoutAFile.new(site, site.source, "empty", "index.html")
        page.content = nil
        site.pages << page
      end
    end
  RUBY

  published_path = "_posts/2000-01-01-published.md"
  draft_path = "_posts/notes/2000-01-02-draft.md"
  links = <<~MARKDOWN
    [Public note]({% link #{published_path} %})

    [Draft **note**]({% link #{draft_path} %})

    | Reading plan |
    | --- |
    | [Draft [nested] label]({% link #{draft_path} %}) |
  MARKDOWN
  index = "---\npermalink: /\n---\n\n#{links}"
  public_note = "---\ntitle: Public note\npermalink: /published/\n---\n\n#{links}"
  draft_note = "---\ntitle: Draft note\npermalink: /draft/\npublished: false\n---\n\nDraft body.\n"
  project = "---\ntitle: Project\npermalink: /project/\n---\n\n#{links}"
  File.write(File.join(source, "index.md"), index)
  File.write(File.join(source, published_path), public_note)
  File.write(File.join(source, draft_path), draft_note)
  File.write(File.join(source, "_projects", "project.md"), project)
  File.write(File.join(source, "_posts", "README.md"), "This is not a dated post.\n")

  production = File.join(source, "_site-production")
  build(source, production)
  assert(!File.exist?(File.join(production, "draft", "index.html")), "Production wrote an unpublished post")
  assert(File.read(File.join(production, "empty", "index.html")).empty?, "Generated empty page changed")
  %w[index.html published/index.html project/index.html].each do |path|
    rendered = html(File.join(production, path))
    assert(rendered.at_css('a[href="/preview/published/"]'), "Published link missing in #{path}")
    assert(!rendered.at_css('a[href="/preview/draft/"]'), "Unpublished link remains in #{path}")
    assert(rendered.text.include?("Draft note"), "Draft title disappeared in #{path}")
    assert(rendered.at_css("strong")&.text == "note", "Draft label formatting lost in #{path}")
    assert(rendered.at_css("td")&.text == "Draft [nested] label", "Draft table label changed in #{path}")
  end
  assert(File.read(File.join(source, "index.md")) == index, "Page source was modified")
  assert(File.read(File.join(source, published_path)) == public_note, "Post source was modified")
  assert(File.read(File.join(source, draft_path)) == draft_note, "Draft source was modified")

  preview = File.join(source, "_site-preview")
  build(source, preview, unpublished: true)
  assert(File.exist?(File.join(preview, "draft", "index.html")), "Preview omitted the unpublished post")
  %w[index.html published/index.html project/index.html].each do |path|
    assert(html(File.join(preview, path)).css('a[href="/preview/draft/"]').size == 2,
           "Preview did not restore both draft links in #{path}")
  end

  assert_missing_link_error(source, File.join(source, "_site-missing"), "_posts/2000-01-03-missing.md")
  assert_missing_link_error(source, File.join(source, "_site-non-post"), "_posts/README.md")
end

puts "Unpublished link checks passed: production, collections, generated pages, source preservation, preview, and invalid targets."
