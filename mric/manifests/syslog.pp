class mric::syslog inherits mric {

  file {'/var/log/kern.log':
    path          => '/var/log/kern.log',
    ensure        => file,
    mode          => '600',
    owner         => 'root',
    group         => 'root',
    before        => File['/etc/syslog.conf']
  }

  file {'/var/log/daemon.log':
    path          => '/var/log/daemon.log',
    ensure        => file,
    mode          => '600',
    owner         => 'root',
    group         => 'root',
    before        => File['/etc/syslog.conf']
  }

  file {'/var/log/syslog':
    path          => '/var/log/syslog',
    ensure        => file,
    mode          => '600',
    owner         => 'root',
    group         => 'root',
    before        => File['/etc/syslog.conf']
  }

  file {'/etc/logrotate.d/syslog':
    path          => '/etc/logrotate.d/syslog',
    source        => 'puppet:///modules/mric/syslog',
    ensure        => present,
  }

  file {'/etc/syslog.conf':
    path          => $syslog_file,
    source        => 'puppet:///modules/mric/rsyslog.conf',
    mode          => '600',
    ensure        => present,
  }

   service {'$syslog_daemon':
     ensure       => $service_ensure,
     enable       => $service_enable,
     name         => $syslog_daemon,
     hasstatus    => true,
     hasrestart   => true,
     subscribe    => File['/etc/syslog.conf']
   }
}
