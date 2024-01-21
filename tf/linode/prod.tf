resource "linode_lke_cluster" "prod" {
  label       = "beryjuio-prod"
  k8s_version = "1.28"
  region      = "eu-central"
  control_plane {
    high_availability = false
  }
  pool {
    type  = "g6-standard-4"
    count = 4
    autoscaler {
      max = 5
      min = 3
    }
  }
  lifecycle {
    ignore_changes = [
      pool[0].count
    ]
  }
}

module "vault-beryjuio-prod" {
  source = "../modules/vault_k8s_jwt"
  path   = "k8s-beryjuio-prod"
  iss    = "https://kubernetes.default.svc.cluster.local"
  aud    = "https://kubernetes.default.svc.cluster.local"
  jwks = jsonencode({
    "keys" : [
      {
        "use" : "sig",
        "kty" : "RSA",
        "kid" : "VNgDhtdvnh2J8whDiNPtsKqiI8ZAHzjjti7-gvG90Fs",
        "alg" : "RS256",
        "n" : "4LPhJWuAt0XaQMWT-YM94v0Q3UqNDveg7_dS6iZZg3YG_ARgWlR0aGs-CaQZv2AXcgOFtQ_6uBdg7SDiTFzJNqgEOZDtupWIuKy1EqPdYbCMVILrp1MbdHbXCUsoLWu9qZ0Dt0us2QJPtGhUdLvBxhmzOuO0t03SYwBWJj7TkgDwCw8-ymP0WAza7QM9r1l6XgNCpfUCauYv4DLw09O-Dn9k4XcuRWd8yhqxH80Ky5dwGLCbOx9QVtT65pifBGqISr5TEx1YLdWCEfrSi-oF4TXmSSMdFnse37LUHKk97ogn0s8KCTB1eqfNi_KhRjyxD08JrLAq7gu0rQkWUVyDcw",
        "e" : "AQAB"
      }
    ]
  })
  jwt_pub = <<-EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4LPhJWuAt0XaQMWT+YM9
4v0Q3UqNDveg7/dS6iZZg3YG/ARgWlR0aGs+CaQZv2AXcgOFtQ/6uBdg7SDiTFzJ
NqgEOZDtupWIuKy1EqPdYbCMVILrp1MbdHbXCUsoLWu9qZ0Dt0us2QJPtGhUdLvB
xhmzOuO0t03SYwBWJj7TkgDwCw8+ymP0WAza7QM9r1l6XgNCpfUCauYv4DLw09O+
Dn9k4XcuRWd8yhqxH80Ky5dwGLCbOx9QVtT65pifBGqISr5TEx1YLdWCEfrSi+oF
4TXmSSMdFnse37LUHKk97ogn0s8KCTB1eqfNi/KhRjyxD08JrLAq7gu0rQkWUVyD
cwIDAQAB
-----END PUBLIC KEY-----
    EOT
}
