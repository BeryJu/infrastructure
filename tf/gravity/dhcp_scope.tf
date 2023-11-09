resource "gravity_dhcp_scope" "de-fr-default" {
  name        = "de-fr-default"
  subnet_cidr = "10.120.20.0/24"
  lease_ttl   = 604800

  ipam = {
    type        = "internal"
    range_start = "10.120.20.50"
    range_end   = "10.120.20.150"
  }

  option {
    tag_name = "router"
    value    = "10.120.20.1"
  }

  dns {
    zone = gravity_dns_zone.lab.id
  }
}
