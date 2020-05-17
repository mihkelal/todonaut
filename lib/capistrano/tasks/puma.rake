# frozen_string_literal: true

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

set :systemd_service_name, 'puma-todonaut'
namespace :deploy do
  desc 'Reload puma systemctl service'
  task :reload do
    on roles(:app) do
      execute "sudo systemctl reload #{fetch(:systemd_service_name)}"
    end
  end

  after :publishing, :reload
end
