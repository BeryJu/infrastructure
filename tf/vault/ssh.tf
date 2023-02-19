resource "vault_mount" "ssh-client-signer" {
  type = "ssh"
  path = "ssh-client-signer"
}

resource "vault_ssh_secret_backend_role" "jens" {
  name                    = "jens"
  backend                 = vault_mount.ssh-client-signer.path
  key_type                = "ca"
  algorithm_signer        = "rsa-sha2-256"
  allow_user_certificates = true
  allowed_users           = "*"
  allowed_extensions      = "permit-pty,permit-port-forwarding"
  default_extensions = {
    "permit-pty" : ""
  }
  default_user = "jens"
  ttl          = "30m0s"
}
