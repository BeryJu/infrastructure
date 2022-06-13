# frozen_string_literal: true

require 'facter'
require 'yaml'
require 'base64'

Facter.add(:cloudinit_userdata) do
  setcode do
    userdata = Base64.decode64(`vmware-rpctool "info-get guestinfo.userdata"`)
    YAML.load(userdata)
  end
end

Facter.add(:cloudinit_metadata) do
  setcode do
    metadata = Base64.decode64(`vmware-rpctool "info-get guestinfo.metadata"`)
    YAML.load(metadata)
  end
end
