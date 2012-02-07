File {
  owner => '0',
  group => '0',
  mode  => '0644',
}

file { '/tmp/defaults':
  ensure => directory,
}

file { '/tmp/defaults/hello':
  ensure => present,
}

file { '/tmp/defaults/goodbye':
  ensure  => file,
  content => "Goodbye world!\n",
}
