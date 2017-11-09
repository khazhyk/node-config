class base::sharex {
	$home = '/var/lib/sharex'
	user { 'sharex_user':
		name => 'sharex',
		ensure => present,
		home => $home,
		managehome => true,
		system => true,
	}
	file { 'sharex_www':
		path => "${home}/www",
		ensure => 'directory',
		owner => 'sharex',
		group => 'sharex',
		mode => '0755',
		require => User['sharex_user'],
	}
}