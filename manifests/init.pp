# == Class: flexget

class flexget {

  class { 'flexget::install': }

  user { $::user:
    ensure  => present,
    home    => $::homedir,
    uid     => $::uid,
    gid     => $::gid,
  }

  file { $::conf_path:
    ensure  => file,
    owner   => $::user,
    group   => $::group,
    mode    => '0640',
    notify  => Exec['run_flexget'],
  }

  group { 'flexget':
    gid => $::gid,
  }

  exec { 'run_flexget':
    command   => "/usr/local/bin/flexget -c ${::conf_path}",
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    user      => $::user,
  }

}