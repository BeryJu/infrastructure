#!/bin/bash
git show -s |head -n 1|awk '{print $2}'
exit 0
