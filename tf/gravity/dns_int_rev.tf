resource "gravity_dns_zone" "main-int-rev" {
  name          = "120.10.in-addr.arpa."
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
