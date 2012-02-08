class sudo {
  file { '/etc/sudoers.check':
    ensure => present,
    source  => 'puppet:///modules/sudo/sudoers',
  }
  exec { 'check sudoers':
    command   => 'visudo -c -f /etc/sudoers.check',
    path      => '/usr/sbin:/usr/bin:/bin',
    unless    => 'diff /etc/sudoers /etc/sudoers.check',
    logoutput => 'on_failure',
    require   => File['/etc/sudoers.check'],
  }
  file { '/etc/sudoers':
    ensure  => present,
    source  => 'puppet:///modules/sudo/sudoers',
    require => Exec['check sudoers'],
  }
}
