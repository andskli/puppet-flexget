# == Class: flexget
class flexget (
  $conf_path    = '/usr/local/etc/flexget.conf',
  $user         = 'flexget',
  $group        = 'flexget',
  $uid          = 1337,
  $gid          = 1337,
  $homedir      = '/home/flexget'
  ) {

  user { $user:
    home    => $homedir,
    ensure  => present,
    uid     => $uid,
    gid     => $gid,
  }

  file { $conf_path:
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0640',
    notify  => Exec['run_flexget'],
  }

  group { "flexget":
    gid => 1337,
  }

  package { "python-pip":
    ensure => present,
    notify => Exec['pip_install_flexget'],
  }

  exec { "pip_install_flexget":
    command => '/usr/bin/pip install -U flexget',
  }

  exec { "run_flexget":
    command   => "/usr/local/bin/flexget -c ${conf_path}",
    path      => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    user      => $user,
  }

}