resource "grafana_folder" "beryjuorg-artifactory" {
  title = "BeryJu.org Artifactory"
}

data "http" "artifactory-dashboard" {
  url = "https://raw.githubusercontent.com/peimanja/artifactory_exporter/master/grafana/dashboard.json"
}

resource "grafana_dashboard" "artifactory" {
  folder      = grafana_folder.beryjuorg-artifactory.id
  config_json = replace(data.http.artifactory-dashboard.body, "$${DS_PROMETHEUS-DATASOURCE-CS}", "Prometheus")
}
