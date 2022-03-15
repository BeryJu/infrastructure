module "authentik-app-sabnzbd" {
  source = "../modules/authentik_app"

  name     = "sabnzbd"
  internal = "http://sabnzbd.dl-stack.svc.cluster.local:8080"
  external = "https://sabnzbd.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
