source 'https://supermarket.chef.io'

metadata

def fixture(name)
  cookbook name, path: "test/fixtures/cookbooks/#{name}"
end

group :integration do
  cookbook 'apt'
end
