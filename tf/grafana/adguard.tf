resource "grafana_folder" "beryjuorg-adguard" {
  title = "BeryJu.org Adguard"
}

data "http" "adguard-dashboard" {
  url = "https://raw.githubusercontent.com/ebrianne/adguard-exporter/master/grafana/dashboard.json"
}

resource "grafana_dashboard" "adguard" {
  folder      = grafana_folder.beryjuorg-adguard.id
  config_json = replace(data.http.adguard-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}
