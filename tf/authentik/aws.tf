# Create an application with a provider attached and policies applied

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

resource "authentik_provider_saml" "aws" {
  name                            = "aws"
  authorization_flow              = data.authentik_flow.default-authorization-flow.id
  acs_url                         = "https://signin.aws.amazon.com/saml"
  assertion_valid_not_before      = "minutes=-5"
  assertion_valid_not_on_or_after = "minutes=5"
  audience                        = "urn:amazon:webservices"
  digest_algorithm                = "http://www.w3.org/2001/04/xmlenc#sha256"
  issuer                          = "authentik"
  # TODO: Use data source to get IDs
  property_mappings = [
    "222d3112-3b95-443a-a92a-8a4a74749611",
    "7b253c9b-52b2-4aac-b5f6-f797f64ea358",
    "04e7f3c5-d60c-4888-875c-f7ced7323b62",
    "81e16d58-ce7a-4215-803f-6690ae4f87ab",
    "529f7dac-2bf4-4a13-860c-f4d0f89c0547",
    "45dd56df-aa15-4875-bb24-1e6ea1eb94a7",
    "e1e479cf-9929-4bf9-97e5-9d35df2188a9",
    "fefb12f5-8e3d-45b8-a0e4-e42b095fc376",
  ]
  session_valid_not_on_or_after = "minutes=86400"
  signature_algorithm           = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"
  signing_kp = data.authentik_certificate_key_pair.generated.id
  sp_binding = "post"
}

resource "authentik_application" "aws" {
  name              = "Amazon Web Services"
  slug              = "amazon-web-services"
  protocol_provider = authentik_provider_saml.aws.id
  meta_icon         = "https://public.s3.beryju.org/authentik-icons/aws.png"
  meta_publisher     = "Amazon Web Services, Inc."
  policy_engine_mode = "all"
}

resource "authentik_policy_binding" "aws-access" {
  target = authentik_application.aws.uuid
  group  = data.authentik_group.acl_beryjuorg.id
  order  = 0
}
