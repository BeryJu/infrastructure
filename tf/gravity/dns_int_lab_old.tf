resource "gravity_dns_zone" "lab" {
  name          = "lab.beryju.org."
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
