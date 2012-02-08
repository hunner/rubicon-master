define usermanagement::user($ensure, $homedir=undef, $group=undef) {
  if $name == 'root' { fail("You fail") }
  if ! $homedir {
    $homedir_real = "/home/${name}"
  } else {
    $homedir_real = $homedir
  }
  if ! $group {
    $group_real = $name
  } else {
    $group_real = $group
  }
  user { $name:
    ensure  => $ensure,
    gid     => $group_real,
    homedir => $homedir_real,
  }
  file { $homedir_real:
    ensure => $ensure,
  }
  if $ensure == 'present' {
    if ! defined(Group[$group_real]) {
      group { $group_real:
        ensure => $ensure,
      }
    }
  }
}
