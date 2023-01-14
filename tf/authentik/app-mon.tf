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
