=begin
#<
Sets up Authentication for Chef-Client towards Jenkins

This is one possbile implementation for handling this.
For more details, see the Jenkins cookbook documentation.

Nothing will be done, if your wrapper cookbook already defined
node.run_state[:jenkins_private_key]
#>
=end

require 'openssl'
require 'net/ssh'


unless node.run_state[:jenkins_private_key]

  # defaults to /etc/chef-jenkins-api.key
  key_path = node['jenkins_chefci']['jenkins_private_key_path']

  begin
    Chef::Log.info 'Trying to read private key from ' + key_path + ' for the chef user in jenkins'
    key = OpenSSL::PKey::RSA.new File.read(key_path)
    Chef::Log.info 'Successfully read existing private key'
  rescue
    key = OpenSSL::PKey::RSA.new 2048
    Chef::Log.info 'Generating new key pair for the chef user in jenkins in ' + key_path

    file key_path do
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

end
