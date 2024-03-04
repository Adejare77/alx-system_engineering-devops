# Configure Nginx so that its HTTP response contains a custom
# header (on web-01 and web-02) with Puppet.

exec { 'update_and_upgrade':
  command => 'sudo apt-get update -y && sudo apt-get upgrade -y',
  provider    => shell,
  before  => Exec['install_nginx']
}

exec { 'install_nginx':
  command  => 'sudo apt-get install nginx -y',
  provider => shell,
  require  => Exec['update_and_upgrade'],
}

exec { 'custom_header':
  command  => 'sed -i "16i\\        add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf',
  provider => shell,
  require  => Exec['install_nginx'],
  notify   => Exec['restart_nginx']
}

exec { 'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}

