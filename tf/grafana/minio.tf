resource "grafana_folder" "beryjuorg-minio" {
  title = "BeryJu.org Minio"
}

data "http" "minio-dashboard" {
  url = "https://raw.githubusercontent.com/minio/minio/master/docs/metrics/prometheus/grafana/minio-overview.json"
}

resource "grafana_dashboard" "minio" {
  folder      = grafana_folder.beryjuorg-minio.id
  config_json = data.http.minio-dashboard.body
}
