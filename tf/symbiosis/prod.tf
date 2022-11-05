provider "kubernetes" {
  alias = "beryjuio-prod"

  host                   = "https://${symbiosis_cluster.prod.endpoint}"
  client_certificate     = symbiosis_cluster.prod.certificate
  client_key             = symbiosis_cluster.prod.private_key
  cluster_ca_certificate = symbiosis_cluster.prod.ca_certificate
}

resource "symbiosis_cluster" "prod" {
  name   = "beryjuio-prod"
  region = "germany-1"
}

data "kubernetes_secret_v1" "prod-vault-secret" {
  provider = kubernetes.beryjuio-prod
  metadata {
    name      = "vault-secrets-operator"
    namespace = "vault-secrets-operator"
  }
}

module "vault-prod" {
  source = "../modules/vault_k8s"
  path   = "k8s-${symbiosis_cluster.prod.name}"
  host   = "https://${symbiosis_cluster.prod.endpoint}"
  ca     = symbiosis_cluster.prod.ca_certificate
  jwt    = data.kubernetes_secret_v1.prod-vault-secret.data["token"]
}

resource "symbiosis_node_pool" "prod-default" {
  cluster   = symbiosis_cluster.prod.name
  name      = "default"
  node_type = "general-2"
  quantity  = 2
}
