resource "gravity_dns_zone" "lab" {
  name          = "lab.beryju.org."
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
