define sysctl::setting($value) {
  $key = $name
  include sysctl

  augeas { "sysctl_conf/$key":
    context => '/files/etc/sysctl.conf',
    onlyif  => "get $key != '$value'",
    changes => "set $key '$value'",
    notify  => Exec["parse sysctl"],
  }
}
