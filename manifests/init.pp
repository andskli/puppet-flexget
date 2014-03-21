# == Class: flexget

class flexget inherits flexget::params {

  include flexget::install

  user { 'flexget':
    ensure      => present,
    name        => $flexget::user,
    home        => $flexget::homedir,
    managehome  => true,
    uid         => $flexget::uid,
    gid         => $flexget::gid,
  }

  file { 'flexget_conf':
    ensure  => file,
    path    => $flexget::conf_path,
    owner   => $flexget::user,
    group   => $flexget::group,
    mode    => '0640',
    notify  => Exec['run_flexget'],
  }

  group { 'flexget':
    gid => $flexget::gid,
  }

  exec { 'run_flexget':
    command   => "/usr/local/bin/flexget -c ${::conf_path}",
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    user      => $flexget::user,
    onlyif    => '/usr/bin/test -f /usr/local/bin/flexget',
  }

}