locals {
  pub_netlify_ip   = "75.2.60.5"
  pub_k8s_prd      = "65.21.142.146"
  pub_k8s_offsite  = "202.61.244.145"
  pub_k8s_istio_ip = "194.56.224.182"
}

resource "aws_route53_record" "k8s-prd" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "k8s-prd._aliases.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_prd]
}
