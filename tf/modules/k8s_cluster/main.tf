terraform {
  required_providers {
    symbiosis = {
      source  = "symbiosis-cloud/symbiosis"
    }
  }
}

provider "kubernetes" {
  host                   = "https://${symbiosis_cluster.cluster.endpoint}"
  client_certificate     = symbiosis_cluster.cluster.certificate
  client_key             = symbiosis_cluster.cluster.private_key
  cluster_ca_certificate = symbiosis_cluster.cluster.ca_certificate
}

resource "symbiosis_cluster" "cluster" {
  name   = var.name
  region = "germany-1"
}
