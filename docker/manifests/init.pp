# Class: docker
# ===========================
#
# Full description of class docker here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'docker':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class docker (
  $master_packages   = $docker::params::master_packages,
  $master_services   = $docker::params::master_services,
  $minion_packages   = $docker::params::minion_packages,
  $minion_services   = $docker::params::minion_services,
  $kubernetes_master = $docker::params::kubernetes_master,
) inherits docker::params {

  service { 'firewalld':
    ensure => 'stopped',
    enable => 'false',
  }
  class { '::docker::hosts': }
}
