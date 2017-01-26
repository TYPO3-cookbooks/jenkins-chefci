include_recipe 'jenkins::master'

jenkins_command 'safe-restart' do
  action :nothing
  # restart Jenkins, if Java is updated
  subscribes :execute, 'log[jdk-version-changed]', :delayed
end

node['jenkins_chefci']['jenkins_plugins'].each_with_index do |plugin_with_version, index|
  plugin, version = plugin_with_version.split(':')
  jenkins_plugin plugin do
    version version
    install_deps false
    # we want to restart Jenkins after the last plugin installation
    notifies :execute, "jenkins_command[safe-restart]", :immediately if index == node['jenkins_chefci']['jenkins_plugins'].length - 1
  end
end