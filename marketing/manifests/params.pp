# marketing params
class marketing::params {
  $mktg_packages      = ['rh-php56', 'rh-php56-php-cli', 'rh-php56-php-common', 'rh-php56-php-fpm', 'rh-php56-php-gd', 'rh-php56-php-mysqlnd', 'rh-php56-php-pdo', 'rh-php56-php-xml', 'glusterfs', 'glusterfs-fuse', 'glusterfs-server'],
  $mktg_servers       = ['powh-mktg-01-pv.m1hosting.local', 'powh-mktg-02-pv.m1hosting.local'],
  $mktg_edit_nodes    = ['powh-mktg-01-pv.m1hosting.local'],
  $mktg_public_nodes  = ['powh-mktg-02-pv.m1hosting.local'],
}
