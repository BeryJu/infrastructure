resource "aws_route53_record" "k8s" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "k8s-prd._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
resource "aws_route53_record" "k8s-istio" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "k8s-prd-istio._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_istio_ip]
}
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
  records = ["beryjuorg.netlify.app"]
}

## Services

resource "aws_route53_record" "awx-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "awx.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "registry-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "registry.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "guac-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "guac.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "id-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "id.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "sentry" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "sentry.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "grafana" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "grafana.infra.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd-istio._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "vault" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "vault.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "analytics" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "analytics.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}

