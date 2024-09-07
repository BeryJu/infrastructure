module "authentik-app-alertmanager" {
  source = "../modules/authentik_app"

  name     = "Alertmanager"
  group    = "Monitoring"
  internal = ""
  external = "https://alertmanager.lab.beryju.io"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.io/authentik-icons/alertmanager.png"
}
