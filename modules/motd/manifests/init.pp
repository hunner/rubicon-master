class motd {
  $region = "us-west"
  file { '/etc/motd':
    ensure  => present,
    content => template("${module_name}/motd.erb"),
  }
}
