#!/usr/bin/env bash
# set -e
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op --version"
  approve "op --version"
