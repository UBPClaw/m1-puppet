class docker::hosts inherits docker {

  resources { 'host':
    purge        => true,
  }

  host { 'master':
    ensure       => 'present',
    host_aliases => [ 'kubernetes' ],
    ip           => '10.14.3.124',
  }

  host { 'localhost':
    ensure       => 'present',
    host_aliases => [ 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4' ],
    ip           => '127.0.0.1',
  }

  host { 'localhost6':
    ensure       => 'present',
    host_aliases => [ 'localhost.localdomain', 'localhost', 'localhost6.localdomain6' ],
    ip           => '::1',
  }

  @@host { $::fqdn:
    ensure       => 'present',
    host_aliases => [$::hostname],
    ip           => $::ipaddress,
    tag          => 'docker',
  }
  Host <<| tag == 'docker' |>>
}
