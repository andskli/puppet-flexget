# == Class: flexget::params

class flexget::params {
  $conf_path = '/usr/local/etc/flexget.conf'
  $user = 'flexget'
  $group = 'flexget'
  $uid = undef
  $gid = undef
  $homedir = '/home/flexget'

  $autoupgrade = false
}