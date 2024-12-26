resource "authentik_provider_oauth2" "registry" {
  name                  = "docker"
  authorization_flow    = data.authentik_flow.default-authorization-flow.id
  invalidation_flow     = data.authentik_flow.default-provider-invalidation-flow.id
  client_id             = "693e60deada0b71e8ecb3d078e4ebaaf08624e55"
  access_token_validity = "minutes=10"
  sub_mode              = "user_username"
  property_mappings = [
    authentik_property_mapping_provider_scope.registry.id,
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id
  jwt_federation_sources = [
    authentik_source_oauth.int-gitlab.uuid,
    authentik_source_oauth.int-github.uuid,
  ]
  lifecycle {
    ignore_changes = [client_secret]
  }
}

resource "authentik_application" "registry" {
  name              = "Docker Registry"
  slug              = "docker-registry"
  group             = "Infrastructure"
  protocol_provider = authentik_provider_oauth2.registry.id
}

resource "authentik_property_mapping_provider_scope" "registry" {
  name       = "docker-registry"
  scope_name = "docker-registry"
  expression = file("${path.module}/source/scope-mapping-docker-registry.py")
}
