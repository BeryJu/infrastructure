resource "gravity_dns_zone" "lab-io" {
  name          = "lab.beryju.io."
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
