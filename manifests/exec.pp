exec { 'touch /tmp/foo':
  path    => ['/bin','/sbin','/usr/bin','/usr/sbin'],
  creates => '/tmp/foo',
}
