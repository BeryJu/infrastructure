terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.42.0"
    }
  }
}

locals {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaads4pw2zlbvx66xce5j3qahc3zojfgwcc57xaygzuuo2qrudmmhnq"
}

data "vault_generic_secret" "oci" {
  path = "kv/oci/terraform"
}

provider "oci" {
  user_ocid    = "ocid1.user.oc1..aaaaaaaaii353zunddovmn6mwp4vy26d3p5zegzsudix3t26spi5cs4swepq"
  fingerprint  = "b8:cb:b7:17:e3:46:a6:5b:ba:4d:72:ea:07:a3:41:97"
  tenancy_ocid = local.compartment_id
  region       = "eu-frankfurt-1"
  private_key  = data.vault_generic_secret.oci.data["key"]
}
