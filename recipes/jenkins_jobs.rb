node.run_state[:jenkins_chefci_github_login] ||= node['jenkins_chefci']['github_credentials']['login']
node.run_state[:jenkins_chefci_github_token] ||= node['jenkins_chefci']['github_credentials']['token']

github_login = node.run_state[:jenkins_chefci_github_login]

if github_login

  # this is required for organization folder / multibranch scan
  jenkins_password_credentials github_login do
    id 'github-token'
    password node.run_state[:jenkins_chefci_github_token]
    description 'Github API token'
  end

  # # this is required by the Github plugin for managing webhooks (in the global config)
  # # but we should use organization-level hooks anyways
  # jenkins_secret_text_credentials github_login do
  #   id 'github-token-text'
  #   secret node.run_state[:jenkins_chefci_github_token]
  #   description "Github API token (#{github_login})"
  # end
else
  Chef::Log.warn 'No GitHub login given. Running as anonymous will hit API limits quickly.'
end

jenkins_chefci_github_organization_job node['jenkins_chefci']['github_organization'] do
  credentials_id 'github-token' if github_login
end
