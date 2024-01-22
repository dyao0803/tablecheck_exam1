# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'dotenv-rails', '~> 2.7'
gem 'pg', '~> 1.5.4'
gem "sqlite3", "~> 1.4"
gem 'rack-cors'
gem 'rails', '~> 7.1.2'
gem 'typhoeus'

gem 'opentelemetry-instrumentation-all'
gem 'opentelemetry-sdk'
gem 'opentelemetry-semantic_conventions'
gem 'benchmark'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry', '~> 0.14.1'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'simplecov', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'tzinfo-data', platforms: %i[windows jruby]
