# require "chef/resource/gem_package"

class Chef
  class Resource::ChefdkGemPackage < Resource::GemPackage

    resource_name :jenkins_chefci_chefdk_gem_package

    actions :install, :remove

    def initialize(name, run_context = nil)
      super

      @gem_binary = "/opt/chefdk/embedded/bin/gem"
      @options = "--no-document --no-user-install"
    end
  end
end

class Chef
  class Provider::ChefdkGemPackage < Provider::LWRPBase

    provides :jenkins_chefci_chefdk_gem_package
  end
end

