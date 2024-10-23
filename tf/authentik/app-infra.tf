module "authentik-app-oxidized" {
  source = "../modules/authentik_app"

  name     = "oxidized"
  group    = "Infrastructure"
  internal = ""
  external = "https://oxidized.infra.beryju.org"
  icon_url = "fa://fa-check-circle"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-mimir" {
  source = "../modules/authentik_app"

  name     = "Mimir"
  group    = "Monitoring"
  internal = "http://mimir.mimir"
  external = "https://mimir.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url        = "https://public.s3.beryju.io/authentik-icons/grafana-mimir.png"
  meta_publisher  = "Grafana Labs"
  skip_path_regex = "/ready"
}

module "authentik-app-loki" {
  source = "../modules/authentik_app"

  name     = "Loki"
  group    = "Monitoring"
  internal = "http://loki.loki"
  external = "https://loki.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url       = "https://public.s3.beryju.io/authentik-icons/grafana-loki.png"
  meta_publisher = "Grafana Labs"
}
