resource "aws_route53_record" "adc" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "adc._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_adc_ip]
}

resource "aws_route53_record" "oxidized" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "oxidized.infra.beryju.org"
  type    = "A"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
