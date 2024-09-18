resource "aws_route53_record" "registry-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "registry.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "proxy-registry-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "proxy.registry.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "id-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "id.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "vault-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "vault.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "infra-s3-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "s3.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "infra-s3-wildcard-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.s3.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "infra-s3-backup-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "backup-s3.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "infra-s3-backup-wildcard-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.backup-s3.beryju.io"
  type    = "A"
  alias {
    name                   = "\\052.beryjuio-prod.k8s.beryju.io"
    zone_id                = aws_route53_zone.beryju-io.zone_id
    evaluate_target_health = true
  }
}
