module "authentik-app-oxidized" {
  source = "../modules/authentik_app"

  name     = "oxidized"
  group    = "Infrastructure"
  internal = "http://mon1.prod.beryju.org:8888"
  external = "https://oxidized.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-unifi" {
  source = "../modules/authentik_app"

  name     = "UniFi"
  group    = "Infrastructure"
  internal = "https://unifi1.prod.beryju.org:8443"
  external = "https://unifi.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}