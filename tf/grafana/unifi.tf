resource "grafana_folder" "beryjuorg-unifi" {
  title = "BeryJu.org Unifi"
}

data "http" "unifi-client-insight" {
  url = "https://raw.githubusercontent.com/unpoller/dashboards/master/v2.0.0/UniFi-Poller_%20Client%20Insights%20-%20Prometheus.json"
}

resource "grafana_dashboard" "unifi-client-insight" {
  folder      = grafana_folder.beryjuorg-unifi.id
  config_json = replace(data.http.unifi-client-insight.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "unifi-uap-insight" {
  url = "https://raw.githubusercontent.com/unpoller/dashboards/master/v2.0.0/UniFi-Poller_%20UAP%20Insights%20-%20Prometheus.json"
}

resource "grafana_dashboard" "unifi-uap-insight" {
  folder      = grafana_folder.beryjuorg-unifi.id
  config_json = replace(data.http.unifi-uap-insight.body, "$${DS_PROMETHEUS}", "Prometheus")
}
