class beryjuorg_monitoring::helper_unifi {

  cron { 'unifi_export':
    command => "bash -c \"curl -s http://localhost:9130/metrics > /var/lib/prometheus/node-exporter/unifi.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}
