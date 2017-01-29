property :login, String, name_property: true
property :cookbook, String
property :credentials_id, String
property :repository_pattern, String, default: '.*'

action :create do

  job_xml = ::File.join(Chef::Config[:file_cache_path], "github-org-#{login}.xml")

  template job_xml do
    source "jenkins-jobs/github-organization-folder/job-config.xml.erb"
    variables(
      name: login,
      scanCredentials: credentials_id,
      repository_pattern: repository_pattern
      # TODO there are few more paramters, e.g. about building PRs..
    )
    cookbook cookbook
    notifies :create, "jenkins_job[#{login}]", :immediately
  end

  jenkins_job login do
    action :nothing
    config job_xml
  end
end

action :delete do
  jenkins_job login do
    action :delete
  end
end
