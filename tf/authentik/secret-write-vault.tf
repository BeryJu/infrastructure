resource "authentik_policy_expression" "vault-write" {
  name       = "event-vault-kv-write"
  expression = file("${path.module}/source/policy-vault-kv-write.py")
}

resource "authentik_group" "vault-write-group" {
  name = "vault-write-group"
}

resource "authentik_event_rule" "vault" {
  name       = "vault-write-transport"
  group      = authentik_group.vault-write-group.id
  transports = []
}

resource "authentik_policy_binding" "vault-write" {
  target = authentik_event_rule.vault.id
  policy = authentik_policy_expression.vault-write.id
  order  = 0
}
