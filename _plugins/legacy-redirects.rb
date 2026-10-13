# frozen_string_literal: true

# Preserve renamed taxonomy indexes; published post permalinks remain unchanged.
module Notebook
  class LegacyRedirects < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      occupied = (site.pages + site.posts.docs + site.collections.values.flat_map(&:docs)).map(&:url)
      Array(site.data['legacy_redirects']).each do |entry|
        from = entry.fetch('from')
        next if occupied.include?(from)

        target = entry.fetch('to')
        # Draft-only tags have no public archive until their notes are published.
        target = '/notes/' unless occupied.include?(target.split('#', 2).first)
        page = Jekyll::PageWithoutAFile.new(site, site.source, from.delete_prefix('/'), 'index.html')
        page.data = { 'layout' => 'redirect', 'redirect_target' => target,
                      'permalink' => from, 'sitemap' => false }
        site.pages << page
        occupied << from
      end
    end
  end
end
