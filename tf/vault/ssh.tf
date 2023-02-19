resource "vault_mount" "ssh-client-signer" {
  type = "ssh"
  path = "ssh-client-signer"
}
