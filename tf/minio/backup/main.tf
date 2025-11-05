terraform {
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "3.11.3"
    }
  }
}

data "vault_generic_secret" "minio" {
  path = "kv/services/minio/offsite"
}

provider "minio" {
  minio_server   = "backup-s3.beryju.io"
  minio_user     = data.vault_generic_secret.minio.data["username"]
  minio_password = data.vault_generic_secret.minio.data["password"]
  minio_ssl      = true
}
