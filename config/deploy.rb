# config valid only for current version of Capistrano
lock '3.4.0'

# before :deploy, :deploy_from_local_repo

set :application, 'test_app'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/test_app'
set :repo_url, 'https://github.com/ramanmasurkar/test_app.git'
# Default value for :scm is :git
set :scm, :git
set :use_sudo, true

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

# task :deploy_from_local_repo do
#   set :repo_url,  "file:///tmp/.git"
#   run_locally do
#     execute "tar -zcvf /tmp/repo.tgz .git"
#   end
#   on roles(:all) do
#     upload! '/tmp/repo.tgz', '/tmp/repo.tgz'
#     execute 'tar -zxvf /tmp/repo.tgz -C /tmp'
#   end
# end
