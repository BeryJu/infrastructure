# Ansible playbooks for my infrastructure

See also https://github.com/BeryJu/k8s, repository for GitOps with flux.

## Requirements

- Ansible latest
- HashiCorp Vault (for credentials)
- VMware vSphere (for provisioning)

## Installation

```shell
poetry shell
poetry install # (--dev if you want to lint)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # Seems to workaround a bug with hvac on macOS
```

## Non-ansible files

- `ee/`:

    Contains a dockerfile for the custom **e**xecution **e**nvironment for AWX. Includes `hvac` package for HashiCorp Vault.

- `packer/`:

    Contains a packer project used to create a custom base image with the VMware Cloud-init datasource.

- `workstation/`:

    Docker image that I use for day-to-day tasks, has all required utilities installed.

## Playbooks

- `actions/cleanup.yml`:

    Remove unused docker images (executed on a schedule by AWX)

- `actions/kick-cmk.yml`:

    Resets and restart the check_mk agent when

    - Check_MK says "Empty output"
    - Systemd says "Too many incoming connections (4) from source"

- `actions/sentry-cleanup.yml`:

    Cleanup sentry data and vacuum the database (run once a day by AWX).

- `actions/update.yml`:

    Update all systems

- `awx/site.yml`:

    Configure awx.beryju.org

- `site.yml`:

    Main playbook, install common packages, set settings and ssh keys.

    Depending on the host, docker (and compose) are installed, and stacks are copied over.

- `provisioning/new-vm.yml`:

    Playbook to provision a new VM on vSphere using a cloud-init ubuntu or debian image.
