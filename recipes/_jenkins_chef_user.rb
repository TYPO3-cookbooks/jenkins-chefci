=begin
#<
Sets up Authentication for Chef-Client
#>
=end

require 'openssl'
require 'net/ssh'

# defaults to /etc/chef-jenkins-api.key
jenkins_chefci_private_key_path = node['jenkins_chefci']['jenkins_private_key_path']

begin
  Chef::Log.info 'Trying to read private key from ' + jenkins_chefci_private_key_path + ' for the chef user in jenkins'
  key = OpenSSL::PKey::RSA.new File.read(jenkins_chefci_private_key_path)
  Chef::Log.info 'Successfully read existing private key'
rescue
  key = OpenSSL::PKey::RSA.new 2048
  Chef::Log.info 'Generating new key pair for the chef user in jenkins in ' + jenkins_chefci_private_key_path

  file jenkins_chefci_private_key_path do
    content key.to_pem
    mode 0500
    sensitive true
  end
end

public_key = [key.ssh_type, [key.to_blob].pack('m0'), 'auto-generated key'].join(' ')

# Create the Jenkins user with the public key
jenkins_user 'chef' do
  id 'chef@' + Chef::Config[:node_name]
  full_name 'Chef Client'
  public_keys [public_key]
end

# Set the private key on the Jenkins executor
node.run_state[:jenkins_private_key] = key.to_pem
