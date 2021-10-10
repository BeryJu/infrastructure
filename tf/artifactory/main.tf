terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.6.8"
    }
  }
}

data "vault_generic_secret" "artifactory_auth" {
  path = "kv/services/artifactory"
}

provider "artifactory" {
  url      = "https://registry.beryju.org/artifactory"
  username = data.vault_generic_secret.artifactory_auth.data["username"]
  password = data.vault_generic_secret.artifactory_auth.data["password"]
}

resource "artifactory_local_repository" "docker-authentik" {
  key          = "docker-authentik"
  package_type = "docker"
  property_sets = [
    "artifactory",
  ]
}

resource "artifactory_local_repository" "docker-priv" {
  key          = "docker-priv"
  package_type = "docker"
  property_sets = [
    "artifactory",
  ]
}

resource "artifactory_local_repository" "docker-public" {
  key          = "docker-public"
  package_type = "docker"
  property_sets = [
    "artifactory",
  ]
}

resource "artifactory_remote_repository" "docker-hub" {
  key             = "docker-hub"
  package_type    = "docker"
  url             = "https://registry-1.docker.io/"
  repo_layout_ref = "simple-default"
  property_sets = [
    "artifactory",
  ]
  lifecycle {
    ignore_changes = [username, password]
  }
}
