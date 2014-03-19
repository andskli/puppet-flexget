# == Class: flexget

class flexget (
	$flexget_config = params_lookup('config_file')
) inherits flexget::params {

	package { $flexget::pip_package:
		ensure => present,
	}



}