set :application, 'amad'
# set :repo_url, 'git@example.com:me/my_repo.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/var/www/#{application}"
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5
#

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:keys] = ["./comadSSHKey.pem"]

require 'aws-sdk'

AWS.config({
    :access_key_id => 'AKIAJ2PHR4GQQ4YPAGHA',
      :secret_access_key => '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',
        :region => 'ap-northeast-1'
})

instances = AWS.ec2.instances.select {|i| i.tags[:Project] == 'Comad' && i.status == :running}.map(&:dns_name)

role :app, *instances

