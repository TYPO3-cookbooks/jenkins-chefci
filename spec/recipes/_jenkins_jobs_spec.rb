require 'spec_helper'

describe 'jenkins-chefci::jenkins_jobs' do
  let(:org_name) { 'test' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04', file_cache_path: '/tmp') do |node|
      node.normal['jenkins_chefci']['github_organization'] = org_name
    end.converge(described_recipe)
  end

  it 'creates the job xml file on local disk' do
    expect(chef_run).to create_template("/tmp/github-org-test.xml")
  end

  it 'calls jenkins_job' do
    expect(chef_run).to create_jenkins_job(org_name)
  end
end
