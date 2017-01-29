# [WIP] Jenkins-based Cookbook Pipeline

This cookbook sets up a Chef CI/CD based on Jenkins Pipelines.

It is subject of a talk at [Config Management Camp 2017](http://cfgmgmtcamp.eu/schedule/chef/steffen-gebert.html) on Feb 6th and is currently a **work in progress**!


## Notes

- Private key for chef-client to communincate with the Jenkins API is stored in `/etc/chef-jenkins-api.key` by default. (include this in your backup or when you move the Jenkins installation to a new host)


- The Github API user and token can be set in a wrapper cookbook using `node.run_state[:jenkins_chefci_github_user]` / `node.run_state[:jenkins_chefci_github_token]`, similar to the Jenkins cookbooks `node.run_state[:jenkins_private_key]`.

- For testing purposes (test-kitchen), the Github user and password will be read from environment variables:

    JENKINS_GITHUB_USER=johndoe JENKINS_GITHUB_TOKEN=123456 kitchen converge full-debian

- **Manually** set up an _organization_ hook on Github, pointing to `https://jenkins.example.com/github-webhook/` with _Push_ and _Repository_ events enabled. 
