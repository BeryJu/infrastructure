class beryjuorg_monitoring::helper_local_prom {

  cron { 'etcd_export':
    command => 'curl "http://localhost:9090/federate?match[]=\{__name__=~\".*\"\}" > /var/lib/prometheus/node-exporter/prometheus-local.prom',
    user    => 'root',
    hour    => "*",
    minute  => "*",
  }

}
