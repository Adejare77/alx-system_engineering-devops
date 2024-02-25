# client configuration file

file { 'change_ssh_config':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  content => "PasswordAuthentication no\nIdentityFile ~/.ssh/school\n",
}


# The below would have work too, but not all puppet supports augeas
# To install: puppet module install puppetlabs-augeas_core

# augeas { 'change_ssh_config':
#   lens    => 'Shellvars.lns',
#   incl    => '/etc/ssh/ssh_config',
#   changes => [
#     'set IdentityFile ~/.ssh/school',
#     'set PasswordAuthentication no'
#   ]
# }
