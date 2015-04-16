$:.unshift './lib'
require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/rsync'

# custom mina tasks
require 'mina/defaults'
require 'mina/extras'
require 'mina/db'
require 'mina/nginx'
require 'mina/unicorn'

set :app, 'footy'
set :domain, 'webhost.vps'

set :deploy_to, "/home/vagrant/#{app}"
set :repository, "https://github.com/tungpt247/footy.git"
set :branch, "develop"
set :rails_env, 'production'

set :user, 'vagrant' # Username in the server to SSH to.
set :group, 'vagrant'
set :ssh_options, "-A"
set :forward_agent, true     # SSH forward_agent.

invoke :'defaults:configs'
# For system-wide RVM install.
set :rvm_path, '/usr/local/rvm/bin/rvm'
# set :term_mode, nil
# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, [
  'config/database.yml',
  'log',
  'config/unicorn.rb',
  'config/database.yml',
  'config/nginx.production.conf',
  'config/secrets.yml',
  'config/unicorn_init.sh']

set :rsync_options, %w[
  --recursive --delete --delete-excluded
  --exclude .git*
  --exclude /test/***
  --exclude /spec/***
  --exclude /features/***
  --exclude /lib/mina
]

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.2.0@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.

desc "Setup server."
task :setup => :environment do
  queue! %[sudo chown -R vagrant "#{deploy_to}"]
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/deploy"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/deploy"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    # invoke :'rsync:deploy'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'nginx:restart'
      invoke :'unicorn:stop'
      invoke :'unicorn:start'
    end
  end
end
