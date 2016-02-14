require 'rspec'

def safely_require(file)
  require_relative file
rescue LoadError
end

safely_require '../lib/post_refactor'
safely_require '../lib/comment'
safely_require '../lib/user'
safely_require '../hn_scraper_refactor'