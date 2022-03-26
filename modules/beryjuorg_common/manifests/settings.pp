# Common settings
#
class beryjuorg_common::settings {

  file { '/etc/sudoers.d/beryjuorg-passwordless':
    content => '%sudo ALL=(ALL) NOPASSWD: ALL'
  }

  # fix console-setup service on ubuntu 20.04
  service { 'console-setup':
    ensure => 'running',
    enable => true,
  }
  file { '/usr/share/X11/xkb/symbols/en':
    ensure => 'link',
    target => '/usr/share/X11/xkb/symbols/us',
    notify => Service['console-setup']
  }

  file { '/etc/profile.d/00-beryjuorg.sh':
    ensure => present,
    source => 'puppet:///modules/beryjuorg_common/aliases.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'.
  }

  service { 'multipathd':
    ensure => 'stopped'
  }

  service { 'systemd-journald':
    ensure => 'running',
    enable => true,
  }
  file { '/etc/systemd/journald.conf':
    ensure => present,
    source => 'puppet:///modules/beryjuorg_common/journald.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['systemd-journald']
  }

}
