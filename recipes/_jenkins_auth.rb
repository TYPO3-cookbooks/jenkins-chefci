=begin
#<
Sets up Authentication
#>
=end

require 'openssl'
require 'net/ssh'

if node['jenkins']['private_key']
  Chef::Log.info 'Using existing private key for the chef user in jenkins'
  key = OpenSSL::PKey::RSA.new node['jenkins']['private_key']
else
  Chef::Log.info 'Generating new key pair for the chef user in jenkins'
  key = OpenSSL::PKey::RSA.new 2048
  # IO.write(File.join(Chef::Config[:file_cache_path], "chef-jenkins.pem"), key.to_pem)
  node.set['jenkins']['private_key'] = key.to_pem
end

private_key = key.to_pem
public_key = [key.ssh_type, [key.to_blob].pack('m0'), 'auto-generated key'].join(' ')

# Create the Jenkins user with the public key
jenkins_user 'chef' do
  id 'chef@' + Chef::Config[:node_name]
  full_name 'Chef Client'
  public_keys [public_key]
end

# Set the private key on the Jenkins executor
node.run_state['jenkins_private_key'] = private_key
