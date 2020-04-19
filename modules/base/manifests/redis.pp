class base::redis {
  class { '::redis':
    bind => ['127.0.0.1', '::1']
  }
  sysctl {'vm.overcommit_memory':
    ensure => present,
    value  => '1'
  }
}
