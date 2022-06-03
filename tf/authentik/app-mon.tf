module "authentik-app-alertmanager" {
  source = "../modules/authentik_app"

  name     = "Alertmanager"
  group    = "Monitoring"
  internal = ""
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
  internal = "http://mimir.mimir.svc.cluster.local"
  external = "https://thanos.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/thanos-icon-color.png"
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
  icon_url = "https://public.s3.beryju.org/authentik-icons/prometheus-icon-color.png"
}
