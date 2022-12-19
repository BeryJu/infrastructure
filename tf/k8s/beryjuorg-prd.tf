module "vault-beryjuorg-prd" {
  source  = "../modules/vault_k8s_jwt"
  path    = "k8s-beryjuorg-prd"
  iss     = "https://kubernetes.default.svc.cluster.local"
  aud     = "https://kubernetes.default.svc.cluster.local"
  jwt_pub = <<-EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA21i9Hl0QgSmW5U6W67Er
F6r6cMvIX3PZYLwPgQDlkPN7dLwTs2R4YmNaUYiAJ8crezaDIqWL3AaZtcfbjol8
oOVMVxk5ST0DMabL9lUNyIYYKvAklvmLUs7+6THz3qTDTcphLj9f3p63QM7P0P5P
ZJZPh44B9NXw4OQEUCUFmzbuZaCvQtLYZ398QDnvIzg32qQQh/gj8GeOoX9ZzHo9
C5lM43uHbSIZbXHzM3BXGfxWd9oYFK2gs9OhOJIKXlsSlN4SMs/POd+OzSjhhJpq
okMCD+AZoUXEIWFw/SAPVYeZ3hNSS47bbOMWV4t61Vp2LMdVMU7aYagIPEoIDlTu
1wIDAQAB
-----END PUBLIC KEY-----
  EOT
}
