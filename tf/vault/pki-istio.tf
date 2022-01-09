resource "vault_mount" "pki-istio" {
  path        = "pki-istio"
  type        = "pki"
  description = "istio PKI"

  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 315360000
}

resource "vault_pki_secret_backend_config_urls" "pki-istio-urls" {
  backend                 = vault_mount.pki-istio.path
  issuing_certificates    = ["https://vault.beryju.org/v1/pki-istio/ca"]
  crl_distribution_points = ["https://vault.beryju.org/v1/pki-istio/crl"]
}

resource "vault_pki_secret_backend_role" "pki-istio-role" {
  backend           = vault_mount.pki-istio.path
  name              = "beryjuorg-istio"
  ttl               = 90 * 24 * 60 * 60
  allow_ip_sans     = true
  key_type          = "rsa"
  key_bits          = 4096
  allow_any_name    = true
  enforce_hostnames = false
  require_cn        = false
  allowed_uri_sans  = ["spiffe://*"]
  allowed_domains   = ["istio-ca"]
}
