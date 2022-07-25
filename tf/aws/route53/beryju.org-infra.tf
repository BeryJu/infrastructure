resource "aws_route53_record" "registry-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "registry.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd-istio._aliases.beryju.org."
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "proxy-registry-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "proxy.registry.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd-istio._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "id-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "id.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-prd-istio._aliases.beryju.org."
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "vault" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "vault.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-offsite._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "infra-infrahq" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "infrahq.infra.beryju.org"
  type    = "A"
  alias {
    name                   = "k8s-offsite._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
