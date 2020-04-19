class base::database {
  class {'postgresql::server':
        listen_addresses => '127.0.0.1,::1,10.40.0.1',
        config_entries   => {
            max_connections => '500',
            shared_buffers  => '2GB',
            huge_pages      => 'try',
        }
  }
}
