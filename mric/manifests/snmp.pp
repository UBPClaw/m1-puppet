class mric::snmp inherits mric {

  package { $snmp_packages:
    ensure          => $package_ensure,
#   name            => $snmp_packages,
    before          => File['/etc/snmp/snmpd.conf']
  }

  if $::is_virtual  {
    file { '/etc/snmp/snmpd.conf':
      ensure          => file,
      path            => '/etc/snmp/snmpd.conf',
      mode            => '600',
      source          => $snmp_config
    } 
  } 

  else {
    file { '/etc/snmp/snmpd.conf':
      ensure          => file,
      path            => '/etc/snmp/snmpd.conf',
      mode            => '600',
      source          => $snmp_physical
    }
  }

   service { 'snmpd':
     ensure        => $service_ensure,
     enable        => $service_enable,
#    name          => 'snmpd',
     hasstatus     => true,
     hasrestart    => true,
     subscribe     => File['/etc/snmp/snmpd.conf']
   }
}
