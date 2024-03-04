# Configure Nginx so that its HTTP response contains a custom
# header (on web-01 and web-02) with Puppet.

exec { 'update_and_upgrade':
  command => 'apt update && apt upgrade -y',
  path    => '/usr/bin:/bin',
}

package { 'install_nginx':
  ensure   => 'installed',
  name     => 'nginx',
  provider => 'apt',
  require  => Exec['update_and_upgrade'],
}

exec { 'custom_header':
  command => 'sed -i "16i\\        add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf',
  path    => '/usr/bin:/bin',
  require => Package['install_nginx'],
  notify  => Service['restart_nginx']
}

service { 'restart_nginx':
  ensure   => 'running',
  name     => 'nginx',
  enable   => 'true',
  provider => 'systemd',
}

