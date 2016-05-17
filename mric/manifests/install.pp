class mric::install inherits mric {

  package {$package_name:
    ensure => $package_ensure,
    } 
  }
