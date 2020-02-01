#!/usr/bin/env bash
set -e
source 'approvals.bash'

describe "op --show"
  cd "./fixtures/basic"
  approve "op --show"
