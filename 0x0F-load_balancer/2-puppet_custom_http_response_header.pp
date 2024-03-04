# Configure Nginx so that its HTTP response contains a custom
# header (on web-01 and web-02) with Puppet.

exec { 'update_and_upgrade':
  command => 'apt update && apt upgrade -y',
  path    => '/usr/bin:/bin',
  before  => Package['install_nginx']
}

package { 'install_nginx':
  ensure   => 'installed',
  name     => 'nginx',
  provider => apt,
  before   => Exec['custom_header'],
}

exec { 'custom_header':
  command => 'sed -i "16i\\        add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf',
  path    => '/usr/bin:/bin',
  require => Package['install_nginx'],
  notify  => Exec['restart_nginx']
}

exec { 'restart_nginx':
  provider => shell,
  command  => '/usr/sbin/service nginx restart',
}

