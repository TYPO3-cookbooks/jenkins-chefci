# [WIP] Jenkins-based Cookbook Pipeline

This cookbook sets up a Chef CI/CD based on Jenkins Pipelines.

It is subject of a talk at [Config Management Camp 2017](http://cfgmgmtcamp.eu/schedule/chef/steffen-gebert.html) on Feb 6th and is currently a **work in progress**!


## Notes

- Private key for chef-client to communincate with the Jenkins API is stored in `/etc/chef-jenkins-api.key` by default. (include this in your backup or when you move the Jenkins installation to a new host)
