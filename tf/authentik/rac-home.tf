resource "authentik_provider_rac" "rac-home" {
  name               = "rac"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  connection_expiry  = "hours=8"
  property_mappings = [
    "9ac01a5a-4067-41a9-9dab-4e0f4917b3ce",
    "468dbfc9-d49b-4116-bdcb-32b0fa8a1225",
  ]
}
