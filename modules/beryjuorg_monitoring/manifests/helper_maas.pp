class beryjuorg_monitoring::helper_maas {

  cron { 'maas_region_export':
    command => "bash -c \"curl -s http://localhost:5239/metrics > /var/lib/prometheus/node-exporter/maas-region.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }
  cron { 'maas_rack_export':
    command => "bash -c \"curl -s http://localhost:5249/metrics > /var/lib/prometheus/node-exporter/maas-rack.prom\"",
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}
