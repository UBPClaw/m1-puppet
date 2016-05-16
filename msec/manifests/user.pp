class msec::user {

  user { 'iusr_09':
    ensure   => 'present',
    home     => '/var/nebula',
    shell    => '/bin/bash',
    password => '$6$RYwD/ImY$SOHlQ0gJqwUUuNDMl8EK1M2R92Moe8Mo0dmYfKR.HnalCBOiEFDkgqx0Kx5W6etJ1qj7lQNYYRaGWbldDWsiL.',
  }
}
