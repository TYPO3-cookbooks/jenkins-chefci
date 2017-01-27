node['jenkins_chefci']['jenkins_plugins'].each_with_index do |plugin_with_version, index|
  plugin, version = plugin_with_version.split(':')
  jenkins_plugin plugin do
    version version
    install_deps false
  end
end

# we want to restart Jenkins if any plugin changed
file File.join(Chef::Config[:file_cache_path], 'jenkins-plugins-last-state') do
  content node['jenkins_chefci']['jenkins_plugins']
  notifies :execute, 'jenkins_command[safe-restart]', :immediately
end
