class services {
  $basedir = '/tmp'
  file { "${basedir}/services.d":
    ensure  => directory,
    purge   => true,
    recurse => true,
  }
  exec { 'rebuild-services':
    command     => "/bin/cat ${basedir}/services.d/* > ${basedir}/services",
    refreshonly => true,
    subscribe   => File["${basedir}/services.d"],
  }
  file { "${basedir}/services":
    mode    => '0644',
    require => Exec['rebuild-services'],
  }
}
