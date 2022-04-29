node /puppet.*/ {
  class { 'puppetdb':
    listen_address => $facts['ipaddress'],
  }
  class { 'puppetdb::master::config': }
  lookup('classes', {merge => unique}).include
}
node default {
  lookup('classes', {merge => unique}).include
}
