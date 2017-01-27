name             'jenkins-chefci'
maintainer       'Steffen Gebert'
maintainer_email 'steffen.gebert@typo3.org'
license          'Apache 2.0'
description      'Jenkins-based Cookbook Pipeline'
long_description 'Sets up a Chef CI/CD based on Jenkins Pipelines.'
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.1.0'

issues_url       'https://github.com/TYPO3-cookbooks/jenkins-chefci/issues' if respond_to?(:issues_url)
source_url       'https://github.com/TYPO3-cookbooks/jenkins-chefci' if respond_to?(:source_url)

supports         'debian'
supports         'ubuntu'

depends          'java'
depends          'jenkins'
