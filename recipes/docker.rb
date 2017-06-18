=begin
#<
Installs Docker
#>
=end

# does not work on the Jenkins server...
return if node['virtualization'] && node['virtualization']['role'] == 'guest' && node['virtualization']['system'] == 'docker'

apt_repository 'docker' do
  uri 'https://apt.dockerproject.org/repo'
  distribution "#{node['platform']}-#{node['lsb']['codename']}"
  components ['main']
  key 'https://apt.dockerproject.org/gpg'
end

package 'docker-engine'

# add jenkins to the docker group, so that it doesn't need to use
# sudo.  Alternatively, we could configure sudo such that jenkins can
# run "docker" without a password. / compare the .kitchen.docker.yml that we write.
group 'docker' do
  members 'jenkins'
  append true
  action :modify
  notifies :restart, 'service[jenkins]'
end
