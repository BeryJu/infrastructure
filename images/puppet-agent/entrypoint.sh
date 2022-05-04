#!/bin/bash
/opt/puppetlabs/puppet/bin/puppet config set certname $(hostname -f) --section main
/opt/puppetlabs/puppet/bin/puppet config set server $PUPPET_SERVER --section main
/opt/puppetlabs/bin/puppet agent --verbose --no-daemonize
