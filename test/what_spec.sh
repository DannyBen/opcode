#!/usr/bin/env bash
source 'approvals.bash'

describe "op --what"
  context "without additional arguments"
    cd ./fixtures/basic
    approve "op -w"
    cd ../../

  context "without additional arguments when private commands exist"
    cd ./fixtures/private
    approve "op -w"
    cd ../../

  describe "without additional arguments when single char commands exist"
    cd ./fixtures/one-char
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
