resource "gravity_dns_zone" "root" {
  name          = "."
  authoritative = false
  handlers = [
    {
      "type" = "memory",
    },
    {
      "type" = "etcd",
    },
    {
      "cache_ttl" = "3600"
      "to"        = "8.8.8.8:53"
      "type"      = "forward_blocky"
    },
    {
      "to"   = "8.8.8.8:53"
      "type" = "forward_ip"
    },
  ]
}
