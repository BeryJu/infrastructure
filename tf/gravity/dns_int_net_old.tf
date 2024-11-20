resource "gravity_dns_zone" "net" {
  name          = "net.beryju.org."
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
