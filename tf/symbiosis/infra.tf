provider "kubernetes" {
  alias = "beryjuio-infra"

  host                   = "https://${symbiosis_cluster.infra.endpoint}"
  client_certificate     = symbiosis_cluster.infra.certificate
  client_key             = symbiosis_cluster.infra.private_key
  cluster_ca_certificate = symbiosis_cluster.infra.ca_certificate
}

resource "symbiosis_cluster" "infra" {
  name   = "beryjuio-infra"
  region = "germany-1"
}

data "kubernetes_secret_v1" "infra-vault-secret" {
  provider = kubernetes.beryjuio-infra
  metadata {
    name      = "vault-secrets-operator"
    namespace = "vault-secrets-operator"
  }
}

module "vault-infra" {
  source = "../modules/vault_k8s"
  path   = "k8s-${symbiosis_cluster.infra.name}"
  host   = "https://${symbiosis_cluster.infra.endpoint}"
  ca     = symbiosis_cluster.infra.ca_certificate
  jwt    = data.kubernetes_secret_v1.infra-vault-secret.data["token"]
}

resource "symbiosis_node_pool" "infra-default" {
  cluster   = symbiosis_cluster.infra.name
  name      = "default"
  node_type = "general-1"
  quantity  = 2
}
