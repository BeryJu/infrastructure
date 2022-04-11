define beryjuorg_monitoring::metric (
  String $content
) {

  file { "/var/lib/prometheus/node-exporter/${name}.prom":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${content}\n",
  }

}
