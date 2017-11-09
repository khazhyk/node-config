class base::web {
	include nginx
	file { 'web_www':
		ensure => 'directory',
		owner => 'khazhy',
		group => 'khazhy',
		mode => '0755',
		path => "${User['khazhy_user']['home']}/www",
		require => User['khazhy_user']
	}
	nginx::resource::server { 'khaz.io':
		ensure => present,
		www_root => "${User['khazhy_user']['home']}/www",
		require => User['khazhy_user']
	}
}