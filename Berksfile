
source 'https://supermarket.chef.io'

#cookbook 'omnibus'

# Uncomment to use the latest version of the Omnibus cookbook from GitHub
cookbook 'omnibus', github: 'opscode-cookbooks/omnibus'

cookbook 'omnibus_build', path: "test/fixtures/cookbooks/omnibus_build"

group :integration do
  cookbook 'apt',      '~> 2.8'
  cookbook 'freebsd',  '~> 0.3'
  cookbook 'yum-epel', '~> 0.6'
end
