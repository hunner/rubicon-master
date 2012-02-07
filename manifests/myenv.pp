$username = 'hunner'

$sourcepath = '/etc/puppetlabs/puppet/files'

$homedir = $username ? {
  'root'  => '/root',
  default => "/home/${username}",
}
File {
  owner => $username,
  mode  => '0644',
}
file { $homedir:
  ensure => directory,
  mode   => '0711',
}
file { "${homedir}/.vim":
  ensure  => directory,
  recurse => true,
  replace => false,
  source  => "${sourcepath}/vim",
}
file { "${homedir}/.vimrc":
  ensure => present,
  replace => false,
  source => "${sourcepath}/vimrc",
}
file { "${homedir}/.ssh":
  ensure => directory,
  mode   => '0700',
}
if $username == 'root' {
  file { "${homedir}/.ssh/authorized_keys":
    ensure => absent,
  }
} else {
  file { "${homedir}/.ssh/authorized_keys":
    ensure => present,
    source => "${sourcepath}/authorized_keys/${username}.key",
  }
}
