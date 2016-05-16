# instead of multiple execute, a single bash resource or a script can be used

execute 'innobackup' do
  command 'innobackupex --no-timestamp --user=root --password=v /home/ubuntu/base/'
  notifies :run, 'execute[scp-backup]', :immediately
end


execute 'scp-backup' do
  command 'sudo scp -r -i /home/ubuntu/vaibhav.pem /home/ubuntu/base/ ubuntu@52.207.246.181:/home/ubuntu/base'
  action :nothing
end

file '/home/ubuntu/user.sql' do
  content 'CREATE USER \'repl\'@\'localhost\' IDENTIFIED BY \'v\';'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :run, 'execute[create-user]', :immediately
end


#here template can be used
file '/home/ubuntu/permission.sql' do
  content "GRANT REPLICATION SLAVE ON *.*  TO 'repl'@'52.207.246.181'IDENTIFIED BY 'v';"
  mode '0755'
  owner 'root'
  group 'root'
  notifies :run, 'execute[grant-user]', :immediately
end


execute 'grant-user' do
  command "sudo mysql -u root -pv < /home/ubuntu/permission.sql"
  action :nothing
end


execute 'create-user' do
  command "sudo mysql -u root -pv < /home/ubuntu/user.sql"
  notifies :run, 'execute[grant-user]', :immediately
  action :nothing
end


#this runs on master
#use <db_name;
#automate: log position, file name
#status=/tmp/show_master_status.txt
#mysql -u root -pv -ANe "SHOW MASTER STATUS" > ${status}
#CURRENT_LOG=`cat ${status} | awk '{print $1}'`
#CURRENT_POS=`cat ${status} | awk '{print $2}'`
#echo ${CURRENT_LOG} ${CURRENT_POS}


