#!/bin/bash -eux
# Remove snap
apt-get remove --purge -y snapd
apt-get autoremove --purge -y
apt-get update
apt-get dist-upgrade -y
apt-get upgrade -y
apt-get autoremove --purge -y

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

apt-get install -y python3-pip nfs-common

# Install puppet
cd /tmp
wget https://apt.puppet.com/puppet7-release-focal.deb
dpkg -i puppet7-release-focal.deb
rm puppet7-release-focal.deb
apt-get update
apt-get install -y puppet-agent
/opt/puppetlabs/puppet/bin/puppet config set server puppet.infra.beryju.org --section main
rm -rf /etc/puppetlabs/puppet/ssl/

# Reset Cloud-init state (https://stackoverflow.com/questions/57564641/openstack-packer-cloud-init)
systemctl stop cloud-init
rm -rf /var/lib/cloud/
# cloud-init clean -s -l

# Reset Machine-ID
# http://manpages.ubuntu.com/manpages/bionic/man5/machine-id.5.html
# This is the equivalent of the SID in Windows
# Netplan also uses this as DHCP Identifier, causing multiple VMs from the same Image
# to get the same IP Address
# This file shouldn't not be deleted but only truncated,
# see https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1508766
# see https://github.com/DanHam/packer-virt-sysprep/blob/master/sysprep-op-machine-id.sh
# Machine ID file locations
sysd_id="/etc/machine-id"
dbus_id="/var/lib/dbus/machine-id"

# Remove and recreate (and so empty) the machine-id file under /etc
if [ -e ${sysd_id} ]; then
    rm -f ${sysd_id} && touch ${sysd_id}
fi

# Remove the machine-id file under /var/lib/dbus if it is not a symlink
if [[ -e ${dbus_id} && ! -h ${dbus_id} ]]; then
    rm -f ${dbus_id}
fi

# Fix console-setup early
ln -s /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/en
