case $::operatingsystem {
  'centos': {
    file { '/tmp/os':
      content => 'No pretty red hats, no support',
    }
  }
  'ubuntu': {
    file { '/tmp/os':
      content => 'Linux for your mom',
    }
  }
  'rhel': {
    file { '/tmp/os':
      content => 'Pay us money to use our red hats',
    }
  }
  default: { }
}
