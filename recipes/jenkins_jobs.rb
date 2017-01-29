node.run_state[:jenkins_chefci_github_token] ||= node['jenkins_chefci']['github_credentials']['token']

github_login = node['jenkins_chefci']['github_credentials']['login']

if github_login
  jenkins_password_credentials github_login do
    id 'github-token'
    password node.run_state[:jenkins_chefci_github_token]
    description 'Github API token'
  end
end

jenkins_chefci_github_organization_job node['jenkins_chefci']['github_organization'] do
  credentials_id 'github-token' if github_login
end
