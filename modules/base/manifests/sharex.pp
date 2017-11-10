class base::sharex (
  String $password,
  String $home = '/var/lib/sharex',
) {
  user { 'sharex_user':
    ensure     => present,
    name       => 'sharex',
    home       => $home,
    managehome => true,
    password   => $password,
    system     => true,
  }
  file { 'sharex_www':
    ensure  => 'directory',
    path    => "${home}/www",
    owner   => 'sharex',
    group   => 'sharex',
    mode    => '0755',
    require => User['sharex_user'],
  }
  nginx::resource::location { 'sharex_nginx':
    ensure   => 'present',
    www_root => File['sharex_www']['path'],
    location => '/sx',
    server   => 'khaz.io',
    require  => [
      File['sharex_www'],
      Nginx::Resource::Server['khaz.io'],
    ],
  }
}
