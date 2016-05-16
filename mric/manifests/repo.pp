#Configure the M1 custom RHEL repos based on OS major version
class mric::repo inherits mric {
  
  $repo_server = $::operatingsystemmajrelease ? {
    '5' => 'ftp://powc-repo-01-pv.corp.mitchellrepair.com',
    '6' => 'ftp://powc-repo-02-pv.corp.mitchellrepair.com',
    '7' => 'ftp://powc-repo-03-pv.corp.mitchellrepair.com',
  }

  file { 'm1.repo':
    ensure => file,
    path   => '/etc/yum.repos.d/m1.repo',
    content => template('mric/m1.repo.erb'),
  }
}
