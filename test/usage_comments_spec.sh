#!/usr/bin/env bash
source 'approvals.bash'

describe "op ?"
  context "when usage comments are defined"
    cd ./fixtures/usage-comments
    approve "op ?"
    cd ../../

  context "with rogue lines"
    cd ./fixtures/rogue-line
    approve "op ?"
    cd ../../

  context "with private commands"
    cd ./fixtures/private
    approve "op ?"
    cd ../../

  context "with single char commands"
    cd ./fixtures/one-char
    approve "op ?"
    cd ../../

  context "with multiline commands"
    cd ./fixtures/multiline
    approve "op ?"
    cd ../../
