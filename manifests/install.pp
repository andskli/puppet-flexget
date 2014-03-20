# == Class: flexget::install

class flexget::install {

  package { "python-pip":
    ensure => present,
    notify => Exec['pip_install_flexget'],
  }

  exec { "pip_install_flexget":
    command     => '/usr/bin/pip install -U flexget',
    refreshonly => true,
  }

}