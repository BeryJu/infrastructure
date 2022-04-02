#!/bin/bash -x
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook ./new-vm.yaml --extra-vars @$1
