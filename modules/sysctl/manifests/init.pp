class sysctl {
  exec { 'parse sysctl':
    command     => '/sbin/sysctl -p',
    refreshonly => true,
  }
}
