module "authentik-app-home-assistant" {
  source = "../modules/authentik_app"

  name     = "Home Assistant"
  internal = "http://hass1.prod.beryju.org:8123"
  external = "https://hass-ext.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url        = "https://public.s3.beryju.org/authentik-icons/home-assistant.svg"
  skip_path_regex = "/api*"
}
