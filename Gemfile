# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'draper'
gem 'google-cloud-storage'
gem 'listen'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'pundit'
gem 'rails', '~> 6.1.0'
gem 'slim-rails'
gem 'turbolinks'
gem 'turbolinks_render'
gem 'webpacker'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
  gem 'pry-rails'
  gem 'rack-mini-profiler'
  gem 'spring'
end
