class motd {
  $root_contact = extlookup('root_contact')

  file { '/etc/motd':
    ensure  => present,
    content => template("motd/motd.erb"),
  }
}
