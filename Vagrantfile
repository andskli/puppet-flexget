# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
YAML::ENGINE.yamler = 'psych' if defined?(YAML::ENGINE)

vagrantfile_local = 'Vagrant_config.yaml'
if File.exists?(vagrantfile_local)
  localconfig = YAML::load_file(vagrantfile_local)
end

unless localconfig.nil?
  proxy_host = localconfig['proxy']['host']
  proxy_port = localconfig['proxy']['port']
  proxy_user = localconfig['proxy']['user']
  proxy_password = localconfig['proxy']['password']
  apt_mirror_country = localconfig['apt']['mirror_country']
end

script = ""
script << <<-SCRIPT
test ! -d /tmp/modules/flexget && mkdir -p /tmp/modules/flexget
test ! -e /tmp/modules/flexget && ln -s /vagrant/manifests /tmp/modules/flexget
SCRIPT

unless proxy_host.nil?
  proxystr = ""
  proxystr << "#{proxy_user}" unless proxy_user.nil?
  proxystr << ":#{proxy_password}" unless proxy_password.nil?
  proxystr << "@" unless (proxy_password.nil? || proxy_user.nil?)
  proxystr << "#{proxy_host}"
  proxystr << ":#{proxy_port}" unless proxy_port.nil?
  script << <<-SCRIPT
export http_proxy='http://#{proxystr}'
export https_proxy='https://#{proxystr}'
echo 'Acquire::http::Proxy \"http://#{proxystr}\";' >> /etc/apt/apt.conf.d/proxy.conf
echo 'Acquire::https::Proxy \"https://#{proxystr}\";' >> /etc/apt/apt.conf.d/proxy.conf
sed -i 's/\(us\)/#{apt_mirror_country}/' /etc/apt/sources.list
  SCRIPT
else
  script << 'echo "No proxy config defined"'
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :shell, :inline => script

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "vagrant"
    puppet.manifest_file = "base.pp"
    puppet.module_path = "../"
    puppet.options = "--verbose"
  end
end