#
#
class beryjuorg_docker {

  file { '/etc/docker/daemon.json':
    ensure => absent,
  }
  ->class { 'docker':
    ip_forward       => true,
    log_driver       => 'json-file',
    log_opt          => [
      'max-size=10m',
      'max-file=3',
    ],
    registry_mirror  => [
      'https://proxy.registry.beryju.org'
    ],
    extra_parameters => '--live-restore'
  }
  ->sysctl { 'vm.swappiness': value => '0' }

  docker::run { 'cadvisor':
    ensure => absent
    image            => 'gcr.io/cadvisor/cadvisor',
    ports            => ['127.0.0.1:9101:8080'],
    volumes          => [
      '/:/rootfs:ro',
      '/var/run:/var/run:ro',
      '/sys:/sys:ro',
      '/var/lib/docker/:/var/lib/docker:ro',
      '/dev/disk/:/dev/disk:ro',
    ],
    privileged       => true,
    extra_parameters => [ '--restart=always', '--device=/dev/kmsg' ],
  }
  include beryjuorg_monitoring::helper_cadvisor

  $metrics = $facts['docker']['network'].map |$name, $network| {
    beryjuorg_monitoring::metric { "docker-network-${name}":
        ensure  => absent,
    }
    if $network["name"] != "" {
      "beryjuorg_machine_docker_network{name=\"${name}\", driver=\"${network["Driver"]}\"} 1"
    }
  }
  beryjuorg_monitoring::metric { "docker-networks":
    content => $metrics,
  }

}
