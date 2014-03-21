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

  group { 'flexget':
    gid         => $flexget::gid,
  }

  file { 'flexget_vardir':
    ensure      => directory,
    path        => $flexget::base_path,
    owner       => $flexget::user,
    group       => $flexget::group,
    mode        => '0644',
    recurse     => true,
  }

  file { 'flexget_conf':
    ensure      => file,
    path        => $flexget::config_file,
    owner       => $flexget::user,
    group       => $flexget::group,
    mode        => '0644',
    notify      => Exec['run_flexget'],
    require     => File['flexget_vardir'],
  }

  exec { 'run_flexget':
    command     => "${flexget::bin_path} -c ${flexget::config_file} execute",
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    user        => $flexget::user,
    onlyif      => "${flexget::bin_path} -c ${flexget::config_file} check",
  }

}