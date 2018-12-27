set :application, 'do-mihkel'
set :user, 'mihkel'

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :linked_dirs,  %w{.bundle log public/system public/uploads tmp/cache tmp/pids tmp/sockets vendor/bundle}
set :linked_files, %w{config/master.key}
set :puma_init_active_record, true
# set :puma_preload_app, true # Not sure if necessary
set :repo_url, 'git@github.com:mihkelal/do-mihkel.git'
set :rvm_ruby_version, '2.6.0'
