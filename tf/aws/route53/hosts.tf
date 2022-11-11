resource "aws_route53_record" "host-de-nu1" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "de-nu1.prod.beryju.org"
  type    = "A"
  ttl     = "3600"
  records = [
    "202.61.244.145",
  ]
}

resource "aws_route53_record" "host-fi-hel1" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "fi-hel1.prod.beryju.org"
  type    = "A"
  ttl     = "3600"
  records = [
    "65.21.142.146",
  ]
}
