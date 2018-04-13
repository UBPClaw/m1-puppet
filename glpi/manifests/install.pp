class glpi::install {

  package { 'ocsinventory-agent':
    ensure => present,
  }
  
  if $facts['operatingsystemmajrelease'] == '7' {
    package { 'perl-LWP-Protocol-https' : }
  }
}
