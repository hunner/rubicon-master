class bluetooth($disable = false) {
  if $disable {
    Service['hidd'] -> Package['bluez-utils'] -> Package['bluez-libs']
    $ensure = 'absent'
    $enable = false
  } else {
    Service['hidd'] <- Package['bluez-utils'] <- Package['bluez-libs']
    $ensure = 'present'
    $enable = true
  }

  package { ['bluez-libs', 'bluez-utils']:
    ensure => $ensure,
  }
  service { 'hidd':
    ensure  => $enable,
    enable  => $enable,
    status  => 'source /etc/init.d/functions && status hidd',
  }
}
