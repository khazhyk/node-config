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
      },
      {
        'job_name'        => 'spooprod',
        'scrape_interval' => '15s',
        'scrape_timeout'  => '15s',
        'static_configs'  => [{
          'targets' => map(range(8081, 8081+19)) | $p | { "localhost:${p}" },
          'labels'  => {'alias' => 'spoo.py prod'}
        }]

      }
    ]
  }
}
