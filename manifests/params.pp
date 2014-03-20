# == Class: flexget::params

class flexget::params {
  $conf_path    = '/usr/local/etc/flexget.conf',
  $user         = 'flexget',
  $group        = 'flexget',
  $uid          = '1337',
  $gid          = '1337',
  $homedir      = '/home/flexget'
}