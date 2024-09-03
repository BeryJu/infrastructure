resource "aws_route53_record" "k8s-beryjuio-home-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.beryjuio-home.k8s.beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    "10.120.21.1",
  ]
}
