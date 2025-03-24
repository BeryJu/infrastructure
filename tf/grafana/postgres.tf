resource "grafana_folder" "beryjuorg-postgres" {
  title = "BeryJu.io PostgreSQL"
}

data "http" "postgres-dashboard" {
  url = "https://raw.githubusercontent.com/prometheus-community/postgres_exporter/master/postgres_mixin/dashboards/postgres-overview.json"
}

resource "grafana_dashboard" "postgres" {
  folder      = grafana_folder.beryjuorg-postgres.id
  config_json = replace(data.http.postgres-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
