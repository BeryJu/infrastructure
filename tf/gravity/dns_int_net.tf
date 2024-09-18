resource "gravity_dns_zone" "net-io" {
  name          = "net.beryju.io."
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
  network_devices = {
    "ap-kitchen" : "10.120.20.150",
    "ap-living-room" : "10.120.20.151",
    "freiburg1" : "10.120.20.1",
    "switch-bed" : "10.120.20.108",
    "switch-kitchen" : "10.120.20.109",
    "switch-tv" : "10.120.20.107",
  }
}

resource "gravity_dns_record" "network-device" {
  zone     = gravity_dns_zone.net-io.name
  hostname = each.key
  uid      = local.gravity_default_uid
  data     = each.value
  type     = "A"
  for_each = local.network_devices
}

resource "gravity_dns_record" "network-reverse-device" {
  zone     = gravity_dns_zone.main-int-rev.name
  hostname = "${split(".", each.value)[3]}.${split(".", each.value)[2]}"
  uid      = local.gravity_default_uid
  data     = "${each.key}.${gravity_dns_zone.net-io.name}"
  type     = "PTR"
  for_each = local.network_devices
}
