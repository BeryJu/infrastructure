resource "aws_route53_record" "k8s-beryjuio-oci-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "*.beryjuio-oci.k8s.beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    "130.61.116.187",
  ]
}

resource "aws_route53_record" "kube-api-k8s-beryjuio-oci-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "kube-api.beryjuio-oci.k8s.beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    "130.61.116.187",
  ]
}
