terraform {
  required_providers {
    symbiosis = {
      source  = "symbiosis-cloud/symbiosis"
    }
    authentik = {
      source  = "goauthentik/authentik"
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

resource "symbiosis_cluster_service_account" "terraform" {
  cluster_name = symbiosis_cluster.cluster.name
}
