=begin
#<
ChefDK setup

Helpful, if this node should be able to run chef-related commands.

#>
=end

chef_dk cookbook_name do
  version node['jenkins_chefci']['chefdk_version']
  global_shell_init true
  action :install
end

# required for jsonlint
package "build-essential"

%w(
  kitchen-docker
  jsonlint
  yaml-lint
  rails-erb-check
).each do |gem|
  gem_package gem do
    gem_binary "/opt/chefdk/embedded/bin/gem"
    options "--no-document --no-user-install"
  end
end

# Ideally, this should work as follows:
# jenkins_chefci_chefdk_gem_package 'kitchen-docker'

###########################
# Chef / Knife
###########################

directory "#{node['jenkins']['master']['home']}/.chef/" do
  owner 'jenkins'
  group 'jenkins'
end

template "#{node['jenkins']['master']['home']}/.chef/config.rb" do
  owner 'jenkins'
  group 'jenkins'
  source 'chef-config.rb.erb'
  variables(
    node_name: node['jenkins_chefci']['knife_config'].key?('node_name') ? node['jenkins_chefci']['knife_config']['node_name'] : "jenkins",
    chef_server_url: node['jenkins_chefci']['knife_config']['chef_server_url']
  )
end

# place either the client key defined in the attributes, or create only a template file with correct permissions
file "#{node['jenkins']['master']['home']}/.chef/client.pem" do
  owner 'jenkins'
  group 'jenkins'
  # variant with chef client key available
  content node['jenkins_chefci']['knife_client_key'].tr("|", "\n") if node['jenkins_chefci']['knife_client_key']
  action :create if node['jenkins_chefci']['knife_client_key']
  # variant without key available
  content 'Manually replace this with the real client.pem!' unless node['jenkins_chefci']['knife_client_key']
  action :create_if_missing unless node['jenkins_chefci']['knife_client_key']
end
#
###########################
# Test-Kitchen
###########################
#
# directory "#{node['jenkins']['master']['home']}/.kitchen/" do
#   owner "jenkins"
#   group "jenkins"
# end
#
# template "#{node['jenkins']['master']['home']}/.kitchen/config.yml" do
#   owner "jenkins"
#   group "jenkins"
#   source "kitchen-default.yml.erb"
# end
