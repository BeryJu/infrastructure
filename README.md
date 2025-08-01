# Ansible playbooks/Puppet stuff for my infrastructure

See also https://github.com/BeryJu/k8s, repository for GitOps with flux.

## Requirements

- Ansible latest
- Puppet latest
- HashiCorp Vault (for credentials)
- VMware vSphere (for provisioning)

## Installation

```shell
poetry shell
poetry install # (--dev if you want to lint)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # Seems to workaround a bug with hvac on macOS
```

## Non-puppet files

- `tf/`:

    Terraform stuff

- `images/`:

    Various docker images for things.

    Docker image that I use for day-to-day tasks, has all required utilities installed.

## Playbooks

- `actions/cleanup.yaml`:

    Remove unused docker images (executed on a schedule by AWX)

- `actions/sentry-cleanup.yaml`:

    Cleanup sentry data and vacuum the database (run once a day by AWX).

- `actions/update.yaml`:

    Update all systems
