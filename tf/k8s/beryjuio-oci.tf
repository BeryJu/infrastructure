module "vault-beryjuio-oci" {
  source = "../modules/vault_k8s_jwt"
  path   = "k8s-beryjuio-oci"
  iss    = "https://kubernetes.default.svc.cluster.local"
  aud    = "https://kubernetes.default.svc.cluster.local"
  jwks = jsonencode({
    "keys" : [
      {
        "use" : "sig",
        "kty" : "RSA",
        "kid" : "Iq5BShmncBxrMAbTtneuHDLEfX5Jzr6NKyEx69yh06k",
        "alg" : "RS256",
        "n" : "zSmdM7rVCj8otbWvM40E_wd4UXkamTAT0iyCfvrYnttqibaheg_FBSiegNcH-Y_5yZSAG0k_4CwI4gA9z9Jp-eAsncj_IqTln-1j6jDeil7PYwXFIMD77Guhs3lSsNPNFJc_oK6L6doeb6yI8h1pGRjvMonXp9naR292ol4kcKPlyY1DbiTxzhhA23WqwaaydvQ9ArvzsE96UAIjeAGBkkYZoj1kbricgGsgc0pfTH_CG6m_CQXWc8DhTc4Fy36fZTrHTyo_I16zU1GuhEWnnmyp3KUjLz9UkwEGqQWynrLI1cYIDObNyDa8zIWKAb6uo1pKNQl_EG6eu_omMshtmQ",
        "e" : "AQAB"
      }
    ]
  })
  jwt_pub = <<-EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzSmdM7rVCj8otbWvM40E
/wd4UXkamTAT0iyCfvrYnttqibaheg/FBSiegNcH+Y/5yZSAG0k/4CwI4gA9z9Jp
+eAsncj/IqTln+1j6jDeil7PYwXFIMD77Guhs3lSsNPNFJc/oK6L6doeb6yI8h1p
GRjvMonXp9naR292ol4kcKPlyY1DbiTxzhhA23WqwaaydvQ9ArvzsE96UAIjeAGB
kkYZoj1kbricgGsgc0pfTH/CG6m/CQXWc8DhTc4Fy36fZTrHTyo/I16zU1GuhEWn
nmyp3KUjLz9UkwEGqQWynrLI1cYIDObNyDa8zIWKAb6uo1pKNQl/EG6eu/omMsht
mQIDAQAB
-----END PUBLIC KEY-----
    EOT
}
