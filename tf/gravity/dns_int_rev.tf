resource "gravity_dns_zone" "main-int-rev" {
  name          = "120.10.in-addr.arpa."
  default_ttl   = 3600
  authoritative = true
  handlers = jsonencode([
    {
      type = "memory",
    },
    {
      type = "etcd",
    },
  ])
}
