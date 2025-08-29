module "authentik-app-sabnzbd" {
  source = "../modules/authentik_app"

  name     = "Sabnzbd"
  group    = "Personal"
  internal = ""
  external = "https://sabnzbd-dl-stack.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.io/authentik-icons/sabnzbd.svg"
}

module "authentik-app-sonarr" {
  source = "../modules/authentik_app"

  name     = "Sonarr"
  group    = "Personal"
  internal = ""
  external = "https://sonarr-dl-stack.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.io/authentik-icons/sonarr.svg"
}

module "authentik-app-radarr" {
  source = "../modules/authentik_app"

  name     = "Radarr"
  group    = "Personal"
  internal = ""
  external = "https://radarr-dl-stack.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.io/authentik-icons/radarr.svg"
}
