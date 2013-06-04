set :application, "Minitex API server"
set :repository, 'git://github.com/elthariel/parisrb-minitex.git'
set :deploy_to, '/home/tex/api'
set :user, 'tex'

# Roles
role :web, "tex.lta.io"
role :app, "tex.lta.io"
role :db,  "tex.lta.io", :primary => true

###########
# Git stuff
set :scm, :git
set :scm_verbose, true
set :use_sudo, false
set :deploy_via, :remote_cache

##########
# RVM stuf
set :rvm_ruby_string, "ruby-2.0.0-p0"
require "rvm/capistrano"

##############################
# Automatically install bundle
require "bundler/capistrano"

before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
