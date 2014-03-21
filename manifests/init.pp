# == Class: flexget

class flexget {

  include params
  include install

  user { 'flexget':
    ensure      => present,
    name        => $::user,
    home        => $::homedir,
    managehome  => true,
    uid         => $::uid,
    gid         => $::gid,
  }

  file { 'flexget.conf':
    ensure  => file,
    path    => $::conf_path,
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