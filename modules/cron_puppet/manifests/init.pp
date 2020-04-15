class cron_puppet {
  file { 'post-hook':
    ensure => file,
    path   => '/root/cron-puppet',
    source => 'puppet:///modules/cron_puppet/cron-puppet',
    mode   => '0755',
    owner  => root,
    group  => root
  }
  cron { 'puppet-apply':
    ensure  => present,
    command => '/root/cron-puppet r10k',
    user    => root,
    minute  => '*/30',
    require => File['post-hook']
  }
}
