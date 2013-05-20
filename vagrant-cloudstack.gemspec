$:.unshift File.expand_path("../lib", __FILE__)
require "vagrant-cloudstack/version"

Gem::Specification.new do |s|

  s.name = "vagrant-cloudstack"
  s.version = VagrantPlugins::CloudStack::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = "John Burwell"
  s.email = "meaux+vagrant@cockamamy.net"
  s.homepage = "http://github.com/jburwell/vagrant-cloudstack"
  s.summary = "Vagrant provisioning and management of CloudStack virtual machines"
  s.description = "Vagrant provisioning and management of CloudStack virtual machines"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "vagrant-cloudstack"

  s.add_runtime_dependency "cloudstack_ruby_client", "= 0.0.4"

  s.add_development_dependency "rake"

  root_path = File.dirname(__FILE__)

  all_files = Dir.chdir(root_path) { Dir.glob ("**/{*,.*}") }
    .reject { |file| [".", ".."].include?(File.basename(file)) }

  gitignore_path = File.join(root_path, ".gitignore")
  ignores = File.readlines(gitignore_path)
    .map { |line| line.chomp.strip }
    .reject { |line| line.empty? || line =~ /^(#|!)/ }

  contents = all_files.reject do |file|
    next true if File.directory?(file)

    ignores.any? do |ignore|
      File.fnmatch(ignore, file, File::FNM_PATHNAME) ||
        File.fnmatch(ignore, File.basename(file), File::FNM_PATHNAME)
    end
  end

  s.files = contents
  s.executables = contents.map { |f| f[/^bin\/(.*)/, 1] }.compact
  s.require_path = "lib"

end
