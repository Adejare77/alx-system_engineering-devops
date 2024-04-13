# Fix 500 error. find phpp in wp-settings.php and replace with php

exec { 'replace_phpp':
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  provider => shell,
}
