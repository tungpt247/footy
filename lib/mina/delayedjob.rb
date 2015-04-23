namespace :delayedjob do
  desc 'DelayedJob default config'
  task :configs do
    # set default for delay job
    set :delayed_job, lambda { "bin/delayed_job" }
    set :delayed_job_pid_dir, lambda { "#{deploy_to}/#{shared_path}/pids" }
    set :delayed_job_processes, 1
  end
end
