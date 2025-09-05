resource "authentik_property_mapping_provider_scope" "k8s-email" {
  name       = "Kubernetes email"
  scope_name = "email"
  expression = <<EOF
return {
  "email": request.user.email,
  "email_verified": True,
}
EOF
}

module "authentik-k8s-oidc-home" {
  source = "../modules/authentik_k8s_oidc/"
  name   = "beryjuio-home"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  property_mappings = [authentik_property_mapping_provider_scope.k8s-email.id]
}

module "authentik-k8s-oidc-oci" {
  source = "../modules/authentik_k8s_oidc/"
  name   = "beryjuio-oci"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  property_mappings = [authentik_property_mapping_provider_scope.k8s-email.id]
}

