class bluetooth::disable inherits bluetooth {
  Package['bluez-utils'] {
    ensure  => absent,
    before  => Package['bluez-libs'],
    require => undef,
  }
  Package['bluez-libs'] {
    ensure => absent,
  }
  Service['hidd'] {
    ensure  => stopped,
    enable  => false,
    before  => Package['bluez-utils'],
    require => undef,
  }
}
