namespace :env do
  task :staging do

    set :user,          "vagrant"
    set :group,         "vagrant"
    set :ssh_options,   "-A"
    set :forward_agent, true     # SSH forward_agent.

    set :domain,        "webhost"
    set :rails_env,     "production"

    # call default config
    invoke :'defaults:configs'
  end
end
