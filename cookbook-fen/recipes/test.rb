
execute "test" do
     command "echo hi"
end

execute "mysql-set-replication" do
	command "rm -rf /home/ubuntu/testing.txt"
	action :nothing
	subscribes :run, resources("execute[test]"), :immediately
end

