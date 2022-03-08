lookup('classes', {merge => unique}).include
node /puppet.*/ {
  # Configure puppetdb and its underlying database
  class { 'puppetdb': }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
node default {
  lookup('classes', {merge => unique}).include
}
