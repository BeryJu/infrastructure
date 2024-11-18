resource "gravity_dns_zone" "prod-io" {
  name          = "prod.beryju.io."
  default_ttl   = 3600
  authoritative = true
  handlers = [
    {
      type = "memory",
    },
    {
      type = "etcd",
    },
  ]
}

locals {
  prod_devices = {
    "nas1" : "10.120.20.30",
    "esxi1" : "10.120.20.32",
    "vcsa1" : "10.120.20.33",
    "optiplex-3090-bq1plp3" : "10.120.20.40",
    "hass1" : "10.120.20.60"
    "gravity-defr1" : "10.120.20.250",
    "sentry1" : "202.61.239.168"
  }
}

resource "gravity_dns_record" "prod-device" {
  zone     = gravity_dns_zone.prod-io.name
  hostname = each.key
  uid      = local.gravity_default_uid
  data     = each.value
  type     = "A"
  for_each = local.prod_devices
}

resource "gravity_dns_record" "prod-reverse-device" {
  zone     = gravity_dns_zone.main-int-rev.name
  hostname = "${split(".", each.value)[3]}.${split(".", each.value)[2]}"
  uid      = local.gravity_default_uid
  data     = "${each.key}.${gravity_dns_zone.prod-io.name}"
  type     = "PTR"
  for_each = local.prod_devices
}
