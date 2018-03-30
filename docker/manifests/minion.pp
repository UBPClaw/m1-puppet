class docker::minion inherits docker {

  package { $minion_packages:
    ensure => 'installed',
  }

  file { '/etc/sysconfig/flanneld' :
    ensure  => 'file',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('docker/flanneld.erb'),
  }

  file { '/etc/kubernetes/config' :
    ensure  => 'file',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('docker/minion.config.erb'),
  }

  file { '/etc/kubernetes/kubelet' :
     ensure  => 'file',
     group   => 'root',
     owner   => 'root',
     mode    => '0644',
     content => template('docker/kubelet.erb'),
  }

  file { '/etc/sysconfig/docker' :
    ensure  => 'file',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    content => template('docker/docker.config.erb'),
  }

  service { $minion_services:
    enable    => 'true',
    ensure    => 'running',
    subscribe => File['/etc/sysconfig/flanneld', '/etc/kubernetes/config', '/etc/kubernetes/kubelet', '/etc/sysconfig/docker',]
  }
}
