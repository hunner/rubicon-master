include services
services::service { 'ftp':
  port      => 22,
  protocols => ['tcp','udp'],
  aliases   => ['fsp','fspd'],
}
services::service { 'ssh':
  port    => 22,
  comment => "SSH Remote Login Protocol",
}
services::service { 'telnet':
  port => '23',
}
