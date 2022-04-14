node /puppet.*/ {
  class { 'puppetdb':
    listen_address => $facts['ipaddress'],
  }
  class { 'puppetdb::master::config': }
  lookup('classes', {merge => unique}).include
}
node default {
  if $::facts[os][family] != 'windows' {
    lookup('classes', {merge => unique}).include
  }
}
