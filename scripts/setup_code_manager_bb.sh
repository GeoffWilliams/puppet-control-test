#!/bin/bash

ncedit batch --yaml-file scripts/setup_code_manager_bb.yaml
puppet agent -t
pe_rbac code_manager
cat /root/.puppetlabs/token
