# [WIP] Jenkins-based Cookbook Pipeline

This cookbook sets up a Chef CI/CD based on Jenkins Pipelines.

It is subject of a talk at [Config Management Camp 2017](http://cfgmgmtcamp.eu/schedule/chef/steffen-gebert.html) on Feb 6th and is currently a **work in progress**!

**It is not yet recommended to try it**


## Overview

Please have a look at slides of the talk mentioned above.
 
## Usage for Testing

- Specify GitHub credentials so that you don't run into GitHub API rate limits:

```bash
export JENKINS_GITHUB_LOGIN=johndoe
export JENKINS_GITHUB_TOKEN=123456supersecure
```

_Warning_: A side-effect is that Jenkins will update the commit statuses of cookbooks that it touches. I haven't found a way to disable that.

- Agree that the code within `.kitchen.yml` copies your workstation's Chef config (including your private key) into the VM:

```bash
export JENKINS_COPY_CHEF_CREDENTIALS=1
```

This is needed for all the steps that require authentication againgst your Chef server, like cookbook uploading or maybe even resolving cookbooks (in case you have specified it as `source` in your `Berksfile`).

_Warning_: Obviously, this will upload cookbooks if pipelines are passed successfully.

- Point `node['jenkins_chefci']['github_organization']` to the organization containing your cookbooks (playing with the default org [TYPO3-cookbooks-test](https://github.com/TYPO3-cookbooks-test/) should still be fine). 

- Converge test-kitchen:

```bash
kitchen converge full-ubuntu-1604
```

- Access Jenkins, go to the folder named after the cookbook organization and access _Re-Scan Organization_ > _Run Now_. This will crawl for repos containing branches containing a file called _Jenkinsfile_.

## Usage in Production

- The Github API user and token can be set in a wrapper cookbook using `node.run_state[:jenkins_chefci_github_user]` / `node.run_state[:jenkins_chefci_github_token]`, similar to the Jenkins cookbooks `node.run_state[:jenkins_private_key]`.

- Manually configure an organization-level webhook in GitHub with _Push_ and _Repository_ events enabled and point it to `/github-webhook` of your Jenkins server.

- Set the attributes for the `~/.chef/config.rb` file via `node['jenkins_chefci']['knife_config']`:

```ruby
node['jenkins_chefci']['knife_config']['node_name'] = 'jenkins-node-name'
node['jenkins_chefci']['knife_config']['chef_server_url'] = 'https://chef.example.org'
```

- Copy the client's private key of the (admin) user within your Chef Server that Jenkins uses to `/var/lib/jenkins/.chef/client.pem` to allow interaction with the Chef Server.

## Notes

- Private key for chef-client to communincate with the Jenkins API is stored in `/etc/chef-jenkins-api.key` by default. (include this in your backup or when you move the Jenkins installation to a new host)

## Issues

- If you encounter a `NullPointerException` at the end of your pipeline runs, just save the Jenkins system config once (because the Slack plugin is stupid).
