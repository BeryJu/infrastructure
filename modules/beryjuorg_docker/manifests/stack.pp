define beryjuorg_docker::stack (
  String $template,
  Optional[Array[String]] $vault_vars,
  String $vault_addr,
  String $vault_mount = "kv",
) {

  $context = {}
  if $vault_vars {
    $context = $vault_vars.map |$vault_var| {
      [regsubst($vault_var, '/', '_', 'G'), Deferred('vault_lookup::lookup', ["${vault_mount}/data/${vault_var}", $vault_addr])]
    }
  }

  file { "/srv/stacks/${name}":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  ->file { "/srv/stacks/${name}/docker-compose.yml":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => Deferred('inline_epp', [$template, Hash($context)]),
  }
  ->docker_compose { $name:
    ensure        => present,
    compose_files => ["/srv/stacks/${name}/docker-compose.yml"],
    notify        => Exec["${name}-update"],
  }
  ->exec { "${name}-pull":
    command => '/usr/local/bin/docker-compose pull',
    cwd     => "/srv/stacks/${name}",
  }

  exec { "${name}-update":
    command => '/usr/local/bin/docker-compose up -d',
    cwd     => "/srv/stacks/${name}",
  }

}
