resource "grafana_folder" "beryjuorg-artifactory" {
  title = "BeryJu.org Artifactory"
}

data "http" "artifactory-dashboard" {
  url = "https://raw.githubusercontent.com/jfrog/log-analytics-prometheus/master/grafana/Artifactory-dashboard.json"
}

resource "grafana_dashboard" "artifactory" {
  folder      = grafana_folder.beryjuorg-artifactory.id
  config_json = replace(data.http.artifactory-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "artifactory-drilldown-dashboard" {
  url = "https://raw.githubusercontent.com/jfrog/log-analytics-prometheus/master/grafana/Artifactory%20%26%20Xray%20Drill%20Downs-dashboard.json"
}

resource "grafana_dashboard" "artifactory-drilldown" {
  folder      = grafana_folder.beryjuorg-artifactory.id
  config_json = replace(data.http.artifactory-drilldown-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}
