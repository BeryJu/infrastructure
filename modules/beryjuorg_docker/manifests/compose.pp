#
#
class beryjuorg_docker::compose {

  class {'docker::compose':
    ensure  => present,
    version => '1.29.2'
  }
  ->file { '/srv/stacks/':
    ensure => 'directory',
  }

  $projects = lookup('beryjuorg_docker::stacks')
  $projects.each |$project| {
    beryjuorg_docker::stack { $project['name']:
      template   => $project['template'],
      vault_vars => $project['vault_vars'],
      vault_addr => lookup('beryjuorg_common::vault_addr')
    }
    beryjuorg_monitoring::metric { "docker-stack-${project['name']}":
      ensure  => absent,
    }
  }
  $metrics = $projects.map |$project| {
    "beryjuorg_machine_stack{name=\"${project['name']}\"} 1"
  }
  beryjuorg_monitoring::metric { "docker-stacks":
    content => $metrics,
  }

}
