resource "authentik_provider_oauth2" "registry" {
  name               = "docker"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  client_id          = "693e60deada0b71e8ecb3d078e4ebaaf08624e55"
  token_validity     = "minutes=10"
  property_mappings = [
    authentik_scope_mapping.registry.id,
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id

  lifecycle {
    ignore_changes = [client_secret]
  }
}

resource "authentik_application" "registry" {
  name              = "Docker Registry"
  slug              = "docker-registry"
  protocol_provider = authentik_provider_oauth2.registry.id
}

resource "authentik_scope_mapping" "registry" {
  name       = "docker-registry"
  scope_name = "docker-registry"
  expression = file("${path.module}/source/scope-mapping-docker-registry.py")
}
