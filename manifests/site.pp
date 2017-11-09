node default {
    include base
    include base::sharex
    include cron_puppet
    include web
    file { 'hmmm':
        ensure => file,
        path => "/root/${lookup('key')}",
        content => "hmmm\n",
        mode => '0644',
        owner => root,
        group => root
    }
}