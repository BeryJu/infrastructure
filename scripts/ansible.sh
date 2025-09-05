#!/bin/bash
export ARA_API_CLIENT=http
export ARA_API_SERVER="https://ara.beryjuio-home.k8s.beryju.io"
export ANSIBLE_CALLBACK_PLUGINS=$(uv run python3 -m ara.setup.callback_plugins)
ansible-playbook --diff $@
