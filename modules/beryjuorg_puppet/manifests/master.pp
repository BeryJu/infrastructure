class beryjuorg_puppet::master {

  $splunk_token = vault_lookup::lookup('kv/data/splunk/hec/puppet', lookup('beryjuorg_common::vault_addr'))

  class { 'puppetdb':
    listen_address => $facts['ipaddress'],
  }
  class { 'puppetdb::master::config': }

  class { 'splunk_hec':
    enable_reports           => true,
    manage_routes            => true,
    events_reporting_enabled => true,
    token                    => $splunk_token.unwrap['data']['token'],
    url                      => lookup('beryjuorg_logging::splunk-collector'),
  }

}
