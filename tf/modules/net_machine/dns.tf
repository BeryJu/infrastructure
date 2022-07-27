locals {
  fqdn_parts   = split(".", var.fqdn)
  domain_parts = slice(local.fqdn_parts, 1, length(local.fqdn_parts))
  domain       = join(".", local.domain_parts)
  rev          = join(".", reverse(split(".", var.address)))
}

# data "aws_route53_zone" "forward" {
#   name         = local.domain
#   private_zone = true
# }

# data "aws_route53_zone" "reverse" {
#   name         = "120.10.in-addr.arpa"
#   private_zone = true
# }

# resource "aws_route53_record" "main" {
#   zone_id = data.aws_route53_zone.forward.zone_id
#   name    = var.fqdn
#   type    = "A"
#   ttl     = "300"
#   records = [var.address]
# }

# resource "aws_route53_record" "main-reverse" {
#   zone_id = data.aws_route53_zone.reverse.zone_id
#   name    = "${local.rev}.in-addr.arpa"
#   type    = "PTR"
#   ttl     = "300"
#   records = [var.fqdn]
# }

# resource "aws_route53_record" "additional" {
#   zone_id = data.aws_route53_zone.forward.zone_id
#   name    = each.value.fqdn
#   type    = "A"
#   ttl     = "300"
#   records = [each.value.address]

#   for_each = {
#     for index, entry in var.additional_hosts :
#     index => entry
#   }
# }

# resource "aws_route53_record" "additional-reverse" {
#   zone_id = data.aws_route53_zone.reverse.zone_id
#   name    = "${join(".", reverse(split(".", each.value.address)))}.in-addr.arpa"
#   type    = "PTR"
#   ttl     = "300"
#   records = [each.value.fqdn]

#   for_each = {
#     for index, entry in var.additional_hosts :
#     index => entry
#   }
# }
