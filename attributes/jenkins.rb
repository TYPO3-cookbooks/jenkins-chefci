#<> Disable Jenkins 2.0 setup wizard - currently until this is fixed: https://github.com/chef-cookbooks/jenkins/pull/471
default['jenkins']['master']['jvm_options'] = '-Djenkins.install.runSetupWizard=false'

#<> Where the private key for chef-client to communicate with Jenkins is stored on disk.
default['jenkins_chefci']['jenkins_private_key_path'] = '/etc/chef-jenkins-api.key'

#<> List of plugins to install
# Plugins:
# Retrieve this list via Jenkins Script console:
#
# Jenkins.instance.pluginManager.plugins.sort().each{ plugin -> println ("  ${plugin.getShortName()}:${plugin.getVersion()}") }
#
default['jenkins_chefci']['jenkins_plugins'] = %w(
  ace-editor:1.1
  analysis-collector:1.50
  analysis-core:1.82
  ansicolor:0.4.3
  ant:1.4
  antisamy-markup-formatter:1.5
  authentication-tokens:1.3
  blueocean:1.0.0-b21
  blueocean-autofavorite:0.6
  blueocean-commons:1.0.0-b21
  blueocean-config:1.0.0-b21
  blueocean-dashboard:1.0.0-b21
  blueocean-display-url:1.5.1
  blueocean-events:1.0.0-b21
  blueocean-git-pipeline:1.0.0-b21
  blueocean-github-pipeline:1.0.0-b21
  blueocean-i18n:1.0.0-b21
  blueocean-jwt:1.0.0-b21
  blueocean-personalization:1.0.0-b21
  blueocean-pipeline-api-impl:1.0.0-b21
  blueocean-rest:1.0.0-b21
  blueocean-rest-impl:1.0.0-b21
  blueocean-web:1.0.0-b21
  bouncycastle-api:2.16.0
  branch-api:1.11.1
  buildtriggerbadge:2.7
  clone-workspace-scm:0.6
  cloudbees-folder:5.16
  credentials:2.1.11
  credentials-binding:1.10
  display-url-api:1.1.1
  docker-commons:1.6
  docker-workflow:1.9.1
  durable-task:1.13
  embeddable-build-status:1.9
  external-monitor-job:1.7
  favorite:2.0.4
  gerrit-trigger:2.23.0
  git:3.0.1
  git-client:2.2.1
  git-server:1.7
  github:1.25.1
  github-api:1.84
  github-branch-source:1.10.1
  github-oauth:0.25
  github-organization-folder:1.5
  greenballs:1.15
  handlebars:1.1.1
  icon-shim:2.0.3
  jackson2-api:2.7.3
  javadoc:1.4
  job-dsl:1.57
  jquery-detached:1.2.1
  junit:1.19
  ldap:1.14
  mailer:1.19
  matrix-auth:1.4
  matrix-project:1.8
  maven-plugin:2.14
  metrics:3.1.2.9
  momentjs:1.1.1
  pam-auth:1.3
  pipeline-build-step:2.4
  pipeline-graph-analysis:1.3
  pipeline-input-step:2.5
  pipeline-milestone-step:1.3
  pipeline-model-api:1.0
  pipeline-model-declarative-agent:1.0
  pipeline-model-definition:1.0
  pipeline-rest-api:2.4
  pipeline-stage-step:2.2
  pipeline-stage-tags-metadata:1.0
  pipeline-stage-view:2.4
  piwikanalytics:1.2.0
  plain-credentials:1.3
  PrioritySorter:3.5.0
  pubsub-light:1.6
  scm-api:1.3
  script-security:1.25
  slack:2.1
  sse-gateway:1.15
  ssh-credentials:1.13
  structs:1.5
  token-macro:2.0
  variant:1.1
  warnings:4.59
  windows-slaves:1.2
  workflow-aggregator:2.5
  workflow-api:2.8
  workflow-basic-steps:2.3
  workflow-cps:2.25
  workflow-cps-global-lib:2.5
  workflow-durable-task-step:2.8
  workflow-job:2.9
  workflow-multibranch:2.9.2
  workflow-scm-step:2.3
  workflow-step-api:2.8
  workflow-support:2.12
)
