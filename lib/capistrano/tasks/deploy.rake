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
