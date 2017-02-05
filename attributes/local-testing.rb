# These attributes are used by .kitchen.yml to ease local development of this cookbook.
# They should not be set in production.

#<> The github.com user name used. Should be set using
# node.run_state[:jenkins_chefci_github_login] instead
default['jenkins_chefci']['github_credentials']['login'] = nil

#<> You *can* set this via an attribute (used in .kitchen.yml), but it is more safe to set
# node.run_state[:jenkins_chefci_github_token] instead
default['jenkins_chefci']['github_credentials']['token'] = nil

#<> The knife/chef configuration for communicating with the Chef API
default['jenkins_chefci']['knife_config'] = {}

#<> Optionally (for local testing), the contents of a chef admin's key (\n replaced with |)
default['jenkins_chefci']['knife_client_key'] = nil
