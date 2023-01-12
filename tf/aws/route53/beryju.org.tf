resource "aws_route53_record" "beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "beryju.org"
  type    = "A"
  ttl     = "3600"
  records = [
    local.pub_netlify_ip,
  ]
}

resource "aws_route53_record" "blog-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "blog.beryju.org"
  type    = "CNAME"
  ttl     = "3600"
  records = ["beryjuio.netlify.app"]
}

resource "aws_route53_record" "www-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "www.beryju.org"
  type    = "CNAME"
  ttl     = "3600"
  records = ["beryjuio.netlify.app"]
}

resource "aws_route53_record" "charts-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "charts.beryju.org"
  type    = "CNAME"
  ttl     = "3600"
  records = ["chartsberyjuio.netlify.app"]
}

resource "aws_route53_record" "guac-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "guac.beryju.org"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "sentry" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "sentry.beryju.org"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "analytics" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "analytics.beryju.org"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "hass-ext" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "hass-ext.beryju.org"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
