require 'hipchat/capistrano'
# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'memocity_caller'
set :repo_url, 'git@github.com:nico01f/memocity_caller.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/memocity_caller'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
set :format, :pretty

set :hipchat_token, "Hx29Lcmtxo6o6RmZAn3rvBTWAf9a00SaEPGd11jk"
set :hipchat_room_name, "pruebas"
# Optional
set :hipchat_enabled, true # set to false to prevent any messages from being sent
set :hipchat_announce, false # notify users
set :hipchat_color, 'yellow' #normal message color
set :hipchat_success_color, 'green' #finished deployment message color
set :hipchat_failed_color, 'red' #cancelled deployment message color
set :hipchat_message_format, 'html' # Sets the deployment message format, see https://www.hipchat.com/docs/api/method/rooms/message
set :hipchat_options, {
  :api_version  => "v2" # Set "v2" to send messages with API v2
}
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

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
