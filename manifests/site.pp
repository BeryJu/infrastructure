node /puppet.*/ {
  class { 'puppetdb': }
  class { 'puppetdb::master::config': }
}
node default {
  if $::facts[os][family] != "windows" {
    lookup('classes', {merge => unique}).include
  }
}
