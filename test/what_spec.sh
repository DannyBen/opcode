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
  approve "op -w nonono"
  [[ $? == 0 ]] && fail "Expected non zero exit code (got $?)"
  cd ../../

describe "op -w"
  cd ./fixtures/basic
  approve "op -w"
  [[ $? == 0 ]] && fail "Expected non zero exit code (got $?)"
  cd ../../
