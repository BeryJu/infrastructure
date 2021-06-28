resource "aws_route53_record" "beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
resource "aws_route53_record" "www-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "www.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
resource "aws_route53_record" "blog-beryju-org" {
  zone_id = aws_route53_zone.beryju-org.zone_id
  name    = "blog.beryju.org"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
