module "authentik-app-sabnzbd" {
  source = "../modules/authentik_app"

  name     = "sabnzbd"
  group    = "Personal"
  internal = "http://sabnzbd.dl-stack.svc.cluster.local:8080"
  external = "https://sabnzbd-dl-stack.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-sonarr" {
  source = "../modules/authentik_app"

  name     = "sonarr"
  group    = "Personal"
  internal = "http://sonarr.dl-stack.svc.cluster.local:8989"
  external = "https://sonarr-dl-stack.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-radarr" {
  source = "../modules/authentik_app"

  name     = "radarr"
  group    = "Personal"
  internal = "http://radarr.dl-stack.svc.cluster.local:7878"
  external = "https://radarr-dl-stack.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-tautulli" {
  source = "../modules/authentik_app"

  name     = "tautulli"
  group    = "Personal"
  internal = "http://plex1.prod.beryju.org:8181"
  external = "https://tautulli-dl-stack.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
