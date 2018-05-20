class base (
    String $home_prefix = '/home',
    Array[String] $ssh_keys = [],
    ) {
    user { 'khazhy_user':
        ensure => present,
        name   => 'khazhy',
        home   => "${home_prefix}/khazhy",
        groups => ['sudo']
    }

    $ssh_keys.each |String $value| {
        $value_split = split($value, ' ')
        $key_type = $value_split[0]
        $key_key = $value_split[1]
        $key_name = $value_split[2]

        ssh_authorized_key { $key_name:
            ensure => present,
            user   => 'khazhy',
            type   => $key_type,
            key    => $key_key,
        }
    }
    class { 'hiera':
        hiera_version =>  '5',
        eyaml         => true,
        owner         => 'root',
        group         => 'root',
    }
}
