# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'ar_lazy_preload'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'draper'
gem 'google-cloud-storage'
gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'puma'
gem 'pundit'
gem 'rails', '~> 7.0.0'
gem 'recaptcha'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'webdrivers'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors', '< 2.10' # 2.10 mistakenly requires sassc. Not going to add that.
  gem 'capistrano', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-asdf', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'rack-mini-profiler'
end

group :test do
  gem 'faker'
  gem 'fuubar', require: false
end
