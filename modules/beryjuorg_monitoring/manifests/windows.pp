# Ensure windows exporter is actually running since windows likes to forget to start the service
#
class beryjuorg_monitoring::windows {

  service { 'windows_exporter':
    ensure => 'running'
  }

}
