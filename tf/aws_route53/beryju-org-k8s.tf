resource "aws_route53_record" "k8s" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "k8s-prd._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
resource "aws_route53_record" "beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "beryju.org"
  type    = "A"
  ttl     = "300"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "www-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "www.beryju.org"
  type    = "A"
  ttl     = "300"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "blog-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "blog.beryju.org"
  type    = "A"
  ttl     = "300"
  alias {
    name                   = "adc._aliases.beryju.org"
    zone_id                = aws_route53_zone.beryju-org.zone_id
    evaluate_target_health = true
  }
}
