resource "aws_ses_domain_identity" "domain" {
  domain = var.domain
}

data "aws_route53_zone" "zone" {
  name = var.domain
}

resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "_amazonses.${aws_ses_domain_identity.domain.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.domain.verification_token]
}

resource "aws_ses_domain_identity_verification" "verification" {
  domain = aws_ses_domain_identity.domain.id

  depends_on = [aws_route53_record.amazonses_verification_record]
}
