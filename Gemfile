# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'draper'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'pundit'
gem 'rails', '= 5.2.2'
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
  gem 'listen'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen'
end
