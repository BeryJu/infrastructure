resource "gravity_dns_zone" "main-int-rev" {
  name          = "120.10.in-addr.arpa."
  default_ttl   = 3600
  authoritative = true
  handler_configs = jsonencode([
    {
      type = "memory",
    },
    {
      type = "etcd",
    },
  ])
}
