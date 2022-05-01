#!/bin/bash -xe
source $(dirname $BASH_SOURCE)/common.sh

ssh puppet1.prod.beryju.org -- sudo /opt/puppetlabs/bin/puppetserver ca clean --certname scratch-vm.lab.beryju.org || true

ssh_keys=$(doctl compute ssh-key list --format ID --no-header | xargs | sed -e 's/ /,/g')
doctl compute droplet create $VM_NAME \
    --region fra1 \
    --size s-2vcpu-2gb \
    --image ubuntu-20-04-x64 \
    --ssh-keys "$ssh_keys" \
    --user-data-file "$SCRIPT_DIR/userdata.sh" \
    --wait \
    --tag-name scratch-vm

ssh puppet1.prod.beryju.org -- sudo /opt/puppetlabs/bin/puppetserver ca sign --certname scratch-vm.lab.beryju.org
