# client configuration file

file { 'change_ssh_config':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  content => "PasswordAuthentication no\nIdentityFile ~/.ssh/school\n",
}
