resource "gravity_dns_zone" "k8s-home" {
  name          = "beryjuio-home.k8s.beryju.org."
  default_ttl   = 3600
  authoritative = true
  handlers = jsonencode([
    {
      type = "etcd",
    },
    {
      "cache_ttl" = -2
      "to"        = ["8.8.8.8:53"]
      "type"      = "forward_ip"
    },
  ])
}
