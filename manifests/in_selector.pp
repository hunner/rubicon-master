file { '/tmp/os':
  ensure => present,
  content => $::operatingsystem ? {
    'centos' => "No pretty red hats, no support\n",
    'ubuntu' => "Linux for your mom\n",
    'rhel'   => "Pay us money to use our red hats\n",
    default  => "Unknown OS: ${::operatingsystem}\n",
  },
}
