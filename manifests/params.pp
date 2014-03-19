# == Class: flexget::params
class flexget::params {

	$pip_package = $::operatingsystem ? {
		/Windows/	=>	undef,
		default		=> "python-pip"
	}

	$config_file = $::operatingsystem ? {
		/Windows/	=> "C:\\flexget.conf",
		default		=> "/usr/local/etc/flexget.conf"
	}

}