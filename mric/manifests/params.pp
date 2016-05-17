class mric::params {

  $autoupdate        = false
  $logrotate_config  = 'puppet:///modules/mric/syslog'
  $omsa_url          = 'http://linux.dell.com/repo/hardware/latest/bootstrap.cgi'
  $package_ensure    = 'present'
  $selinux_config    = 'puppet:///modules/mric/selinux_config'
  $service_enable    = true
  $service_ensure    = running
  $service_manage    = true
  $snmp_config       = 'puppet:///modules/mric/snmpd.conf'
  $snmp_physical     = 'puppet:///modules/mric/snmpd_physical.conf'
  $snmp_packages     = [ "net-snmp", "net-snmp-utils" ]
  $syslog_config     = 'puppet:///modules/mric/rsyslog.conf'

  case $::operatingsystemmajrelease {
    '5' : {
      $package_name      = [ "wget", "man", "openssh-clients", "redhat-lsb" ]
      $syslog_file       = '/etc/syslog.conf'
      $syslog_daemon     = 'syslog'
      } 
    '6','7' : {
      $package_name      = [ "wget", "man", "cifs-utils", "openssh-clients", "redhat-lsb" ]
      $syslog_file       = '/etc/rsyslog.conf'
      $syslog_daemon     = 'rsyslog'
    }
  }
}
