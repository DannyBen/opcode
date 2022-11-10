#!/usr/bin/env bash
# set -e
source 'approvals.bash'

describe "op --show"
  cd "./fixtures/basic"
  approve "op --show"
  cd ../../

describe "op --show (with private commands)"
  cd "./fixtures/private"
  approve "op --show"
  cd ../../
