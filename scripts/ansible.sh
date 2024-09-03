#!/bin/bash
export ARA_API_CLIENT=http
export ARA_API_SERVER="https://ara.beryjuio-home.k8s.beryju.org"
export ANSIBLE_CALLBACK_PLUGINS=$(poetry run python3 -m ara.setup.callback_plugins)
ansible-playbook --diff $@