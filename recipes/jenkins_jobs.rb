node.run_state[:jenkins_chefci_github_token] ||= node['jenkins_chefci']['github_credentials']['token']

github_login = node['jenkins_chefci']['github_credentials']['login']
credentials_id = ['github', github_login, 'token'].join '-'

jenkins_password_credentials github_login do
  id credentials_id
  password node.run_state[:jenkins_chefci_github_token]
  description 'Github API token'
end

jenkins_chefci_github_organization_job node['jenkins_chefci']['github_organization'] do
  credentials_id credentials_id
end
