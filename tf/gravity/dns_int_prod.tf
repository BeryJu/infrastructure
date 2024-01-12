resource "gravity_dns_zone" "prod" {
  name          = "prod.beryju.org."
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
