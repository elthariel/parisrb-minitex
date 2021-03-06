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
##############################
# Handle SQLite db
require "capistrano-file_db"

before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby'
after 'deploy', 'file_db:symlink_db', 'file_db:chmod_db'


# Generate an additional task to fire up the thin clusters
namespace :deploy do
  desc "Start the Thin processes"
  task :start do
    run "cd #{deploy_to}/current && bundle exec thin start -C config/thin.yml"
  end

  desc "Stop the Thin processes"
  task :stop do
    run "cd #{deploy_to}/current && bundle exec thin stop -C config/thin.yml"
  end

  desc "Restart the Thin processes"
  task :restart do
    run "cd #{deploy_to}/current && bundle exec thin restart -C config/thin.yml"
  end
end
