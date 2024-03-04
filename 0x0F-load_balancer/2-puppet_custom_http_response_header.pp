# Configure Nginx so that its HTTP response contains a custom
# header (on web-01 and web-02) with Puppet.

exec { 'update_and_upgrade':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Exec['install_nginx'],
}


exec {'install_nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['add_header'],
}


exec { 'add_header':
  provider    => shell,
  environment => ["HOST=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
  before      => Exec['restart_nginx'],
}

exec { 'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}

