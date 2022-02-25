locals {
  pub_k8s_ip       = "194.56.224.176"
  pub_netlify_ip   = "75.2.60.5"
  pub_k8s_istio_ip = "194.56.224.182"
}

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
