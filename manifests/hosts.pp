resources { 'host':
  purge => true,
}
host { 'localhost6.localdomain6':
  ensure       => 'present',
  host_aliases => ['localhost6'],
  ip           => '::1',
  target       => '/etc/hosts',
}
host { 'training.puppetlabs.lan':
  ensure       => 'present',
  comment      => 'A comment',
  host_aliases => ['localhost.localdomain', 'localhost', 'puppet.puppetlabs.lan', 'puppet', 'training'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
#host { 'kermit':
#  ip => '127.0.0.1',
#}
#host { 'piggy':
#  ip => '127.0.0.1',
#}
