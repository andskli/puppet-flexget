# == Class: flexget::params

class flexget::params {
  $base_path = '/var/lib/flexget'
  $config_file = "${base_path}/config.yml"
  $bin_path = '/usr/local/bin/flexget'

  $user = 'flexget'
  $group = 'flexget'
  $uid = undef
  $gid = undef
  $homedir = '/home/flexget'

  $cron = true
  $cron_enabled = $cron ? {
    false     => 'absent',
    default   => 'present'
  }

  $autoupgrade = false
}