resource "gravity_dns_zone" "net" {
  name          = "net.beryju.org."
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
