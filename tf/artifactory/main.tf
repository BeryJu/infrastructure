terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.11.0"
    }
  }
}

provider "artifactory" {
  url           = "https://registry.beryju.org/artifactory"
  access_token  = "x"
  check_license = false
}
