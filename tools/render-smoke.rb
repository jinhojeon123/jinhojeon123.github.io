#!/usr/bin/env ruby
# frozen_string_literal: true

# Build a synthetic rendering fixture without writing a post or changing _site.
# Usage: bundle exec ruby tools/render-smoke.rb
# Serve _site-smoke on port 4001 and open /preview/validation-smoke/.
require "bundler/setup"
require "jekyll"
require "json"
require "nokogiri"

root = File.expand_path("..", __dir__)
destination = File.join(root, "_site-smoke", "preview")
ENV["JEKYLL_ENV"] = "production"

fixture = <<~'MARKDOWN'
  This synthetic page checks rendering only. It is not a mathematical research result or a scholarly citation.

  ## Inline and display mathematics

  Inline mathematics: $A x = b$ and $\|r_k\|_2 / \|r_0\|_2$.

  $$
  r_k = b - A x_k.
  $$

  ## Numbered equation and reference

  $$
  \begin{equation}
  A x = b. \label{eq:rendering-smoke}
  \end{equation}
  $$

  Reference to the numbered equation: $\eqref{eq:rendering-smoke}$.

  <div class="theorem" markdown="1">
  **Definition (rendering fixture).** The residual notation is $r=b-Ax$.
  </div>

  ## MATLAB

  ```matlab
  A = [2, -1; -1, 2];
  b = [1; 0];
  x = A \ b;
  ```

  ## Python

  ```python
  import numpy as np
  residual = b - A @ x
  print(np.linalg.norm(residual))
  ```

  ## C++ and MPI

  ```cpp
  #include <mpi.h>
  int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    MPI_Finalize();
    return 0;
  }
  ```

  ## Bash

  ```bash
  cmake -S . -B build
  cmake --build build
  mpirun -np 4 ./build/solver
  ```

  ## CMake

  ```cmake
  cmake_minimum_required(VERSION 3.20)
  project(rendering_fixture LANGUAGES CXX)
  find_package(MPI REQUIRED COMPONENTS CXX)
  add_executable(solver main.cpp)
  target_link_libraries(solver PRIVATE MPI::MPI_CXX)
  ```

  ## Pseudocode

  ```text
  r <- b - A*x
  while norm(r) > tolerance:
      update x
      r <- b - A*x
  ```

  ## Citation link

  This local navigation fixture links to [reference 1](#ref-rendering-fixture).

  {% include bibliography.html %}
MARKDOWN

Jekyll::Hooks.register :site, :post_read do |site|
  site.data["references"] ||= {}
  site.data["references"]["rendering-fixture"] = {
    "title" => "Validation fixture (not scholarly citation)",
    "authors" => "Local rendering check",
    "year" => 2000,
    "venue" => "Synthetic test data",
    "url" => "/about/"
  }

  page = Jekyll::PageWithoutAFile.new(site, site.source, "validation-smoke", "index.md")
  page.data.merge!(
    "layout" => "post", "title" => "Rendering smoke fixture",
    "description" => "Synthetic checks for mathematics, code, and references.",
    "permalink" => "/validation-smoke/", "status" => "note",
    "note_type" => "short-note", "math" => true, "equation_numbering" => "ams",
    "toc" => true, "comments" => false, "categories" => [], "tags" => [],
    "date" => Time.utc(2000, 1, 1), "references" => ["rendering-fixture"]
  )
  page.content = fixture
  site.pages << page
end

config = Jekyll.configuration(
  "source" => root,
  "config" => File.join(root, "_config.yml"),
  "destination" => destination,
  "baseurl" => "/preview",
  "cache_dir" => File.join(root, ".tools-runtime", "smoke-cache"),
  "incremental" => false
)
site = Jekyll::Site.new(config)
site.process

fixture_path = File.join(destination, "validation-smoke", "index.html")
html = Nokogiri::HTML(File.read(fixture_path, encoding: "UTF-8"))
languages = %w[matlab python cpp bash cmake text]
missing = languages.reject { |language| html.at_css(".language-#{language}") }
abort "Missing rendered code blocks: #{missing.join(', ')}" unless missing.empty?
%w[matlab python cpp bash cmake].each do |language|
  abort "No highlighted tokens for #{language}" unless html.at_css(".language-#{language} .highlight span")
end
abort "Missing theorem markup" unless html.at_css(".theorem strong")
abort "Missing bibliography entry" unless html.at_css("#ref-rendering-fixture")
abort "Expected one MathJax loader" unless html.css("#MathJax-script").length == 1
abort "Numbered math configuration missing" unless html.to_html.match?(/tags:\s*"ams"/)

report = {
  "fixture_url" => "/preview/validation-smoke/",
  "baseurl" => config["baseurl"],
  "post_urls" => site.posts.docs.map { |post| "/preview#{post.url}" }.sort,
  "legacy_redirects" => Array(site.data["legacy_redirects"]).map do |entry|
    { "from" => "/preview#{entry['from']}", "to" => "/preview#{entry['to']}" }
  end,
  "highlighted_languages" => languages,
  "production_destination_untouched" => File.join(root, "_site")
}
File.write(File.join(root, "_site-smoke", "rendering-report.json"), JSON.pretty_generate(report) + "\n")
puts "Rendering fixture generated: #{fixture_path}"
puts "HTML assertions passed; browser verification and HTMLProofer remain separate checks."
