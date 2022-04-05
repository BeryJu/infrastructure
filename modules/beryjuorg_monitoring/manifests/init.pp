# Init
#
class beryjuorg_monitoring {

  $context = {
    'password' => Deferred('vault_lookup::lookup', ['kv/data/services/prometheus/node_exporter', lookup('beryjuorg_common::vault_addr')]),
  }

  apt::ppa { 'ppa:prometheus-release-tracking/prometheus-exporters':
    notify => Exec['apt_update']
  }
  ->package { 'prometheus-node-exporter':
    ensure => '1.1.2+ds-2~202107081617~ubuntu20.04.1',
    notify => Service['prometheus-node-exporter'],
  }
  ->user { 'prometheus':
    ensure => 'present',
    groups => ['prometheus', 'ssl-cert']
  }

  file { '/etc/prometheus-node-exporter.yaml':
    ensure  => 'present',
    owner   => 'prometheus',
    group   => 'prometheus',
    mode    => '0640',
    content => Deferred('inline_epp', [file('beryjuorg_monitoring/web.config.yaml.epp'), $context]),
    notify  => Service['prometheus-node-exporter'],
  }
  ->file { '/etc/default/prometheus-node-exporter':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('beryjuorg_monitoring/default.erb'),
    notify  => Service['prometheus-node-exporter'],
  }
  ->file { '/var/lib/prometheus/node-exporter/beryjuorg.prom':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('beryjuorg_monitoring/beryjuorg.prom.erb'),
  }

  service { 'prometheus-node-exporter':
    ensure => 'running'
  }

}
