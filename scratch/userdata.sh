#!/bin/bash
# Install puppet repo
wget https://apt.puppet.com/puppet7-release-focal.deb
dpkg -i puppet7-release-focal.deb
rm puppet7-release-focal.deb
# install puppet
apt-get update
apt-get install puppet-agent
/opt/puppetlabs/puppet/bin/puppet config set server puppet.infra.beryju.org --section main
/opt/puppetlabs/puppet/bin/puppet config set certname $(hostname -f) --section main
/opt/puppetlabs/puppet/bin/puppet agent -t

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik --disable-cloud-controller --disable-network-policy" sh
