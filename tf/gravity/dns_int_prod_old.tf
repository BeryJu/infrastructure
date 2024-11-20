resource "gravity_dns_zone" "prod" {
  name          = "prod.beryju.org."
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
