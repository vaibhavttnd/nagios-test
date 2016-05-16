
user "#{node['web_app']['user_name']}" do
  comment 'Monitoring User'
  uid '1234'
  home "#{node['web_app']['user_dir']}"
  shell '/bin/bash'
  supports :manage_home => true
  action :create
end

#################### User created

directory "#{node['web_app']['user_dir']}/.ssh" do
  mode 0775
  user node['web_app']['user_name']
  group node['web_app']['group_name']
  action :create
end

####################  Directory created


cookbook_file "#{node[:web_app][:user_dir]}/.ssh/id_rsa" do
  source 'id_ed25519'      
  cookbook 'fen-apache2'  
  mode 0600
  owner node['web_app']['user_name']
  group node['web_app']['group_name']
  action :create
end


####################  Private Key passed
