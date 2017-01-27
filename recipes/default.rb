%w(java jenkins::master).each do |recipe|
  include_recipe recipe
end

%w(_jenkins_chef_user _jenkins_setup _jenkins_plugins).each do |local_recipe|
  include_recipe "::#{local_recipe}"
end
