module "vault-beryjuorg-offsite" {
  source = "../modules/vault_k8s"
  path   = "k8s-offsite"
  host   = "https://de-nu1.prod.beryju.org:6443"
  ca     = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIBdjCCAR2gAwIBAgIBADAKBggqhkjOPQQDAjAjMSEwHwYDVQQDDBhrM3Mtc2Vy
    dmVyLWNhQDE2MzAzMDk1MjAwHhcNMjEwODMwMDc0NTIwWhcNMzEwODI4MDc0NTIw
    WjAjMSEwHwYDVQQDDBhrM3Mtc2VydmVyLWNhQDE2MzAzMDk1MjAwWTATBgcqhkjO
    PQIBBggqhkjOPQMBBwNCAASILwTD4YhsBU8CETmRqPdfTNZ5LvlyvnqGQ7QrNg7n
    0xdKUqJ0mH4qesUWTAodF20W37Rva5nEsz7und5tRiqAo0IwQDAOBgNVHQ8BAf8E
    BAMCAqQwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUgP/7pU4aPvAIAKHXCXP5
    zsIpPVcwCgYIKoZIzj0EAwIDRwAwRAIgRIJEwbfkmEokKm/Y0nLvCzR5cBDiLZ0o
    06RxZHMaIpMCIAsGZIhCz/7uaUCBOFqSZJHNmRydIklaFvYKUVgPuSJV
    -----END CERTIFICATE-----
    EOT
}
