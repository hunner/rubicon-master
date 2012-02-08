define services::service (
  $port,
  $protocols = ['tcp','udp'],
  $aliases = undef,
  $comment = undef
) {
  file {"${services::basedir}/services.d/${name}":
    ensure  => $ensure,
    content => template('services/service.erb'),
    notify  => Exec['rebuild-services'],
  }
}
