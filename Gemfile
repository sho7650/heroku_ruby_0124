source 'https://rubygems.org'

ruby "3.4.9"

gem 'rails', '~> 7.2.3'
gem 'puma', '~> 6.4'
gem 'rack', '~> 2.2', '>= 2.2.13'
gem 'nokogiri', '~> 1.16'
gem 'sprockets-rails'
gem 'pagy', '~> 9.0'
gem 'rake'

group :development do
  gem 'sqlite3', '~> 2.0'
  gem 'web-console', '>= 4.2'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'bundler-audit', require: false
  gem 'brakeman', require: false
end

group :test do
  gem 'rails-controller-testing'
  gem 'pg', '~> 1.5'
end

group :production do
  gem 'pg', '~> 1.5'
  gem 'uglifier'
end
