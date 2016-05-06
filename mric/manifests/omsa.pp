class mric::omsa inherits mric {
  
  if $manufacturer =~ /Dell/ {
    exec { 'omsa_install' :
      path         => '/bin:/usr/bin:/usr/sbin:/sbin',
      command      => 'wget -q -O - $omsa_url | bash', 
      creates      => '/etc/yum.repos.d/dell-omsa-repository.repo',
      before       => Package[ "srvadmin-all" ]
    }
    package { 'srvadmin-all' : }

    service { 'srvadmin-services.sh' :
      provider     => 'init',
      path         => '/opt/dell/srvadmin/sbin',
      ensure       => 'true',
      hasrestart   => 'true',
      hasstatus    => 'true',
      require      => Package[ "srvadmin-all" ]
    }
  }
}
