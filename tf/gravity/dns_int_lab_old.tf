resource "gravity_dns_zone" "lab" {
  name          = "lab.beryju.org."
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
