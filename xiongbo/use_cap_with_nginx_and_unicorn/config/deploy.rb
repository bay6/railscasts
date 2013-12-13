set :application, 'test_app'
set :repo_url, 'git@github.com:xiongbo/test_app.git'
set :branch, 'master'
set :pty, true
set :scm, :git
set :deploy_to, '/var/www/test_app'
set :log_level, :debug
set :rbenv_ruby, '2.0.0-p247'
set :ssh_options, {
  forward_agent: true
}


set :format, :pretty

#set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 3

namespace :unicorn do 
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
    end
  end
end

namespace :deploy do 

  desc "copy database config"
  task :database_config do
    on roles(:all) do
      execute :mv, "#{current_path}/config/database.yml.example", "#{current_path}/config/database.yml"
      puts "need to edit the config files in #{shared_path}."
    end
  end

  after "deploy:published", "deploy:database_config"

  task :symlink_config do
    on roles(:all) do
      execute :ln, "-nfs", "#{current_path}/config/nginx.conf", "/etc/nginx/sites-enabled/#{fetch(:application)}.conf"
      execute :ln, "-nfs", "#{current_path}/config/unicorn_init.sh", "/etc/init.d/unicorn_#{fetch(:application)}"
      # execute :ln, "-nfs",  "#{shared_path}/config/database.yml #{current_path}/config/database.yml" 
    end
  end
  after "deploy:published", "deploy:symlink_config"

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
