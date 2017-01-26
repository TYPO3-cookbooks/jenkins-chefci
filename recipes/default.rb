%w(java).each do |recipe|
  include_recipe recipe
end

%w(_jenkins_setup).each do |local_recipe|
  include_recipe "::#{local_recipe}"
end
