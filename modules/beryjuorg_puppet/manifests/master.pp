class beryjuorg_puppet::master {

  class { 'puppetdb':
    listen_address => $facts['ipaddress'],
  }
  class { 'puppetdb::master::config': }

}
