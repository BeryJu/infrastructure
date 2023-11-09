resource "gravity_dns_zone" "k8s-home" {
  name          = "beryjuio-home.k8s.beryju.org."
  authoritative = true
  handlers = [
    {
      type = "etcd",
    },
    {
      "cache_ttl" = "-2"
      "to"        = "8.8.8.8:53"
      "type"      = "forward_ip"
    },
  ]
}
