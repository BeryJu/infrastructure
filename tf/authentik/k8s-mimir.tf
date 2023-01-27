module "authentik-app-mimir" {
  source = "../modules/authentik_app"

  name     = "Mimir"
  group    = "Monitoring"
  internal = "http://mimir.mimir"
  external = "https://mimir.beryjuorg-prd.k8s.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/prometheus-icon-color.png"
}
