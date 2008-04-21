set :application, 'www.horseandpeopletraining.com'
set :repository, "svn+ssh://steve@foo.finagle.org/var/local/svn/#{application}/trunk"
set :use_sudo, false
set :checkout, 'export'
set :keep_releases, 1

STAGE = ENV['STAGE'] || 'alpha'
case STAGE
  when /alpha/
    hosts = ['home.finagle.org']
    set :deploy_to, "/var/www/sites/#{application}"

  when /prod/
    hosts = [application]
    set :user, 'stevesloan'
    set :deploy_to, "/home/#{user}/sites/#{application}"
end
role :web, *hosts
role :app, *hosts
role :db, hosts.first, :primary => true

desc "Restart the FCGI processes on the app server as a regular user."
task :restart, :roles => :app do
  run "touch #{release_path}/public/dispatch.fcgi"
#  run "#{current_path}/script/process/reaper --dispatcher=dispatch.fcgi"
end

task :after_setup, :roles => [:app, :db, :web] do
  dirs = ['log', 'tmp', 'tmp/cache', 'tmp/session', 'tmp/sockets'].collect { |d| File.join shared_path, d }.join ' '

  run <<-END
    mkdir -p #{dirs} &&
    chmod o-w,g+wx #{dirs} -R
  END
end

