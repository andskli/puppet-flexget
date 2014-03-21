package { ['rake',
					'rspec-puppet',
					'puppet-lint',
					'bundler'
					]:
	ensure 			=> 'installed',
	provider		=> 'gem',
}