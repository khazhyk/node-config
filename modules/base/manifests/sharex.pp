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
	nginx::resource::location { 'sharex_nginx':
		ensure => 'present',
		www_root => File['sharex_www']['path'],
		location => '/sx',
		server => 'khaz.io',
		require => [
			File['sharex_www'],
			Nginx::Resource::Server['khaz.io'],
		],
	}
}
