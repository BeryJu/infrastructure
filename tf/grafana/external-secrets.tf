resource "grafana_folder" "beryjuorg-external-secrets" {
  title = "BeryJu.io external-secrets"
}

data "http" "external-secrets-dashboard" {
  url = "https://raw.githubusercontent.com/external-secrets/external-secrets/main/docs/snippets/dashboard.json"
}

resource "grafana_dashboard" "external-secrets" {
  folder      = grafana_folder.beryjuorg-external-secrets.id
  config_json = replace(data.http.external-secrets-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
