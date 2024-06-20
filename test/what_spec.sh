#!/usr/bin/env bash
source 'approvals.bash'

describe "op --what"
  context "without command code"
    cd ./fixtures/basic
    approve "op -w"
    cd ../../

  context "with a command that was defined as a single line"
    cd ./fixtures/basic
    approve "op -w hello"
    cd ../../

  context "with a command that was defined as multiple lines"
    cd ./fixtures/multiline
    approve "op -w multi"
    cd ../../

  context "with a command that was defined as concatenated line"
    cd ./fixtures/multiline
    approve "op -w concat"
    cd ../../

  context "with a code that does not exist"
    cd ./fixtures/basic
    approve "op -w nonono"
    expect_exit_code 1
    cd ../../
