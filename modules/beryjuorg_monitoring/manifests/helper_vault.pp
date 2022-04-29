class beryjuorg_monitoring::helper_vault {

  file { '/opt/vault_exporter.sh':
    ensure  => 'present',
    owner   => 'prometheus',
    group   => 'prometheus',
    mode    => '0750',
    content => file('beryjuorg_monitoring/helper_vault.sh'),
  }
  cron { 'vault_export':
    command => '/opt/vault_exporter.sh > /var/lib/prometheus/node-exporter/vault.prom',
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}
