resource "authentik_provider_rac" "rac-home" {
  name               = "rac"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  connection_expiry  = "hours=8"
}
