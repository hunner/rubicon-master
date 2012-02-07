class ssh {
  package { 'sshd':
    name   => 'openssh-server',
    ensure => present,
  }
  file { '/etc/ssh/sshd_config':
    ensure  => present,
    mode    => '0600',
    owner   => '0',
    group   => '0',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Package['sshd'],
    notify  => Service['sshd'],
  }
  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
