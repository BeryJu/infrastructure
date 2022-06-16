# Init
#
class beryjuorg_common {
  class { 'beryjuorg_common::packages': }
  class { 'beryjuorg_common::settings': }
  class { 'beryjuorg_common::users': }
  class { 'beryjuorg_common::mta': }
  class { 'beryjuorg_common::logging': }
}
