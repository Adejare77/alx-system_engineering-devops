# Install Nginx web server with Puppet

# update and upgrade packages
exec { 'apt-update-upgrade':
  command     => '/usr/bin/apt-get update && /usr/bin/apt-get upgrade -y',


  refreshonly => true,
}


package { 'install_nginx':
  ensure   => installed,
  name     => 'nginx',
  provider => 'apt',
}

file { 'nginx_config':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => 'server {
        listen 80 default_server;
        listen [::]:80;

        root /var/www/html;
        index index.html;

        server_name _;

        location / {
            try_files $uri $uri/ =404;
        }

        location /redirect_me {
            return 301 "https://www.youtube.com/watch?v=QH2-TGUlwu4";
        }

        error_page 404 /404.html;

        location =/404.html {
            internal;
        }
}',
  require => Package['install_nginx'],
}

file { 'sym_link':
  ensure    => link,
  target    => '/etc/nginx/sites-available/default',
  path      => '/etc/nginx/sites-enabled/default',
  subscribe => File['nginx_config'],
  notify    => Service['nginx_service'],
}

file { 'index_html':
  path   => '/var/www/html/index.html',
  content => "Hello World!\n"
}

service { 'nginx_service':
  name     => 'nginx',
  restart  => true,
  ensure   => 'running',
  enable   => true,
  require  => Package['install_nginx'],
}
