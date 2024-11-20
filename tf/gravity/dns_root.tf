resource "gravity_dns_zone" "root" {
  name          = "."
  authoritative = false
  default_ttl   = 86400
  handler_configs = jsonencode([
    {
      type = "memory",
    },
    {
      type = "etcd",
    },
    {
      cache_ttl = 3600
      to        = ["8.8.8.8:53"]
      type      = "forward_blocky"
      allowlists = [
        "s.youtube.com",
      ]
    },
    {
      to   = ["8.8.8.8:53"]
      type = "forward_ip"
    },
  ])
}
