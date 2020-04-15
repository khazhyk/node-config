class dango::bot (
  String $username = 'spoo',
  Array[String] $ssh_keys = [],
) {
    user { 'spoobot_user':
        ensure     => present,
        name       => $username,
        managehome => true,
        shell      => '/bin/bash'
    }

    $ssh_keys.each |String $value| {
        $value_split = split($value, ' ')
        $key_type = $value_split[0]
        $key_key = $value_split[1]
        $key_name = "${value_split[2]}_spoo"

        ssh_authorized_key { $key_name:
            ensure => present,
            user   => $username,
            type   => $key_type,
            key    => $key_key,
        }
    }
    include postgresql::client
}

class dango::db (
  String $username = 'spoo'
){
    postgresql::server::db {'spoodb':
        dbname           => $username,
        user             => $username,
        password         => '',
    }
}
