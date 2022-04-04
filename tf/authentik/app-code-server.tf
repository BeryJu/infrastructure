module "authentik-app-code-server" {
  source = "../modules/authentik_app"

  name     = "Code Server"
  group    = "Infrastructure"
  internal = "http://workstation-code.workstation:8000"
  external = "https://wks-code.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
