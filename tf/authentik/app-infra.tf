module "authentik-app-oxidized" {
  source = "../modules/authentik_app"

  name     = "oxidized"
  group    = "Infrastructure"
  internal = ""
  external = "https://oxidized.lab.beryju.io"
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
  # TODO
  jwt_federation_sources = [
    "165de436-29ea-45bf-bf67-cfd45a4dff74",
    "c490fcc3-a0ac-487d-a375-7c1d8d9b6469",
    "2188315f-103c-402e-b94e-035c60bdf884",
    "18d93ee0-e65e-4bbc-bddd-11971f1a1cce",
  ]
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
  jwt_federation_sources = [
    "165de436-29ea-45bf-bf67-cfd45a4dff74",
    "c490fcc3-a0ac-487d-a375-7c1d8d9b6469",
    "2188315f-103c-402e-b94e-035c60bdf884",
    "18d93ee0-e65e-4bbc-bddd-11971f1a1cce",
  ]
}

resource "authentik_group" "taskin" {
  name = "_acl_taskin"
}

module "authentik-app-taskin" {
  source = "../modules/authentik_app"

  name     = "Taskin"
  internal = ""
  external = "https://taskin.lab.beryju.io"
  group    = "Ripple"
  access_group = [
    authentik_group.taskin.id,
  ]
  icon_url = "https://public.s3.beryju.io/authentik-icons/grafana-mimir.png"
}
