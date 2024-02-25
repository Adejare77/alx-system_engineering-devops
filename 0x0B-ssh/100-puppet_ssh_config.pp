# client configuration file

augeas { 'change_ssh_config':
  lens    => 'Shellvars.lns',
  incl    => '/etc/ssh/ssh_config',
  changes => [
    'set IdentityFile ~/.ssh/school',
    'set PasswordAuthentication no'
  ]
}
