resource "gravity_dns_zone" "lab" {
  name          = "lab.beryju.org."
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
