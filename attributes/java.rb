#<> Sets the required Java version
default['java']['jdk_version'] = (node['platform'] == 'debian') ? '7' : '8'

#<> Sets the Java installation distribution
default['java']['install_flavor'] = 'openjdk'
