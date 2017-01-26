include_recipe 'jenkins::master'

# restart Jenkins, if Java is updated
service 'jenkins' do
  action :restart
  subscribes :restart, 'log[jdk-version-changed]', :delayed
end