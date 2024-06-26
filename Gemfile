# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.2'

gem 'ar_lazy_preload'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'draper'
gem 'google-cloud-storage'
gem 'importmap-rails'
gem 'kamal', require: false
gem 'pg', '~> 1.1'
gem 'puma'
gem 'rails', '~> 7.2.0.beta'
gem 'recaptcha'
gem 'stackprof' # Must come becore sentry-rails for Sentry profiling
gem 'sentry-rails' # rubocop:disable Bundler/OrderedGems
gem 'slim-rails'
gem 'sprockets-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'rack-mini-profiler'
end

group :test do
  gem 'faker'
  gem 'fuubar', require: false
end
