module "authentik-app-mimir" {
  source = "../modules/authentik_app"

  name     = "Mimir"
  group    = "Monitoring"
  internal = "http://mimir.mimir"
  external = "https://mimir.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/grafana-mimir.png"
}

module "authentik-app-loki" {
  source = "../modules/authentik_app"

  name     = "Loki"
  group    = "Monitoring"
  internal = "http://loki.loki"
  external = "https://loki.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/grafana-loki.png"
}
