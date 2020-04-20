class profile::base {
  class { '::ntp': }
}

node default {
    include base
    include base::web
    include base::sharex
    include cron_puppet
    include prometheus::node_exporter
}

node 'cicini.khaz.io' {
    include base
    include base::web
    include base::sharex
    include cron_puppet
    include prometheus::node_exporter

    include base::database
    include base::redis
    include base::prometheus
    openvpn::server { 'cicini':
        country      => 'CA',
        province     => 'QC',
        city         => 'Beauharnois',
        organization => 'example.org',
        email        => 'root@example.org',
        server       => '10.40.0.0 255.255.255.0',
        proto        => 'udp',
        local        => $facts['ipaddress'],
    }
    openvpn::client { 'erina':
        server      => 'cicini',
        proto       => 'udp',
        remote_host => $facts['fqdn']
    }
    openvpn::revoke { 'erina':
          server=> 'cicini'
    }
    firewall { '050 accept all openvpn':
        dport  => 1194,
        proto  => 'udp',
        action => 'accept',
    }

    class { 'dango::bot':
        ssh_keys => lookup('base::ssh_keys')
    }
    include dango::db
}
