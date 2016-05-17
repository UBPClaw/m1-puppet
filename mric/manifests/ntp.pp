class mric::ntp inherits mric {

  package { 'ntp' :
    ensure        => present,
  }

  file { '/etc/ntp.conf' :
    ensure        => 'file',
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    source        => 'puppet:///modules/mric/ntp.conf',
    require       => Package[ "ntp" ],
  }

  service { 'ntpd' :
    ensure        => $service_ensure,
    enable        => $service_enable,
    hasstatus     => true,
    hasrestart    => true,
    subscribe     => File['/etc/ntp.conf']
  }
}
