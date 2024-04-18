# Change the ULIMIT value to 4096 to allow increase in open file
exec { 'set_ulimit':
  command  => 'sed -i "s/^ULIMIT.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  provider => shell,
  unless   => 'grep -q "^ULIMIT=\"-n 4096\"" /etc/default/nginx',
}

exec { 'restart_nginx':
  command   => 'service nginx restart',
  provider  => shell,
  subscribe => Exec['set_ulimit'],
}
