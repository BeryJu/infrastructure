node /puppet.*/ {
  class { 'puppetdb': }
  class { 'puppetdb::master::config': }
  lookup('classes', {merge => unique}).include
}
node default {
  if $::facts[os][family] != 'windows' {
    lookup('classes', {merge => unique}).include
  }
}
