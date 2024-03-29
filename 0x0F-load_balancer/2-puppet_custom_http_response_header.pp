# Configure Nginx so that its HTTP response contains a custom
# header (on web-01 and web-02) with Puppet.

exec { 'update':
  command => 'sudo apt update -y',
  provider => shell,
  before  => Package['install_nginx']
}

package { 'install_nginx':
  ensure   => 'installed',
  name     => 'nginx',
  provider => apt,
  require   => Exec['update'],
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

