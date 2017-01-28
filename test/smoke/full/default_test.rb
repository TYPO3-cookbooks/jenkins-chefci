describe package('chefdk') do
  it { should be_installed }
end

# verify that the jenkins user can access the docker socket
# -> does not work when testing in docker..
#describe command('sudo -H -u jenkins docker ps') do
#  its('exit_status') { should eq 0 }
#end

describe package('docker-engine') do
  it { should be_installed }
end
