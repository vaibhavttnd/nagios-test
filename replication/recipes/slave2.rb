service "mysql" do
  action :stop
  notifies :run, 'execute[copy]', :immediately
  action :nothing
end


execute 'copy' do
 command 'cp -a /home/ubuntu/base/. /var/lib/mysql/'
 notifies :run, 'execute[master]', :immediately
 action :nothing
end


#execute 'master' do
# command 'mysql --host=52.207.252.240 --user=repl --password=v'
# notifies :run, 'execute[sed]', :immediately
# action :nothing
#end



template '/etc/mysql/my.cnf' do
    source 'my.cnf.erb'
    owner 'root'
    group 'root'
    mode  '0755'
    variables( :id => '2')
end


execute 'mysql-start' do
 command "service mysql start"
 action :nothing
end

#ip can be used as an attribute !
#Note MASTER_LOG_FILE, MASTER_LOG_POSTION before replication


file '/home/ubuntu/bin-log.sql' do
  content "CHANGE MASTER TO MASTER_HOST='52.207.252.240',MASTER_USER='repl',MASTER_PASSWORD='v',MASTER_LOG_FILE='mysql-bin.000001',MASTER_LOG_POS=107;START SLAVE;"
#manual step ?
  mode '0755'
  owner 'root'
  group 'root'
  notifies :run, 'execute[log-file]', :immediately
end


execute 'log-file' do
  command "sudo mysql -u root -pv < /home/ubuntu/bin-log.sql"
  action :nothing
end
