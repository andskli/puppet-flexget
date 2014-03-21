# == Class: flexget::install

class flexget::install (
  $conf_path    = '/usr/local/etc/flexget.conf',
  $user         = 'flexget',
  $group        = 'flexget',
  $uid          = '1337',
  $gid          = '1337',
  $homedir      = '/home/flexget',
) {

  package { 'python-pip':
    ensure => present,
    notify => Exec['pip_install_flexget'],
  }

  exec { 'pip_install_flexget':
    command     => '/usr/bin/pip install -U flexget',
    refreshonly => true,
  }

}