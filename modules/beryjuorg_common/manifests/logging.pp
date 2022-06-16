class beryjuorg_common::logging {

  package { 'rsyslog':
    ensure => 'present'
  }
  ->service { 'rsyslog':
    ensure => 'running',
  }

  file { '/etc/rsyslog.d/10-splunk.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => 'puppet:///modules/beryjuorg_common/rsyslog/10-splunk.conf',
    notify  => Service['rsyslog']
  }

}
