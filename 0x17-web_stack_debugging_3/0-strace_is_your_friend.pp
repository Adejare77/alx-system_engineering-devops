# the extension phpp is wrong. find phpp in wp-settings.php and replace with php

exec { 'replace_phpp':
  command => 'sed -i "s/phpp/php/" /var/www/html/wp-settings.php',
  path    => ['/usr/bin', '/usr/sbin']
}
