require 'spec_helper'

describe 'jenkins-chefci::chefdk' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
  end

  it 'installs gem kitchen-docker' do
    expect(chef_run).to install_jenkins_chefci_chefdk_gem_package('kitchen-docker')
    # expect(chef_run).to install_gem_package('kitchen-docker').with(gem_binary: "/opt/chefdk/embedded/bin/gem")
  end

end
