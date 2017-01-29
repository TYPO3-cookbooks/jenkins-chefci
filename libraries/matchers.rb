if defined?(ChefSpec)
  {
    jenkins_chefci_github_organization: %i(create delete),
    jenkins_chefci_chefdk_gem_package: %i(install remove)
  }.each do |matcher, actions|
    ChefSpec.define_matcher(matcher)

    actions.each do |action|
      define_method("#{action}_#{matcher}") do |name|
        ChefSpec::Matchers::ResourceMatcher.new(matcher, action, name)
      end
    end
  end
end
