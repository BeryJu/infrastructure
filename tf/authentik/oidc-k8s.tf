module "authentik-k8s-oidc-oci" {
  source = "../modules/authentik_k8s_oidc/"
  name   = "beryjuio-oci"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
