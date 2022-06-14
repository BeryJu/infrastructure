#
#
class beryjuorg_docker {

  $docker_password = vault_lookup::lookup('kv/data/authentik/service-account-sa-docker-pull-password', lookup('beryjuorg_common::vault_addr'))

  $is_kube_node = !$facts['kube_is_node']
  if lookup('beryjuorg_docker::splunk_logging', { 'default_value' => $is_kube_node }) {
    $splunk_token = vault_lookup::lookup('kv/data/splunk/hec/docker', lookup('beryjuorg_common::vault_addr'))
    $log_driver = 'splunk'
    $log_opt    = [
      "splunk-token=${splunk_token.unwrap['data']['token']}",
      'splunk-url=https://splunk-collector.infra.beryju.org',
      'splunk-format=json',
      'mode=non-blocking',
      'tag={{.ImageName}}/{{.Name}}',
    ]
  } else {
    $log_driver = 'json-file'
    $log_opt    = [
      'max-size=10m',
      'max-file=3',
    ]
  }

  file { '/etc/docker/daemon.json':
    ensure => absent,
  }
  ->class { 'docker':
    ip_forward       => true,
    log_driver       => $log_driver,
    log_opt          => $log_opt,
    registry_mirror  => [
      'https://proxy.registry.beryju.org'
    ],
    extra_parameters => '--live-restore',
  }
  ->sysctl { 'vm.swappiness': value => '0' }

  package { 'python3-docker':
    ensure => 'present'
  }

  docker::registry { 'registry.beryju.org':
    username => 'sa-docker-pull',
    password => $docker_password.unwrap['data']['key'],
  }

  if has_key($facts, 'docker') {
    $metrics = $facts['docker']['network'].map |$name, $network| {
      beryjuorg_monitoring::metric { "docker-network-${name}":
          ensure  => absent,
      }
      if $network["name"] != '' {
        "beryjuorg_machine_docker_network{name=\"${name}\", driver=\"${network['Driver']}\"} 1"
      }
    }
    beryjuorg_monitoring::metric { 'docker-networks':
      content => $metrics,
    }
  }

}
