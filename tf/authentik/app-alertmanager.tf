module "authentik-app-alertmanager" {
  source = "../modules/authentik_app"

  name     = "Alertmanager"
  group    = "Infrastructure"
  internal = "http://prom-kube-prometheus-stack-alertmanager.monitoring-system.svc.cluster.local:9093"
  external = "https://alertmanager.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
  icon_url = "https://public.s3.beryju.org/authentik-icons/alertmanager.png"
}
