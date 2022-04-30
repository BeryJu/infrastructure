#!/bin/bash -e
hostname=$(hostname -f)
token=$(docker exec vault_vault_1 vault login \
    -method=cert \
    -address="https://$hostname:9443" \
    -ca-cert=/etc/puppetlabs/puppet/ssl/certs/ca.pem \
    -client-cert=/etc/puppetlabs/puppet/ssl/certs/$hostname.pem \
    -client-key=/etc/puppetlabs/puppet/ssl/private_keys/$hostname.pem \
    -token-only)

curl -s -H "Authorization: Bearer $token" \
    "http://$hostname:8200/v1/sys/metrics?format=prometheus"
