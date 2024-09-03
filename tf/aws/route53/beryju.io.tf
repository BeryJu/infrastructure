resource "aws_route53_record" "beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    local.pub_netlify_ip,
  ]
}

resource "aws_route53_record" "charts-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "charts.beryju.io"
  type    = "CNAME"
  ttl     = "3600"
  records = ["chartsberyjuio.netlify.app"]
}

resource "aws_route53_record" "www-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "www.beryju.io"
  type    = "CNAME"
  ttl     = "3600"
  records = ["beryjuio.netlify.app"]
}

resource "aws_route53_record" "sentry-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "sentry.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "analytics-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "analytics.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "hass-ext-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "hass-ext.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}
