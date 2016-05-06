#Configure the M1 custom RHEL repos based on OS major version
class mric::repo inherits mric {

if $operatingsystemmajrelease == '6' {
    file { 'm1.repo':
      ensure   => file,
      path     => '/etc/yum.repos.d/m1.repo',
      content  => "[Mitchell1]
name=Mitchell1 RHEL 6.x Repository
baseurl=ftp://powc-repo-02-pv.corp.mitchellrepair.com/
gpgcheck=0
enabled=1",
    }
} 
if $operatingsystemmajrelease == '7' {
    file {'m1.repo':
      ensure   => file,
      path     => '/etc/yum.repos.d/m1.repo',
      content  => "[Mitchell1]
name=Mitchell1 RHEL 7.x Repository
baseurl=ftp://powc-repo-03-pv.corp.mitchellrepair.com/
gpgcheck=0
enabled=1",
      }
   }
}
