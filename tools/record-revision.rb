#!/usr/bin/env ruby
# frozen_string_literal: true

# Record an intentional edit to a preserved note in docs/content-preservation.json.
# The previous checksums move into revision_history together with the commit
# that contains them, and the note is appended to revision_note. Afterwards
# tools/validate.rb accepts the new body. Uses only Ruby standard libraries.
#
# Usage: ruby tools/record-revision.rb --note "Why the body changed" PATH [PATH...]
require "date"
require "digest"
require "json"
require "open3"
require "optparse"
require "pathname"
require_relative "validate"

MANIFEST = "docs/content-preservation.json"

def git(root, *args)
  output, status = Open3.capture2("git", "-C", root, *args, binmode: true)
  status.success? ? output : nil
end

def digests(body)
  [Digest::SHA256.hexdigest(body), Digest::SHA256.hexdigest(body.gsub("\r\n".b, "\n".b))]
end

# The most recent commit whose copy of +path+ has one of the +recorded+ checksums.
def commit_with_body(root, path, recorded)
  commits = git(root, "log", "--format=%H", "-n", "100", "--", path).to_s.split
  commits.find do |commit|
    blob = git(root, "show", "#{commit}:#{path}")
    blob && (digests(SourceValidator.body(blob)) & recorded).any?
  rescue ArgumentError
    false
  end
end

note = nil
date = Date.today.iso8601
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby tools/record-revision.rb --note TEXT PATH [PATH...]"
  opts.on("-n", "--note TEXT", "Reason for the intentional change (required)") { |text| note = text.strip }
  opts.on("--date YYYY-MM-DD", "Revision date (default: today)") { |value| date = Date.iso8601(value).iso8601 }
  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

begin
  parser.parse!
  raise OptionParser::MissingArgument, "--note and at least one PATH are required" if note.to_s.empty? || ARGV.empty?
rescue OptionParser::ParseError, Date::Error => e
  warn e.message
  warn parser.banner
  exit 1
end

root = File.expand_path("..", __dir__)
manifest_path = File.join(root, MANIFEST)
manifest = JSON.parse(File.read(manifest_path, encoding: "UTF-8"))
recorded_any = false

ARGV.each do |argument|
  path = Pathname.new(File.expand_path(argument)).relative_path_from(Pathname.new(root)).to_s
  entry = manifest["files"].find { |item| item["current_path"] == path }
  abort "#{path}: not listed in #{MANIFEST}" unless entry

  raw, lf = digests(SourceValidator.body(File.binread(File.join(root, path))))
  recorded = [entry["body_sha256"], entry["body_lf_sha256"]].compact
  if recorded.include?(raw) || recorded.include?(lf)
    puts "#{path}: body matches the manifest; nothing to record"
    next
  end

  previous_commit = commit_with_body(root, path, recorded)
  warn "#{path}: no commit contains the recorded body; previous_commit left empty" unless previous_commit
  (entry["revision_history"] ||= []) << {
    "date" => date,
    "previous_commit" => previous_commit,
    "body_sha256" => entry["body_sha256"],
    "body_lf_sha256" => entry["body_lf_sha256"]
  }
  entry["body_sha256"] = raw
  entry["body_lf_sha256"] = lf
  entry["revision_note"] = [entry["revision_note"], "#{date}: #{note}"].compact.join(" ")
  recorded_any = true
  puts "#{path}: recorded revision (previous body in #{previous_commit ? previous_commit[0, 7] : 'unknown commit'})"
end

File.write(manifest_path, JSON.pretty_generate(manifest) + "\n") if recorded_any
