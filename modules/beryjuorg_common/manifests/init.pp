# Init
#
class beryjuorg_common {
  include apt
  class { 'beryjuorg_common::packages': }
  class { 'beryjuorg_common::settings': }
  class { 'beryjuorg_common::users': }
  class { 'beryjuorg_common::mta': }
}
