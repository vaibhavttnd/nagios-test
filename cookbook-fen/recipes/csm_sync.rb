
cookbook_file "#{node['web_app']['user_dir']}/learning-cms-assets-code-deployment.sh" do
  source 'learning-cms-assets-code-deployment.sh'
  mode 0700
  user node['web_app']['user_name']
  group node['web_app']['group_name']
  action :create
end



env = { AWS_DEFAULT_REGION: 'us-east-1' }
exepath = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'


include_recipe "cron::default"
cron_d 'learning-cms-assets-code-deployment' do
  environment env
  path exepath
  day '*/15'
  command "bash #{node['web_app']['user_dir']}/learning-cms-assets-code-deployment.sh"
  user node['web_app']['user_name']
#  mailto 'system-alerts@fen.com'
end
