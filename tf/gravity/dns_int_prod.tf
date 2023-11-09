resource "gravity_dns_zone" "prod" {
  name          = "prod.beryju.org."
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
