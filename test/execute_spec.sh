#!/usr/bin/env bash
source 'approvals.bash'

describe "op <command>"
  it "runs the command"
    cd ./fixtures/basic
    approve "op hello"
    cd ../../

  context "when the approved command exits wiuth non zero"
    it "continues execution and stores exit code"
      cd ./fixtures/basic
      approve "op nocommand"
      expect_exit_code 1
      cd ../../

  context "in a folder without op.conf"
    cd ./fixtures/empty-dir
    approve "op nocommand"
    expect_exit_code 1
    cd ../../

  context "in a folder with a file named 'opcode'"
    cd ./fixtures/opcode-file
    approve "op hello"
    expect_exit_code 0
    cd ../../

  context "with additional arguments"
    cd ./fixtures/advanced
    approve "op greet Lloyd"
    cd ../../

  context "with positional quoted arguments"
    cd ./fixtures/advanced
    approve "op reverse 'Lloyd Christmas' 'Harry Dunne'"
    cd ../../

  context "with excess positional arguments"
    cd ./fixtures/advanced
    approve "op reverse Larry Curly Moe"
    cd ../../

  context "with partial command matching"
    cd ./fixtures/completion
    approve "op b"
    approve "op ba"
    cd ../../

  context "with partial and exact command matching"
    cd ./fixtures/partial
    approve "op debug"
    approve "op deb"
    approve "op d"
    cd ../../

  context "with multiline config"
    cd ./fixtures/multiline
    approve "op who"
    cd ../../

  context "with a private command"
    cd ./fixtures/private
    approve "op three"
    cd ../../
