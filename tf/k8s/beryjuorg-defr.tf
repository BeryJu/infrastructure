module "vault-beryjuorg-defr" {
  source = "../modules/vault_k8s"
  path   = "k8s-defr"
  host   = "https://10.120.20.79:6443"
  ca     = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIICwjCCAaqgAwIBAgIBADANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDEwdrdWJl
    LWNhMB4XDTIwMTEwMTE1NDAzN1oXDTMwMTAzMDE1NDAzN1owEjEQMA4GA1UEAxMH
    a3ViZS1jYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJuDGpBWeDjX
    JsaCodDaSzbEpp3ODk7sBzGwyLHVdz2BjvlTzoMYsWZAcDpFKU+0JpquANMH2t3N
    9mf4R65lcjaMrV8Vfm72FQy8GQwQVoLYsEc4m4kmgxeA+AFNMg6edF14GJBWmx6D
    KQmUFNcCG/xMN/Whu34C8ByyovI/FGxChOTM2+ho7hRmVqlklbjoCALp6RPVMa+W
    wjOzoOEv47THB0w4QLk6fjxj1TPyeEyQruSMv/3TTDwrPIXXm2BUi+F7VaF80fi7
    311ak/jqtNiqM187lWWOLBZgN/oC73NIOGzWAkeWRmVxPgSO+5AsM4ZzZRUPE1wN
    nL4x5Hko59cCAwEAAaMjMCEwDgYDVR0PAQH/BAQDAgKkMA8GA1UdEwEB/wQFMAMB
    Af8wDQYJKoZIhvcNAQELBQADggEBAAs3o/FNPBQpsgdEU38aeVBsw0MQQksgH21X
    fBf9+pozCjMJnw6QCIms1pjC9p87QR1CW8VUYJv1IQ0ihWxqg09l9WWen+6eUwgv
    DvTWpdeeMgIVPROH/fMOC0n6jUZSGRJrIZwz1QocppxoVh5GxVBOUdTIr6Phkg4L
    34u6wLt9XkBWo6fOUHiOQ4LLX2CV+mdqztJv7LYZhPHPZj7Mk4drs4iHTtqgyuto
    smMrza4NhoYWIrdQwniMYpwMD3S4tl4efGXpmIMSvAdtAzprhSiYK03ykSSAJuzN
    2SbXEKELpQ05wRRXZtf+CuOcFTm4MyDZ8G09Xry7hoitsNt3vfg=
    -----END CERTIFICATE-----
    EOT
}
