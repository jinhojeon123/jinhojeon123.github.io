# frozen_string_literal: true

source "https://rubygems.org"

# 1. Jekyll 버전을 4.3.4로 고정 (4.4.1 에러 방지)
gem "jekyll", "4.3.4"

# 2. 누락된 jekyll-paginate 추가 (현재 에러 해결)
gem "jekyll-paginate"

# 테마 및 필수 플러그인
gem "jekyll-remote-theme"
gem "jekyll-sitemap"
gem "jekyll-seo-tag"
gem "jekyll-feed"

# 테스트용
gem "html-proofer", "~> 5.0", group: :test

# 윈도우 환경 호환성
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.2.0", :platforms => [:mingw, :x64_mingw, :mswin]