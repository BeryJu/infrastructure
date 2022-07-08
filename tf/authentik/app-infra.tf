module "authentik-app-oxidized" {
  source = "../modules/authentik_app"

  name     = "oxidized"
  group    = "Infrastructure"
  internal = ""
  external = "https://oxidized.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-unifi" {
  source = "../modules/authentik_app"

  name                         = "UniFi"
  group                        = "Infrastructure"
  internal                     = "https://unifi1.prod.beryju.org:8443"
  external                     = "https://unifi.infra.beryju.org"
  internal_host_ssl_validation = false
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

module "authentik-app-maas" {
  source = "../modules/authentik_app"

  name     = "MAAS"
  group    = "Infrastructure"
  internal = "http://maas-uk1.prod.beryju.org:5240"
  external = "https://maas.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}

data "authentik_group" "acl_netbox" {
  name = "acl_netbox"
}

module "authentik-app-netbox" {
  source = "../modules/authentik_app"

  name     = "NetBox"
  group    = "Infrastructure"
  internal = "http://netbox1.prod.beryju.org"
  external = "https://netbox.infra.beryju.org"
  icon_url = "https://public.s3.beryju.org/authentik-icons/netbox.svg"
  access_group = [
    data.authentik_group.acl_netbox.id
  ]
  skip_path_regex = "/api.*"
}

data "authentik_group" "acl_netapp_admin" {
  name = "acl_netapp_admin"
}

module "authentik-app-netapp-aiq" {
  source = "../modules/authentik_app"

  name     = "Netapp ActiveIQ Unified Manager"
  group    = "Infrastructure"
  internal = "https://nappaiq1.prod.beryju.org"
  external = "https://netapp-aiq.infra.beryju.org"
  icon_url = "https://public.s3.beryju.org/authentik-icons/netapp.png"
  access_group = [
    data.authentik_group.acl_netapp_admin.id
  ]
}
