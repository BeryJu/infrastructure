# frozen_string_literal: true

require 'facter'
require 'yaml'
require 'base64'

Facter.add(:kube_is_node) do
  setcode do
    `pidof kubelet` != ""
  end
end

Facter.add(:kube_is_apiserver) do
  setcode do
    `pidof kube-apiserver` != ""
  end
end

Facter.add(:kube_is_etcd) do
  setcode do
    `pidof etcd` != ""
  end
end
