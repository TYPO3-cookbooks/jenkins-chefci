default['jenkins_chefci']['github_organization'] = 'TYPO3-cookbooks-test'

#<> The github.com user name used
default['jenkins_chefci']['github_credentials']['login'] = nil

#<> You *can* set this via an attribute (used in .kitchen.yml), but it is more safe to set
# node.run_state[:jenkins_chefci_github_token] instead
default['jenkins_chefci']['github_credentials']['token'] = nil
