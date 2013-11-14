set :application, 'bargainburg.backend'
set :repo_url, 'git@github.com:startuphokie/bargainburg.backend.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/api/bargainburg'
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  #after :restart, :clear_cache do
    #on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    #end
  #end

  # copy database.yml into project
  task :copy_database_config do
    on roles(:app) do
      production_db_config = "/home/api/database.yml"
      execute "cp #{production_db_config} #{current_path}/config/database.yml"
      `puts "replaced database.yml with live copy"` 
    end
  end

  task :create_tmp do 
    on roles(:app) do
      execute "mkdir #{current_path}/tmp"
    end
  end

  task :symlink_directories do
    run "ln -nfs #{shared_path}/coupons #{release_path}/public/coupons"
  end

  task :symlink_setup do
    run "mkdir -p #{shared_path}/coupons"
  end

  before "deploy:restart", "deploy:symlink_directories"
  before "deploy:restart", "deploy:copy_database_config"
  before "deploy:restart", "deploy:create_tmp"
  before "deploy:symlink_directories", "deploy:symlink_setup"
  after :finishing, 'deploy:cleanup'

end
