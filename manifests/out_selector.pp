$content = $::operatingsystem ? {
  'centos' => 'No pretty red hats, no support',
  'ubuntu' => 'Linux for your mom',
  'rhel'   => 'Pay us money to use our red hats',
  default  => "Unknown OS: ${::operatingsystem}",
}
file { '/tmp/os':
  ensure  => present,
  content => "${content}\n",
}
