#!/usr/bin/env bash
# set -e   # some non zero exits exiected
source 'approvals.bash'

describe "op -w <single line command>"
  cd ./fixtures/basic
  approve "op -w hello"
  cd ../../

describe "op -w <multiline ommand>"
  cd ./fixtures/multiline
  approve "op -w who"
  cd ../../

describe "op -w <code that does not exist>"
  cd ./fixtures/basic
  approve "op -w nonono" || return 0
  expect_exit_code 1
  cd ../../

describe "op -w"
  cd ./fixtures/basic
  approve "op -w"
  cd ../../

describe "op -w (with private commands)"
  cd ./fixtures/private
  approve "op -w"
  cd ../../
