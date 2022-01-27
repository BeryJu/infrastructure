resource "vault_mount" "pki-machine" {
  path        = "pki-machine"
  type        = "pki"
  description = "Machine PKI"

  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}

resource "vault_pki_secret_backend_config_urls" "pki-machine-urls" {
  backend                 = vault_mount.pki-machine.path
  issuing_certificates    = ["https://vault.beryju.org/v1/pki-machine/ca"]
  crl_distribution_points = ["https://vault.beryju.org/v1/pki-machine/crl"]
}

resource "vault_pki_secret_backend_role" "pki-machine-role" {
  backend          = vault_mount.pki-machine.path
  name             = "beryjuorg-machine"
  ttl              = 90 * 24 * 60 * 60
  allow_ip_sans    = true
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["beryju.org"]
  allow_subdomains = true
  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
  ]
}
