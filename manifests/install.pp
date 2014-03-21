# == Class: flexget::install

class flexget::install {

  include params

  package { 'python-pip':
    ensure => present,
    notify => Exec['pip_install_flexget'],
  }

  exec { 'pip_install_flexget':
    command     => '/usr/bin/pip install -U flexget',
  }

  file { 'flexget_bin':
    ensure      => present,
    path        => '/usr/local/bin/flexget',
  }

}