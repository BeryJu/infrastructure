define beryjuorg_monitoring::metric (
  Array[String] $content = [],
  String $ensure = 'present',
) {

  file { "/var/lib/prometheus/node-exporter/${name}.prom":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${join($content, "\n")}\n",
  }

}
