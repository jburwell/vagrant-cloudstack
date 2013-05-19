begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant Cloudstack plugin must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant CloudStack plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module AWS
    class Plugin < Vagrant.plugin("2")

      name "CloudStack"
      description <<-DESC
      This plugin installs a provider that allows Vagrant to manage
      machines in a CloudStack instance.
      DESC


    end
  end
end

