node default {
    include base
    include base::web
    include base::sharex
    include cron_puppet
}

node cicini {
    include base::database
    include base::redis
}
