resource "authentik_provider_saml" "sentry" {
  name                            = "sentry"
  authorization_flow              = data.authentik_flow.default-authorization-flow.id
  acs_url                         = "https://sentry.beryju.org/saml/acs/beryjuio/"
  audience                        = "https://sentry.beryju.org/saml/metadata/beryjuio/"
  assertion_valid_not_before      = "minutes=-5"
  assertion_valid_not_on_or_after = "minutes=5"
  digest_algorithm                = "http://www.w3.org/2001/04/xmlenc#sha256"
  signature_algorithm             = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"
  issuer                          = "authentik"
  property_mappings               = data.authentik_property_mapping_provider_saml.defaults.ids
  session_valid_not_on_or_after   = "minutes=86400"
  signing_kp                      = data.authentik_certificate_key_pair.generated.id
  sp_binding                      = "post"
}

resource "authentik_application" "sentry" {
  name                  = "Sentry"
  slug                  = "sentry"
  protocol_provider     = authentik_provider_saml.sentry.id
  meta_icon             = "https://public.s3.beryju.io/authentik-icons/sentry.png"
  meta_launch_url       = "https://sentry.beryju.org"
  meta_publisher        = "Sentry"
  policy_engine_mode    = "any"
  group                 = "Infrastructure"
  backchannel_providers = [104]
}

resource "authentik_policy_binding" "sentry" {
  target = authentik_application.sentry.uuid
  group  = data.authentik_group.acl_beryjuorg.id
  order  = 0
}

data "authentik_group" "ak_acl_sentry" {
  name = "ak_acl_sentry"
}

resource "authentik_policy_binding" "ak_acl_sentry" {
  target = authentik_application.sentry.uuid
  group  = data.authentik_group.ak_acl_sentry.id
  order  = 1
}
