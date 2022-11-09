#!/usr/bin/env bash
# set -e
source 'approvals.bash'


describe "op ?"
  cd ./fixtures/usage-comments
  approve "op ?"
  cd ../../

describe "op ? (with rogue lines)"
  cd ./fixtures/rogue-line
  approve "op ?"
  cd ../../

describe "op ? (with private commands)"
  cd ./fixtures/private
  approve "op ?"
  cd ../../
