# One prometheus server, and every node has prometheus exporters
class base::prometheus {
  class { '::prometheus::server':
    storage_retention => '90d',
    scrape_configs    => [
      {
        'job_name'        => 'prometheus',
        'scrape_interval' => '10s',
        'scrape_timeout'  => '10s',
        'static_configs'  => [{
          'targets' => ['localhost:9090'],
          'labels'  => {'alias' => 'Prometheus'}
        }]
      },
      {
        'job_name'        => 'node',
        'scrape_interval' => '5s',
        'scrape_timeout'  => '5s',
        'static_configs'  => [{
          'targets' => ['localhost:9100'],
          'labels'  => {'alias' => 'Node'}
        }]
      }
    ]
  }
}
