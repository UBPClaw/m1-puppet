class glpi::config {

  file { '/etc/ocsinventory/ocsinventory-agent.cfg':
    ensure  => 'file',
    group   => '0',
    mode    => '0644',
    owner   => '0',
    content => epp('glpi/ocsinventory-agent.cfg.epp'),
  }
}
