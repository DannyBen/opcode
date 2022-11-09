#!/usr/bin/env bash
# set -e   # some non zero exits exiected
source 'approvals.bash'

describe "Run a basic command"
  cd ./fixtures/basic
  approve "op hello"
  cd ../../

describe "Run an invalid command"
  cd ./fixtures/basic
  approve "op nocommand" || return 0
  expect_exit_code 1
  cd ../../

describe "Run in a folder without op.conf"
  cd ./fixtures/empty-dir
  approve "op nocommand" || return 0
  expect_exit_code 1
  cd ../../

describe "Run in a folder with opcode config file"
  cd ./fixtures/opcode-file
  approve "op hello"
  [[ $? == 0 ]] || fail "Expected zero exit code (got $?)"
  cd ../../

describe "Run a command with arguments"
  cd ./fixtures/advanced
  approve "op greet Lloyd"
  cd ../../

describe "Run a command with positional quoted arguments"
  cd ./fixtures/advanced
  approve "op reverse 'Lloyd Christmas' 'Harry Dunne'"
  cd ../../

describe "Run a command with excess positional arguments"
  cd ./fixtures/advanced
  approve "op reverse Larry Curly Moe"
  cd ../../

describe "Run a command with partial command matching"
  cd ./fixtures/completion
  approve "op b"
  approve "op ba"
  cd ../../

describe "Run a command with partial and exact command matching"
  cd ./fixtures/partial
  approve "op debug"
  approve "op deb"
  approve "op d"
  cd ../../

describe "Run a command with multiline config"
  cd ./fixtures/multiline
  approve "op who"
  cd ../../

describe "Run a private command"
  cd ./fixtures/private
  approve "op three"
  cd ../../

