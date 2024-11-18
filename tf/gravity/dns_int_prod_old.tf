resource "gravity_dns_zone" "prod" {
  name          = "prod.beryju.org."
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
