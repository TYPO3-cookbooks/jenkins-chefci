describe package('chefdk') do
  it { should be_installed }
end

# verify that the jenkins user can access the docker socket
# -> does not work when testing in docker..
#describe command('sudo -H -u jenkins docker ps') do
#  its('exit_status') { should eq 0 }
#end

describe package('docker-engine') do
  before do
    # currently (June 2017, Docker CE 17) not possible to install
    # inside Docker (when running in CI)
    skip
  end
  it { should be_installed }
end
