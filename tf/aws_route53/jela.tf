resource "aws_route53_record" "jela-main" {
  zone_id = aws_route53_zone.jela-io.zone_id
  name    = "jela.io"
  type    = "A"
  ttl     = "300"
  records = ["75.2.60.5"]
}
resource "aws_route53_record" "jela-requests" {
  zone_id = aws_route53_zone.jela-io.zone_id
  name    = "requests.jela.io"
  type    = "A"
  ttl     = "300"
  records = [local.pub_k8s_ip]
}
resource "aws_route53_record" "jela-wks" {
  zone_id = aws_route53_zone.jela-io.zone_id
  name    = "wks.jela.io"
  type    = "A"
  ttl     = "300"
  records = ["194.56.224.179"]
}
resource "aws_route53_record" "jela-dj" {
  zone_id = aws_route53_zone.jela-io.zone_id
  name    = "dj.jela.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["jelaio.netlify.app."]
}
