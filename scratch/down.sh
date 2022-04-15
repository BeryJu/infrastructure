#!/bin/bash -xe
source ./common.sh

ssh puppet1.prod.beryju.org -- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname scratch-vm.lab.beryju.org

doctl compute droplet delete $VM_NAME
