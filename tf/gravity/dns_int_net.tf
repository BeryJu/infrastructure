resource "gravity_dns_zone" "net" {
  name          = "net.beryju.org."
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
