file { '/etc/sudoers':
  ensure => present,
  source => '/etc/puppetlabs/puppet/files/sudoers',
  mode   => '0440',
  group  => 'root',
  owner  => 'root',
}
