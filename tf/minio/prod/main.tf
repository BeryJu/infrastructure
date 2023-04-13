terraform {
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "1.14.0"
    }
  }
}

data "vault_generic_secret" "minio" {
  path = "kv/services/minio/main"
}

provider "minio" {
  minio_server   = "s3.beryju.org"
  minio_user     = data.vault_generic_secret.minio.data["username"]
  minio_password = data.vault_generic_secret.minio.data["password"]
  minio_ssl      = true
}
