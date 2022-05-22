model_actions = [
    "model_updated",
    "model_created",
]
model_app = "authentik_core"
model_name = "token"
vault_host = "https://vault.beryju.org"
vault_auth_path = "auth/k8s-prd"
vault_kv_store = "kv"
vault_kv_prefix = "authentik"

from authentik.core.models import Token

event = request.context.get("event", None)
if not event:
    ak_logger.info("vault_write: No event")
    return False
if event.action not in model_actions:
    ak_logger.info("vault_write: Non-matching action")
    return False
if (
    event.context["model"]["app"] != model_app
    or event.context["model"]["model_name"] != model_name
):
    ak_logger.info("vault_write: Invalid model")
    return False

token = Token.objects.filter(token_uuid=event.context["model"]["pk"]).first()
if not token:
    ak_logger.info("vault_write: Token doesn't exist anymore")
    return False

# Vault login
with open(
    "/var/run/secrets/kubernetes.io/serviceaccount/token", "r", encoding="utf-8"
) as _token:
    k8s_token = _token.read()
auth = requests.post(
    f"{vault_host}/v1/{vault_auth_path}/login",
    json={
        "jwt": k8s_token,
        "role": "authentik",
    },
)
auth.raise_for_status()
vault_token = auth.json()["auth"]["client_token"]
ak_logger.info("vault_write: Got vault token")

response = requests.post(
    f"{vault_host}/v1/{vault_kv_store}/data/{vault_kv_prefix}/{token.identifier}",
    json={
        "data": {
            "key": token.key,
            "intent": token.intent,
        }
    },
    headers={
        "X-Vault-Token": vault_token,
    },
)
ak_logger.info(response.json())

return False
