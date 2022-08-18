resource "grafana_folder" "beryjuorg-redis" {
  title = "BeryJu.org Redis"
}

data "http" "redis-dashboard" {
  url = "https://raw.githubusercontent.com/oliver006/redis_exporter/master/contrib/grafana_prometheus_redis_dashboard.json"
}

resource "grafana_dashboard" "redis" {
  folder      = grafana_folder.beryjuorg-redis.id
  config_json = replace(data.http.redis-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
