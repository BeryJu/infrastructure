module "authentik-app-oxidized" {
  source = "../modules/authentik_app"

  name     = "oxidized"
  internal = "http://mon1.prod.beryju.org:8888"
  external = "https://oxidized.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
