class base::web {
  class { 'nginx':
    server_purge => true  # Only allow managed websites
  }
  file { 'web_www':
    ensure  => 'directory',
    owner   => 'khazhy',
    group   => 'khazhy',
    mode    => '0755',
    path    => "${::User['khazhy_user']['home']}/www",
    require => User['khazhy_user'],
  }
  nginx::resource::server { 'khaz.io':
    ensure               => present,
    www_root             => "${::User['khazhy_user']['home']}/www",
    require              => User['khazhy_user'],
    use_default_location => false,
  }


  # Allow cloudflare access
  # TODO: https://www.cloudflare.com/ips-v4 https://www.cloudflare.com/ips-v6
  [
    '103.21.244.0/22', '103.22.200.0/22', '103.31.4.0/22', '104.16.0.0/12',
    '108.162.192.0/18', '131.0.72.0/22', '141.101.64.0/18', '162.158.0.0/15',
    '172.64.0.0/13', '173.245.48.0/20', '188.114.96.0/20', '190.93.240.0/20',
    '197.234.240.0/22', '198.41.128.0/17',
  ].each |String $cloudflarerange| {
    firewall { "050 cloudflare http access ${cloudflarerange}":
        dport  => ['80'],
        source => $cloudflarerange,
        proto  => 'tcp',
        action => 'accept'
    }
  }
}
