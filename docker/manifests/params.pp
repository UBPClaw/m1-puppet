class docker::params {

  $master_packages   = [ "etcd", "kubernetes" ]
  $master_services   = [ "etcd", "kube-apiserver", "kube-controller-manager", "kube-scheduler" ]
  $minion_packages   = [ "flannel", "kubernetes" ]
  $minion_services   = [ "kube-proxy", "kubelet", "docker" ] #"flanneld" ] (add this back in when we decide if were using flannel or not)
  $kubernetes_master = 'powc-kube-01-pv'
}
