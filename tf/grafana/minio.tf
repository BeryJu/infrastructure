resource "grafana_folder" "beryjuorg-minio" {
  title = "BeryJu.org Minio"
}

data "http" "minio-dashboard" {
  url = "https://raw.githubusercontent.com/minio/minio/master/docs/metrics/prometheus/grafana/minio-dashboard.json"
}

resource "grafana_dashboard" "minio" {
  folder      = grafana_folder.beryjuorg-minio.id
  config_json = replace(data.http.minio-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
