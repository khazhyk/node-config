class base (String $home_prefix) {
	user { 'khazhy_user':
		name => 'khazhy',
		ensure => present,
		home => "${home_prefix}/khazhy",
		groups => ['sudo']
	}
	ssh_authorized_key { 'khazhy@pear':
		ensure => present,
		user => 'khazhy',
		type => 'ssh-rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDa0OoKHGRx60Qmj4MdzG7P0MJnEisMRqmiY+q/wzggKLMIcwRJ/KWYv9KAtQAM8OYQ08zRyQ4ZIHJCrLckLEeSV1JDD7HVC1iLg59TWsfSGyw2Q9blzy5xBYpK3EGZdMB4hdY/Ss/zRerQWA3PIWTIjidL8X0WtyHuCVzjekSNXFJydiGZ8l8ZWQK9YVJJ35qxrI+brKR6sLZdATpf1diYrCg9DJNuLTJX70uUdLhJD89Azb74ZsHyjBqd3j+vg/VL3TIkacpLRbc5N72jZNn40UJD9RjhjascZBOZesD108AC7OnDvm9xMrU1u/a97dTNI7LA4l6qBJLv8/gQrnr+ecsQYKM8xZBDpuaMy1UHx4O3h9yxKtuUGBcZdDbNpP48e+hCgDea5eEogGpnetreDymzhQCoQE8d7sr8f9utHTfqaKkaqHAADzvWT9hrCped47scG+CqfRCsggAHW6CsFUWbKA8WfHzjf86YVuTBc4Xun+i4xjfcSYxFZWQEFtBqDMCCxYg5IVucNA3A/5KiJa/DH1WK9a9/LSbxYheaV/r51toY8dr6onQg1ZakZickt+DxGivc6YE7HAo/UZHNkITD/sljKkWQtVeSKG88MJTnjpgT5iurIPgAfLyl2KvdEwfms3T+jg1SycEUxhySN83VtZ70YVCLHxXKfOpPKw=='
	}
	ssh_authorized_key { 'khazhy@cray':
		ensure => present,
		user => 'khazhy',
		type => 'ssh-rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCzu5FWTpRNtPJ4wPU5r3pQKdU/hVaNoPyq1MaPGyZhbL8uEWkg46178tdOaFnbrry6HukI+UIpIqp/SdZ+dX+G+1lP+BQm637uHUYo1iDbgJO4Jj/SXS4s/9amoEtnshyQBJ59h+NoCQu3bY6W6884q9RtVUPS0GdUETPGASRyBVQvXyAQKC6EhJiyFRub3kfGb5HIp0iLrhiWjbGpeV7n3xcZH0/QYdEC74skBma8BoonyPWlHitARGWKHrO2guwtmqgd7ZFyteS80IFr964Yfn+9zbH0Yuej6NQCWCxHdssYrjq81p/0FbtlKuqtFsLG/vzSIK4qrJnNiZwBYmEL'
	}
	ssh_authorized_key { 'khazhy@hades':
		ensure => present,
		user => 'khazhy',
		type => 'ssh-rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDMiFHVQkeGUpOba6qDqEuIXK3dh/7NgMMty3tsgOAC4Dh2EXYs1DL828qUJLNNVZmQLiSA75HgXe2HI9iIt/h2QJzSwGe3V527VYEgIAZ8ywyPHdkNv5qn9iwvQgQ3OKSVHSU02OlfvnRaZEdQ6QVBRtAPkkpeVYsvGO9REnYrqZWWImKwM9lK4PUQHvmqGrZFlU96KtFxwb8G0YxsQtTwujzcdQ3NSIFIrLuNZ89S0yECjADdGIEgkRiFnv54bXoGxbesDMH0LAYPtOH/IU2rzhEIl6DqUZx20S0EuI/P7r2CWrhTQOCGuJWKG62oZa2XdGoSYo+cZI+jNY2WSN1Zl3MP7R9ihnQ8E7Jp8X41+LdW1lRFWLgP/Kmq9AGhPzIbaOExU+AHp5MPGpTb8ZxGbcQRp/16UgR7AhsQMtGtH9I7ospVhrixnlMB8F13UCCUvAEcElOLqwqa6vdhAvS8yrqjhTBDWOun9h3TB1afoG8jbFjsbpHj7mw5/+kRFluzsQdkOZQAK5qFlbCw9onsQoMUAim4ByTN1q0xCuvkByBrcLS9lcMsjKm5pPETmy+fF+Y6lw+Ax11NZGodr6TMqr87wo7nmVE6PwzVEJH7gY8vJrXoqcQGA5RCOOPwhGMWH7NjbFmuua1mf+F6CjYpZnOQGvZ0ElVtbST/qW4/LQ=='
	}
	class { 'hiera':
        hiera_version   =>  '5',
        eyaml => true
    }
}
