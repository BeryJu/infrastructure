resource "grafana_folder" "beryjuorg-thanos" {
  title = "BeryJu.org Thanos"
}

data "http" "thanos-dashboard" {
  url = "https://raw.githubusercontent.com/thanos-io/thanos/main/examples/dashboards/overview.json"
}

resource "grafana_dashboard" "thanos" {
  folder      = grafana_folder.beryjuorg-thanos.id
  config_json = replace(data.http.thanos-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "thanos-query" {
  url = "https://raw.githubusercontent.com/thanos-io/thanos/main/examples/dashboards/query.json"
}

resource "grafana_dashboard" "thanos-query" {
  folder      = grafana_folder.beryjuorg-thanos.id
  config_json = replace(data.http.thanos-query.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "thanos-query-frontend" {
  url = "https://raw.githubusercontent.com/thanos-io/thanos/main/examples/dashboards/query-frontend.json"
}

resource "grafana_dashboard" "thanos-query-frontend" {
  folder      = grafana_folder.beryjuorg-thanos.id
  config_json = replace(data.http.thanos-query-frontend.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "thanos-receive" {
  url = "https://raw.githubusercontent.com/thanos-io/thanos/main/examples/dashboards/receive.json"
}

resource "grafana_dashboard" "thanos-receive" {
  folder      = grafana_folder.beryjuorg-thanos.id
  config_json = replace(data.http.thanos-receive.body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "thanos-rule" {
  url = "https://raw.githubusercontent.com/thanos-io/thanos/main/examples/dashboards/rule.json"
}

resource "grafana_dashboard" "thanos-rule" {
  folder      = grafana_folder.beryjuorg-thanos.id
  config_json = replace(data.http.thanos-rule.body, "$${DS_PROMETHEUS}", "Prometheus")
}
