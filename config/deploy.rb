$:.unshift './lib'
require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)
require 'mina/rsync'

# custom mina task
require 'mina/defaults'
require 'mina/extras'
require 'mina/db'
require 'mina/nginx'
require 'mina/unicorn'

set :app          , 'footy'
set :deploy_to    , "/home/vagrant/#{app}"
set :user, 'vagrant'    # Username in the server to SSH to.
set :group, 'vagrant'
set :domain, 'webhost.vps'
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
  'config/unicorn.rb',
  'config/unicorn_init.sh']


set :rsync_options, %w[
  --recursive --delete --delete-excluded
  --exclude .git*
  --exclude /test/***
  --exclude /spec/***
  --exclude /features/***
  --exclude /lib/mina
]

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.2.0@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  # queue! %[sudo chown -R vagrant "#{deploy_to}"]
  # queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  # queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  # queue! %[mkdir -p "#{deploy_to}/#{shared_path}/deploy"]
  # queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/deploy"]

  # queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  # queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  # invoke :'db:update'

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # invoke :'git:clone'
    invoke :'rsync:deploy'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    # invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    # invoke :'deploy:cleanup'

    to :launch do
      # queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      # queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"

      invoke :'nginx:restart'
      invoke :'unicorn:stop'
      invoke :'unicorn:start'
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers




# $:.unshift './lib'
# require 'mina/bundler'
# require 'mina/rails'
# require 'mina/git'
# require 'mina/nginx'
# require 'mina/unicorn'
# require 'mina/rvm'
# # require 'mina/db'
# require 'mina/extras'
# require 'mina/rsync'

# # Basic settings:
# #   domain       - The hostname to SSH to.
# #   deploy_to    - Path to deploy into.
# #   repository   - Git repo to clone from. (needed by mina/git)
# #   branch       - Branch name to deploy. (needed by mina/git)
# set :shell, '/bin/bash -l'

# set :user, 'vagrant'    # Username in the server to SSH to.
# set :group, 'vagrant'
# set :domain, 'webhost.vps'
# set :ssh_options, "-A"
# # set :ssh_options ,  {
#   # set the user's private key file on the local environment
#   # keys:  %w(/Users/tungphan/2015/my-projects/chef/moonlight/.kitchen/kitchen-vagrant/kitchen-moonlight-moonlight-ubuntu-1404/.vagrant/machines/default/virtualbox/private_key) ,
#   # Forward_agent:  true
# # }
# # set :port, '22'
# set :rsync_options, %w[
#   --recursive --delete --delete-excluded
#   --exclude .git*
#   --exclude /test/***
#   --exclude /spec/***
#   --exclude /features/***
#   --exclude /lib/mina
# ]
# set :term_mode, nil # IMPORTANT hacking for frozen passwork enter

# set :app, 'footy'
# set :deploy_to,       "/var/www/footy"
# set :app_path,        "#{deploy_to}/#{current_path}"
# set :repository,      "https://github.com/tungpt247/footy.git"
# set :branch,          "develop"

# # ruby and rails stuff
# set :rails_env, 'production'
# set :rvm_path, "/usr/local/rvm/bin/rvm"
# # set :pids_path, "#{deploy_to}/#{shared_path}/pids"
# # set :sockets_path         , "#{deploy_to}/#{shared_path}/sockets"
# # set :unicorn_role,  'vagrant'

# # set :identity_file, '/Users/tungphan/2015/my-projects/chef/moonlight/.kitchen/kitchen-vagrant/kitchen-moonlight-moonlight-ubuntu-1404/.vagrant/machines/default/virtualbox/private_key'
# # For system-wide RVM install.

# # Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# # They will be linked in the 'deploy:link_shared_paths' step.
# set :shared_paths, [
#   'config/database.yml',
#   'log',
#   'config/unicorn.rb',
#   'config/database.yml',
#   'config/nginx.production.conf',
#   'config/secrets.yml',
#   'config/unicorn.rb',
#   'config/unicorn_init.sh']

# # Optional settings:
# #   set :user, 'foobar'    # Username in the server to SSH to.
# #   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# # This task is the environment that is loaded for most commands, such as
# # `mina deploy` or `mina rake`.
# task :environment do
#   # If you're using rbenv, use this to load the rbenv environment.
#   # Be sure to commit your .ruby-version or .rbenv-version to your repository.
#   # invoke :'rbenv:load'

#   # For those using RVM, use this to load an RVM version@gemset.
#   invoke :'rvm:use[ruby-2.2.0@default]'
# end

# # Put any custom mkdir's in here for when `mina setup` is ran.
# # For Rails apps, we'll make some of the shared paths that are shared between
# # all releases.
# task :setup => :environment do
#   # queue! %[sudo mkdir -p "#{deploy_to}" && sudo chown -R vagrant "#{deploy_to}"]
#   # queue! %[sudo mkdir -p "/var/www/footy" && sudo chown -R vagrant "/var/www/footy"]
#   # queue! "sudo mkdir -p #{deploy_to} && sudo chown -R vagrant #{deploy_to}"
#   queue! %[sudo chown -R ubuntu /var/www/]
#   queue! %[sudo chmod -R g+rwx,u+rwx "#{deploy_to}"]

#   queue! %[mkdir -p "#{deploy_to}/shared/log"]
#   queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/log"]

#   queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
#   queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

#   queue! %[mkdir -p "#{deploy_to}/shared/config"]
#   queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

#   # queue 'echo "Create PID and Sockets paths"'
#   # queue! %[mkdir -p #{pids_path} && chown #{user}:#{group} #{pids_path} && chmod +rw #{pids_path}]
#   # queue! %[mkdir -p #{sockets_path} && chown #{user}:#{group} #{sockets_path} && chmod +rw #{sockets_path}]

#   # queue! %[mkdir -p "#{deploy_to}/tmp"]
#   # queue! %[chmod g+rx,u+rwx "#{deploy_to}/tmp"]
#   # queue! %[mkdir -p "#{deploy_to}/tmp/pids"]
#   # queue! %[chmod g+rx,u+rwx "#{deploy_to}/tmp/pids"]

#   # queue! %[mkdir -p "#{deploy_to}/shared/log"]
#   # queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/log"]

#   # queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
#   # queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

#   # queue! %[mkdir -p "#{deploy_to}/shared/config"]
#   # queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

#   # queue! %[mkdir -p "/tmp/pids"]

#   invoke :'db:update'
#   invoke :'configs:update'

# end

# desc "Deploys the current version to the server."
# task :deploy => :environment do
#   deploy do
#     # Put things that will set up an empty directory into a fully set-up
#     # instance of your project.
#     # invoke :'git:clone'
#     invoke :'rsync:deploy'
#     invoke :'deploy:link_shared_paths'

#     invoke :'bundle:install'
#     invoke :'rails:db_migrate'
#     invoke :'rails:assets_precompile'
#     invoke :'deploy:cleanup'

#     to :launch do
#       invoke :'unicorn:restart'
#     end
#   end
# end

# # For help in making your deploy script, see the Mina documentation:
# #
# #  - http://nadarei.co/mina
# #  - http://nadarei.co/mina/tasks
# #  - http://nadarei.co/mina/settings
# #  - http://nadarei.co/mina/helpers

