provider "kubernetes" {
  host = "https://${symbiosis_cluster.infra.endpoint}"

  client_certificate     = symbiosis_cluster.example.certificate
  client_key             = symbiosis_cluster.example.private_key
  cluster_ca_certificate = symbiosis_cluster.example.ca_certificate
  alias                  = "beryjuio-infra"
}

resource "symbiosis_cluster" "infra" {
  name   = "beryjuio-infra"
  region = "germany-1"
}

resource "symbiosis_node_pool" "default" {
  cluster   = symbiosis_cluster.infra.name
  name      = "default"
  node_type = "general-1"
  quantity  = 2
}
