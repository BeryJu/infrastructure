#!/bin/bash -xe
source $(dirname $BASH_SOURCE)/common.sh

ssh puppet1.prod.beryju.org -- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname scratch-vm.lab.beryju.org || true

doctl compute droplet delete $VM_NAME
