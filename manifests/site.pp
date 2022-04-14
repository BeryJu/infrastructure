node /puppet.*/ {
  class { 'puppetdb': }
  class { 'puppetdb::master::config':
    listen_addresses => $facts['ipaddress'],
  }
  lookup('classes', {merge => unique}).include
}
node default {
  if $::facts[os][family] != 'windows' {
    lookup('classes', {merge => unique}).include
  }
}
