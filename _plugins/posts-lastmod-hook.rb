#!/usr/bin/env ruby
#
# Set last_modified_at from Git for changed collection documents: posts, and
# the tab and project pages, whose SEO dateModified and sitemap lastmod use it.

Jekyll::Hooks.register :documents, :post_init do |document|

  commit_num = `git rev-list --count HEAD "#{ document.path }"`

  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ document.path }"`
    document.data['last_modified_at'] = lastmod_date
  end

end
