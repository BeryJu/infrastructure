data "authentik_certificate_key_pair" "gitlab" {
  name = "gitlab"
}

resource "authentik_provider_oauth2" "registry" {
  name               = "docker"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  client_id          = "693e60deada0b71e8ecb3d078e4ebaaf08624e55"
  token_validity     = "minutes=10"
  property_mappings = [
    authentik_scope_mapping.registry.id,
  ]
  verification_keys = [
    data.authentik_certificate_key_pair.gitlab.id
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id
}

resource "authentik_application" "registry" {
  name              = "Docker Registry"
  slug              = "docker-registry"
  protocol_provider = authentik_provider_oauth2.registry.id
}

resource "authentik_scope_mapping" "registry" {
  name       = "docker-registry"
  scope_name = "docker-registry"
  expression = <<EOF
scopes = request.http_request.POST.get("scope", "").split()
access = []
for scope in scopes:
    if scope.count(":") < 2:
        continue
    type, name, actions = scope.split(":")
    if not ak_is_group_member(user, name="_acl_ak_docker_push"):
        actions = "pull"
    access.append({
        "type": type,
        "name": name,
        "actions": actions.split(","),
    })
return {
    "access": access,
}
EOF
}
