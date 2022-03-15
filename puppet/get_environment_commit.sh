#!/bin/bash
cd $1/environments/$2
git show -s | head -n 1 |awk '{print $2}'
exit 0
