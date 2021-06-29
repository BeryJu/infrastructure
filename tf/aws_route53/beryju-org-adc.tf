resource "aws_route53_record" "adc" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "adc._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_adc_ip]
}

resource "aws_route53_record" "grafana" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "grafana.beryju.org"
  type    = "A"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "monitoring" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "monitoring.beryju.org"
  type    = "A"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "sentry" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "sentry.beryju.org"
  type    = "A"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "vault" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "vault.beryju.org"
  type    = "A"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
