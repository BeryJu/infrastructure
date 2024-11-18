resource "gravity_dns_zone" "net" {
  name          = "net.beryju.org."
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
