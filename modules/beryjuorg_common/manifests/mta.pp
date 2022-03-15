# MTA
#
class beryjuorg_common::mta {

  file { '/etc/mailname':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => inline_template('<%= @trusted["certname"] %>'),
  }
  package { ['postfix', 'mailutils']:
    ensure => 'present'
  }
  ->service { 'postfix':
    ensure => 'running',
  }

  file { '/etc/postfix/main.cf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('beryjuorg_common/ubuntu-postfix-main.cf.epp'),
    notify  => Service['postfix']
  }

  exec { '/usr/bin/newaliases':
    refreshonly => true
  }
  file { '/etc/aliases':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Exec['/usr/bin/newaliases'],
    content => epp('beryjuorg_common/aliases.epp')
  }

  exec { 'postmap':
    command     => '/usr/sbin/postmap hash:/etc/postfix/relay_passwd',
    refreshonly => true
  }

  $relay_vars = {
    'creds' => Deferred('vault_lookup::lookup', [lookup('beryjuorg_common::mta_forward_auth'), lookup('beryjuorg_common::vault_addr')]),
    'forward' => lookup('beryjuorg_common::mta_forward'),
  }

  file { '/etc/postfix/relay_passwd':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => [
      Exec['postmap'],
      Service['postfix'],
    ],
    content => Deferred('inline_epp', [file('beryjuorg_common/relay_passwd.epp'), $relay_vars]),
  }

}
