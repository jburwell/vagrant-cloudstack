# Borrowed from the vagrant-aws project and based on the Vagrant plugin
# development/test recommendations (http://docs.vagrantup.com/v2/plugins/packaging.html)

source "https://rubygems.org"

gemspec

gem "cloudstack_ruby_client", "0.0.4"

group :development do
  # We depend on Vagrant for development, but we don't add it as a
  # gem dependency because we expect to be installed within the
  # Vagrant environment itself using `vagrant plugin`.
  gem "vagrant", :git => "git://github.com/mitchellh/vagrant.git"
end
