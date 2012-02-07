class sudoers {
  file { '/etc/sudoers':
    ensure => present,
    source => 'puppet:///modules/sudoers/sudoers',
    mode   => '0440',
    group  => 'root',
    owner  => 'root',
  }
}
