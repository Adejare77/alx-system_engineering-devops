# Install a specific version of flask from pip3

package { 'python3':
  ensure   => '3.8.10',
   name    => 'python3',
}

package { 'flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
  require  => Package['python3']
}
