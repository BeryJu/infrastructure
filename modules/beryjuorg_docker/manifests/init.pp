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

  $facts['docker']['network'].map |$name, $network| {
    if $network["name"] != "" {
      beryjuorg_monitoring::metric { "docker-network-${name}":
        content => "beryjuorg_machine_docker_network{name=\"${name}\", driver=\"${network["Driver"]}\"} 1"
      }
    }
  }

}
