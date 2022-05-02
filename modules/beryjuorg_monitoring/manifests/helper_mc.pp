class beryjuorg_monitoring::helper_mc {

  cron { 'mc_export':
    command => "bash -c \"curl -s http://localhost:9150/metrics > /var/lib/prometheus/node-exporter/mc.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}
