#!/usr/bin/env bash
# set -e
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op (in a folder without op.conf)"
  approve "op"

describe "Run op --help"
  approve "op --help"
