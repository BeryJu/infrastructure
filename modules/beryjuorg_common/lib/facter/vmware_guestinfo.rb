# frozen_string_literal: true

require 'facter'
require 'yaml'
require 'base64'

Facter.add(:vmware_guestinfo_userdata) do
  setcode do
    userdata = Base64.decode64(`vmware-rpctool "info-get guestinfo.userdata"`)
    YAML.load(userdata)
  end
end

Facter.add(:vmware_guestinfo_metadata) do
  setcode do
    metadaat = Base64.decode64(`vmware-rpctool "info-get guestinfo.metadata"`)
    YAML.load(metadaat)
  end
end
