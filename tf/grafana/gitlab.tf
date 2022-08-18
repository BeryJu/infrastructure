resource "grafana_folder" "beryjuorg-gitlab" {
  title = "BeryJu.org GitLab"
}

data "http" "gitlab-gitaly" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/gitaly.json"
}

resource "grafana_dashboard" "gitlab-gitaly" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-gitaly.response_body, "GitLab Omnibus", "Prometheus")
}

data "http" "gitlab-nfs-mountstats" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/nfs-mountstats.json"
}

resource "grafana_dashboard" "gitlab-nfs-mountstats" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-nfs-mountstats.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-nginx" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/nginx.json"
}

resource "grafana_dashboard" "gitlab-nginx" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-nginx.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-overview" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/overview.json"
}

resource "grafana_dashboard" "gitlab-overview" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-overview.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-postgresql" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/postgresql.json"
}

resource "grafana_dashboard" "gitlab-postgresql" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-postgresql.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-praefect" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/praefect.json"
}

resource "grafana_dashboard" "gitlab-praefect" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-praefect.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-rails-app" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/rails-app.json"
}

resource "grafana_dashboard" "gitlab-rails-app" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-rails-app.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-redis" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/redis.json"
}

resource "grafana_dashboard" "gitlab-redis" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-redis.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-registry" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/registry.json"
}

resource "grafana_dashboard" "gitlab-registry" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-registry.response_body, "GitLab Omnibus", "Prometheus")
}
data "http" "gitlab-service_platform_metrics" {
  url = "https://gitlab.com/gitlab-org/grafana-dashboards/-/raw/master/omnibus/service_platform_metrics.json"
}

resource "grafana_dashboard" "gitlab-service_platform_metrics" {
  folder      = grafana_folder.beryjuorg-gitlab.id
  config_json = replace(data.http.gitlab-service_platform_metrics.response_body, "GitLab Omnibus", "Prometheus")
}
