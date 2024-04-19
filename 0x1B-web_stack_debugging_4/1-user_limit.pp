# Change the OS configuration so that it is possible to login with the
# "holberton" user and open a file without any error message
exec { 'remove_holberton_limits':
  command  => 'sed -i "/^holberton.*/d" /etc/security/limits.conf',
  provider => shell,
}
