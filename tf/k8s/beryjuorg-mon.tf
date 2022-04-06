module "vault-beryjuorg-mon" {
  source = "../modules/vault_k8s"
  path   = "k8s-mon"
  host   = "https://mon1.prod.beryju.org:6443"
  ca     = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIBeDCCAR2gAwIBAgIBADAKBggqhkjOPQQDAjAjMSEwHwYDVQQDDBhrM3Mtc2Vy
    dmVyLWNhQDE2NDIzNTE5NzcwHhcNMjIwMTE2MTY1MjU3WhcNMzIwMTE0MTY1MjU3
    WjAjMSEwHwYDVQQDDBhrM3Mtc2VydmVyLWNhQDE2NDIzNTE5NzcwWTATBgcqhkjO
    PQIBBggqhkjOPQMBBwNCAAS1PwEDss+mU0CIJeH4uqCQ/fasactx9sHieN+tmI7+
    ihEfZZlF6Nez7xFWYms1UnXSGklDNpcmeW73JRY7qcHxo0IwQDAOBgNVHQ8BAf8E
    BAMCAqQwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUDr7e/nnuUYeqd8T+GgGZ
    M/W4niwwCgYIKoZIzj0EAwIDSQAwRgIhAJeOqJWsR4TDnWYVsAc4MgBWKTkbxCPv
    CRBbLBBk/h7XAiEA4CpO7vaWlUnHzZ1Jyf81GNEj88iHcedHiqFapaVPC4A=
    -----END CERTIFICATE-----
    EOT
}
