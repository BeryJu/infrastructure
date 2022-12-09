module "vault-beryjuio-home" {
  source  = "../modules/vault_k8s_jwt"
  path    = "k8s-beryjuio-home"
  iss     = "https://kubernetes.default.svc.cluster.local"
  aud     = "https://kubernetes.default.svc.cluster.local"
  jwt_pub = <<-EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0x1KfLCN8AZnV+VmRpM+
VxWSvCo0ON9vNM1+pZ5V92mjS2Kmv214tn/yGEXf/uHTeXp6QC7weo2qOuzgBphF
t49hSlb4XN81SwfkzxbjYlFL7cWTF5YSEMQO1ZDhoNALOBncnFwUtRIGkvPuChe3
yrFYD/x3e3v9QgCJxJ0nJ2BQrPyk7rTdz6veinBPF1wqYSFziM47U/r5edmAK8bg
gsaB2lyvxXSO1WcD1CpdQz3gQEcJzzSL1yXooGj2rlvxAfZaK+HGckCPk4YTFKlg
WOYK34JVCg7Qsq5UIAbg1qH3hj9S4FD46HWDgs1PCfY1Eqqx9BU6ONYxZj9h8zBG
NwIDAQAB
-----END PUBLIC KEY-----
    EOT
}
