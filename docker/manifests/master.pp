class docker::master inherits docker {

  package { $master_packages:
    ensure => 'installed',
  }

  file { '/etc/etcd/etcd.conf' :
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('docker/etcd.conf.erb'),
  }

  file { '/etc/kubernetes/apiserver' :
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('docker/apiserver.erb'),
  }

  service { $master_services:
    enable    => 'true',
    ensure    => 'running',
    subscribe => File['/etc/etcd/etcd.conf', '/etc/kubernetes/apiserver']
  }
}
