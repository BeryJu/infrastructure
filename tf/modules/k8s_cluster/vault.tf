resource "kubernetes_namespace" "vault-secrets-operator" {
  metadata {
    name = "vault-secrets-operator"
  }
  depends_on = [
    symbiosis_cluster.cluster,
  ]
}

resource "kubernetes_service_account" "vault-secrets-operator" {
  metadata {
    name      = "vault-secrets-operator"
    namespace = kubernetes_namespace.vault-secrets-operator.metadata.0.name
  }
  depends_on = [
    symbiosis_cluster.cluster,
  ]
}

resource "kubernetes_secret" "vault-secrets-operator" {
  metadata {
    name      = kubernetes_service_account.vault-secrets-operator.metadata.0.name
    namespace = kubernetes_namespace.vault-secrets-operator.metadata.0.name
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.vault-secrets-operator.metadata.0.name
    }
  }
  depends_on = [
    symbiosis_cluster.cluster,
  ]
}

module "vault" {
  source = "../vault_k8s"
  path   = "k8s-${symbiosis_cluster.cluster.name}"
  host   = "https://${symbiosis_cluster.cluster.endpoint}"
  ca     = symbiosis_cluster.cluster.ca_certificate
  jwt    = kubernetes_secret.vault-secrets-operator.data["token"]
  depends_on = [
    symbiosis_cluster.cluster,
  ]
}
