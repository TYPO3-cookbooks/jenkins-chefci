%w(default chefdk docker).each do |local_recipe|
  include_recipe "::#{local_recipe}"
end
