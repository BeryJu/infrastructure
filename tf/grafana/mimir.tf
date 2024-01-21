locals {
  mimir_urls = [
    "mimir-alertmanager-resources.json",
    "mimir-alertmanager.json",
    "mimir-compactor-resources.json",
    "mimir-compactor.json",
    "mimir-config.json",
    "mimir-object-store.json",
    "mimir-overrides.json",
    "mimir-overview-networking.json",
    "mimir-overview-resources.json",
    "mimir-overview.json",
    "mimir-queries.json",
    "mimir-reads-networking.json",
    "mimir-reads-resources.json",
    "mimir-reads.json",
    "mimir-remote-ruler-reads-resources.json",
    "mimir-remote-ruler-reads.json",
    "mimir-rollout-progress.json",
    "mimir-ruler.json",
    "mimir-scaling.json",
    "mimir-slow-queries.json",
    "mimir-tenants.json",
    "mimir-top-tenants.json",
    "mimir-writes-networking.json",
    "mimir-writes-resources.json",
    "mimir-writes.json",
  ]
}

resource "grafana_folder" "beryjuio-mimir" {
  title = "BeryJu.io Mimir"
}

data "http" "mimir-dashboard" {
  url      = "https://raw.githubusercontent.com/grafana/mimir/main/operations/mimir-mixin-compiled/dashboards/${each.value}"
  for_each = toset(local.mimir_urls)
}

resource "grafana_dashboard" "mimir" {
  folder      = grafana_folder.beryjuio-mimir.id
  config_json = replace(each.value.response_body, "$$datasource", "Prometheus")
  for_each    = data.http.mimir-dashboard
}
