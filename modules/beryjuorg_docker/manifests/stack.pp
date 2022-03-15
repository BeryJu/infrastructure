define beryjuorg_docker::stack (
  String $template,
  Optional[Array[String]] $vault_vars,
  String $vault_addr,
  String $vault_mount = "kv",
) {

  if $vault_vars {
    $context = $vault_vars.map |$vault_var| {
      [regsubst($vault_var, '/', '_', 'G'), Deferred('vault_lookup::lookup', ["${vault_mount}/data/${vault_var}", $vault_addr])]
    }
  } else {
    $context = {}
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
    content => Deferred('inline_epp', [file("beryjuorg_docker/${template}/docker-compose.yaml"), Hash($context)]),
    notify  => Exec["${name}-update"],
  }
  ->docker_compose { $name:
    ensure        => present,
    compose_files => ["/srv/stacks/${name}/docker-compose.yml"],
    notify        => Exec["${name}-update"],
  }
  exec { "${name}-update":
    command => '/usr/local/bin/docker-compose up -d',
    cwd     => "/srv/stacks/${name}",
    refreshonly => true,
  }

}
