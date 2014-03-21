# == Class: flexget::install

class flexget::install (
  $proxy    = undef,
) inherits flexget::params {

  package { 'python-pip':
    ensure => present,
  }

  package { 'flexget':
    ensure      => installed,
    provider    => pip,
    require     => Package['python-pip']
  }

  cron { 'flexget':
    ensure        => $flexget::cron_enabled,
    command       => "LANG=en_US.UTF-8 ${flexget::bin_path} -c ${flexget::config_file} execute 2>&1 >/dev/null",
    user          => $flexget::user,
    minute        => [15, 45],
  }

}