#!/usr/bin/env bash
set -e
source 'approvals.bash'

describe "op (in a folder with op.conf)"
  cd "./fixtures/basic"
  approve "op"
  cd ../../

describe "op --list"
  cd "./fixtures/advanced"
  approve "op --list"
  cd ../../

describe "op (when op.conf has multiline codes)"
  cd "./fixtures/multiline"
  approve "op"
  cd ../../
