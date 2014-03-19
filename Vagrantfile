# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrantfile_local = 'Vagrantfile.local'
load vagrantfile_local if File.exists?(vagrantfile_local)

$script = <<SCRIPT
export http_proxy='http://#{$proxy_user}:#{$proxy_password}@#{$proxy_host}:#{$proxy_port}'
export https_proxy='https://#{$proxy_user}:#{$proxy_password}@#{$proxy_host}:#{$proxy_port}'
echo 'Acquire::http::Proxy \"http://#{$proxy_user}:#{$proxy_password}@#{$proxy_host}:#{$proxy_port}\";' >> /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy \"https://#{$proxy_user}:#{$proxy_password}@#{$proxy_host}:#{$proxy_port}\";' >> /etc/apt/apt.conf.d/proxy.conf
SCRIPT


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"


  config.vm.provision :shell,
    :inline => $script

  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "init.pp"
  end
end
