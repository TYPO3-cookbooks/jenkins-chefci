%w(default chefdk).each do |local_recipe|
  include_recipe "::#{local_recipe}"
end
