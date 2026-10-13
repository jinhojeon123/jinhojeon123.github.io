# frozen_string_literal: true

require "set"

# Keep reading plans in GitHub while their unpublished notes stay off the site.
# A title linking to an existing post omitted from site.posts is rendered as
# plain text. Publishing the post, or previewing with --unpublished, restores
# the original link without changing the source document or its body checksum.
module Notebook
  module UnpublishedPostLinks
    POST_FILENAME = /\A\d{4}-\d{2}-\d{2}-.+\.(?:md|markdown|html)\z/i
    MARKDOWN_LINK = /\[((?:\\.|[^\[\]\\]|\[[^\[\]]*\])*)\]\(\s*\{%-?\s*link\s+(_posts\/[^\s{}]+)\s*-?%\}\s*\)/

    module_function

    def refresh(site)
      visible = site.posts.docs.map { |post| File.expand_path(post.path, site.source) }.to_set
      sources = Dir.glob(File.join(site.source, "_posts", "**", "*")).select do |path|
        File.file?(path) && POST_FILENAME.match?(File.basename(path))
      end
      site.instance_variable_set(:@notebook_unpublished_post_paths, sources.to_set - visible)
    end

    def render(document)
      # Archive generators can create pages whose content is nil.
      return unless document.content.is_a?(String)

      hidden = document.site.instance_variable_get(:@notebook_unpublished_post_paths)
      return if hidden.nil? || hidden.empty?

      document.content = document.content.gsub(MARKDOWN_LINK) do |original|
        label = Regexp.last_match(1)
        path = File.expand_path(Regexp.last_match(2), document.site.source)
        # Unknown paths remain untouched, so Jekyll still reports broken links.
        hidden.include?(path) ? label : original
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  Notebook::UnpublishedPostLinks.refresh(site)
end

Jekyll::Hooks.register [:pages, :documents], :pre_render do |document|
  Notebook::UnpublishedPostLinks.render(document)
end
