class mric (
  $autoupdate        = $mric::params::autoupdate,
  $logrotate_config  = $mric::params::logrotate_config,
  $omsa_url          = $mric::params::omsa_url,
  $package_ensure    = $mric::params::package_ensure,
  $package_name      = $mric::params::package_name,
  $selinux_config    = $mric::params::selinux_config,
  $service_enable    = $mric::params::service_enable,
  $service_ensure    = $mric::params::service_ensure,
  $service_manage    = $mric::params::service_manage,
  $snmp_config       = $mric::params::snmp_config,
  $snmp_physical     = $mric::params::snmp_physical,
  $snmp_packages     = $mric::params::snmp_packages,
  $syslog_config     = $mric::params::syslog_config,
  $syslog_file       = $mric::params::syslog_file,
  $syslog_daemon     = $mric::params::syslog_daemon,
) inherits mric::params {
  
  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  #anchor { 'mric::begin': } ->
  class { '::mric::repo': } ->
  class { '::mric::install': } ->
  class { '::mric::omsa': } ~>
  class { '::mric::snmp': } ~>
  class { '::mric::syslog': }
  class { '::mric::ntp': }
  #anchor { 'mric::end': }
}
