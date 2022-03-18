module "authentik-app-stack-storm" {
  source = "../modules/authentik_app"

  name     = "Stackstorm"
  internal = "http://dev1.lab.beryju.org"
  external = "https://stackstorm.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  skip_path_regex = "/api/v1/webhooks.*"
}
