# frozen_string_literal: true

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
end
# frozen_string_literal: true

namespace :rails do
  desc 'open the bash in Rails.root on each of the remote servers'
  task :bash do
    on roles(:app) do
      execute_interactively('bash')
    end
  end

  desc 'open the rails console on each of the remote servers'
  task :console do
    on roles(:app) do
      app_env = fetch(:app_env)
      rails_env = fetch(:rails_env)
      execute_interactively("bundle exec rails c -e #{rails_env}")
    end
  end

  def execute_interactively(command)
    exec "ssh #{host.user}@#{host} -t 'cd #{deploy_to}/current && source /etc/profile && #{command}'"
  end
end
