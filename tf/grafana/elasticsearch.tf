resource "grafana_folder" "beryjuorg-elasticsearch" {
  title = "BeryJu.org Elasticsearch"
}

data "http" "elasticsearch-dashboard" {
  url = "https://raw.githubusercontent.com/prometheus-community/elasticsearch_exporter/master/examples/grafana/dashboard.json"
}

resource "grafana_dashboard" "elasticsearch" {
  folder      = grafana_folder.beryjuorg-elasticsearch.id
  config_json = replace(data.http.elasticsearch-dashboard.body, "$${DS_PROMETHEUS}", "Prometheus")
}
