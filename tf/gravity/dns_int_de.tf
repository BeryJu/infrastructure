resource "gravity_dns_zone" "lab-io" {
  name          = "de.beryju.io."
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
