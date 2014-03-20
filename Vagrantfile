# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
YAML::ENGINE.yamler = 'syck' if defined?(YAML::ENGINE)

vagrantfile_local = 'Vagrant_config.yaml'
if File.exists?(vagrantfile_local)
  localconfig = YAML::load_file(vagrantfile_local)
end

unless localconfig.nil?
  proxy_host = localconfig['proxy']['host']
  proxy_port = localconfig['proxy']['port']
  proxy_user = localconfig['proxy']['user']
  proxy_password = localconfig['proxy']['password']
end

unless proxy_host.nil?
    proxyconf = <<-SCRIPT
export http_proxy='http://#{proxy_user}:#{proxy_password}@#{proxy_host}:#{proxy_port}'
export https_proxy='https://#{proxy_user}:#{proxy_password}@#{proxy_host}:#{proxy_port}'
echo 'Acquire::http::Proxy \"http://#{proxy_user}:#{proxy_password}@#{proxy_host}:#{proxy_port}\";' >> /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy \"https://#{proxy_user}:#{proxy_password}@#{proxy_host}:#{proxy_port}\";' >> /etc/apt/apt.conf.d/proxy.conf
    SCRIPT
else
    proxyconf = <<-SCRIPT
echo "No proxy config applicable"
    SCRIPT
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"


  config.vm.provision :shell, :inline => proxyconf

  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "init.pp"
  end
end