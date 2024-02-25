# Install a specific version of flask from pip3

package { 'install_werkzeug':
  ensure   => '1.0.1',
   name    => 'werkzeug',
  provider => 'pip3',
}

package { 'flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
  require  => Package['install_werkzeug']
}
