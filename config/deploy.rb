require "rvm/capistrano"
set :user, "root"
set :application, "membermms"
set :deploy_to, "/mnt/#{application}"
set :repository,  "git@github.com:michaelsaunders/membersmmms.git"

role :web, "107.21.49.78"                          # Your HTTP server, Apache/etc
role :app, "107.21.49.78"                         # This may be the same as your `Web` server
role :db,  "107.21.49.78", :primary => true # This is where Rails migrations will run

set :deploy_via, :remote_cache
set :scm, :git
set :scm_verbose, true
set :rails_env, "production"
set :use_sudo, false
set :branch, "master"
default_run_options[:pty] = true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


ssh_options[:forward_agent] = true
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end true
# end

