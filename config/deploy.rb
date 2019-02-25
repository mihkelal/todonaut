# frozen_string_literal: true

set :application, 'todonaut'
set :user, 'app'

set :deploy_to, "/var/www/#{fetch(:application)}"
set :linked_dirs, %w[.bundle log public/system public/uploads tmp/cache tmp/pids tmp/sockets vendor/bundle]
set :linked_files, %w[config/master.key]
set :puma_init_active_record, true
# set :puma_preload_app, true # Not sure if necessary
set :repo_url, 'git@github.com:mihkelal/todonaut.git'
set :rvm_ruby_version, '2.6.0'
set :rvm_custom_path, '/usr/share/rvm' # Custom RVM installation in DO server. See https://github.com/capistrano/rvm
