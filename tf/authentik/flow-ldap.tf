resource "authentik_stage_password" "ldap-flow-password" {
  name     = "ldap-flow-password"
  backends = ["authentik.core.auth.InbuiltBackend", "authentik.core.auth.TokenBackend"]
}

resource "authentik_stage_identification" "ldap-flow-identification" {
  name           = "ldap-flow-identification"
  user_fields    = ["username"]
  sources        = []
  password_stage = authentik_stage_password.ldap-flow-password.id
}

resource "authentik_stage_user_login" "ldap-flow-login" {
  name = "ldap-flow-login"
}

resource "authentik_flow" "ldap-flow" {
  name        = "LDAP"
  title       = "LDAP"
  slug        = "ldap-flow"
  designation = "authentication"
  background  = "/static/dist/assets/images/flow_background.jpg"
}

resource "authentik_flow_stage_binding" "ldap-identification-binding" {
  target = authentik_flow.ldap-flow.uuid
  stage  = authentik_stage_identification.ldap-flow-identification.id
  order  = 10
}

resource "authentik_flow_stage_binding" "ldap-login-bind" {
  target = authentik_flow.ldap-flow.uuid
  stage  = authentik_stage_user_login.ldap-flow-login.id
  order  = 20
}
