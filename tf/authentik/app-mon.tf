module "authentik-app-alertmanager" {
  source = "../modules/authentik_app"

  name     = "Alertmanager"
  group    = "Monitoring"
  internal = "http://prom-kube-prometheus-stack-alertmanager.monitoring-system.svc.cluster.local:9093"
  external = "https://alertmanager.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/alertmanager.png"
}

module "authentik-app-thanos" {
  source = "../modules/authentik_app"

  name     = "Thanos"
  group    = "Monitoring"
  internal = "http://thanos-query-frontend.main-monitoring.svc.cluster.local:9090"
  external = "https://thanos.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://images.s3.beryju.org/thanos-icon-color.png"
}

module "authentik-app-prom" {
  source = "../modules/authentik_app"

  name     = "Prometheus"
  group    = "Monitoring"
  internal = "http://beryjuorg-mon-prometheus.monitoring-system.svc.cluster.local:9090"
  external = "https://prometheus.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://images.s3.beryju.org/prometheus-icon-color.png"
}
