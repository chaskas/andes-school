source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in school.gemspec.
gemspec

gem 'puma'

gem "sqlite3"

gem 'sprockets-rails'

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"
gem 'cssbundling-rails', '~> 1.4'
gem 'importmap-rails'
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'

gem 'erb_lint', require: false
gem 'overcommit'
gem 'rails_best_practices', require: false
gem 'rubocop', require: false
gem 'rubocop-rails', require: false

group :test do
  gem 'simplecov', require: false
  gem 'mocha'
end

# gem 'dotenv', groups: %i[development test], require: 'dotenv/load'
gem 'launchdarkly-server-sdk', '8.8.2'
gem 'dotenv-rails', require: 'dotenv/load'

gem 'turbo-rails'