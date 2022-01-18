#!/bin/bash
expires=$(vault token lookup -format json | jq .data.expire_time)
echo "BeryJu.org vault token active, expires: ${expires}"
