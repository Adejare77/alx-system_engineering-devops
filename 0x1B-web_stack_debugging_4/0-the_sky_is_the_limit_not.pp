# Change the ULIMIT value to 4096 to allow increase in open file
exec { 'set_ulimit':
        command  => 'sed -i "s/^ULIMIT.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
        provider => shell,
	unless   => grep -q "^ULIMIT=\"-n 4096\"" /etc/default/nginx,
}

service { 'restart_nginx':
	ensure    => running,
	enable    => true,
	subscribe => Exec['set_ulimit'],
}
