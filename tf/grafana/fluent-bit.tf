resource "grafana_folder" "beryjuorg-fluent-bit" {
  title = "BeryJu.org fluent-bit"
}

data "http" "fluent-bit-dashboard" {
  url = "https://raw.githubusercontent.com/fluent/fluent-bit-docs/master/monitoring/dashboard.json"
}

resource "grafana_dashboard" "fluent-bit" {
  folder      = grafana_folder.beryjuorg-fluent-bit.id
  config_json = replace(data.http.fluent-bit-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}
