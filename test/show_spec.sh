#!/usr/bin/env bash
source 'approvals.bash'

describe "op --show"
  cd "./fixtures/basic"
  approve "op --show"
  cd ../../

  context "when private commands are defined"
    cd "./fixtures/private"
    approve "op --show"
    cd ../../
