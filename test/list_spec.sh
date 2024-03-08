#!/usr/bin/env bash
source 'approvals.bash'

describe "op --list"
  cd "./fixtures/advanced"
  approve "op --list"
  cd ../../

describe "op"
  context "in a folder with op.conf"
    cd "./fixtures/basic"
    approve "op"
    cd ../../

  context "when op.conf has multiline codes"
    cd "./fixtures/multiline"
    approve "op"
    cd ../../

  context "with a line that does not contain a colon"
    cd "./fixtures/rogue-line"
    approve "op"
    cd ../../

  context "when private commands are defined"
    cd "./fixtures/private"
    approve "op"
    cd ../../

  context "with one character commands"
    cd "./fixtures/one-char"
    approve "op"
    cd ../../
