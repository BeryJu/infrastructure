# Ansible playbooks for my infrastructure

See also https://github.com/BeryJu/k8s, repository for GitOps with flux.

## Requirements

- Ansible 2.10
- HashiCorp Vault (for credentials)
- VMware vSphere (for provisioning)

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

- `actions/sentry-cleanup.yml`:

    Cleanup sentry data and vacuum the database (run once a day by AWX).

- `actions/update.yml`:

    Update all systems

- `site.yml`:

    Main playbook, install common packages, set settings and ssh keys.

    Depending on the host, docker (and compose) are installed, and stacks are copied over.

- `provisioning/new-vm.yml`:

    Playbook to provision a new VM on vSphere using a cloud-init ubuntu or debian image.
