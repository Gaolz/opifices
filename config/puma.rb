threads 0,12
workers 1
environment 'production'
pidfile '/tmp/opifices.pid'
state_path '/tmp/opifices.state'
daemonize true
bind 'unix:///var/run/opifices.sock'
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end