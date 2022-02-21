#!/bin/bash -x
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook ./new-vm.yml --extra-vars @$1
