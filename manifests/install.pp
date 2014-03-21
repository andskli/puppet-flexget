# == Class: flexget::install

class flexget::install (
  $proxy    = undef,
  ) {

  package { 'python-pip':
    ensure => present,
  }

  package { 'flexget':
    ensure      => installed,
    provider    => pip,
    require     => Package['python-pip']
  }

}