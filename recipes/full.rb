%w(default chefdk docker jenkins_jobs).each do |local_recipe|
  include_recipe "::#{local_recipe}"
end
