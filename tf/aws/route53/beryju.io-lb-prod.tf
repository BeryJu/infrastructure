resource "aws_route53_record" "k8s-beryjuio-prod-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.beryjuio-prod.k8s.beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    "139.144.162.151",
  ]
}

resource "aws_route53_record" "k8s-beryjuio-prod-beryju-io-aaaa" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.beryjuio-prod.k8s.beryju.io"
  type    = "AAAA"
  ttl     = "3600"
  records = [
    "2a01:7e01:1::8b90:a297",
  ]
}
