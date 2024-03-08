#!/usr/bin/env bash
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op --add"
  context "with the expected arguments"
    rm -f op.conf
    approve "op --add say echo say --say -s"
    approve "op --add shout echo shout"
    approve "op shout"
    rm -f op.conf

  context "without arguments"
    rm -f op.conf
    approve "op --add"
    expect_exit_code 1

  describe "with quoted arguments"
    rm -f op.conf
    approve "op --add say echo \"hello world\" --color"
    rm -f op.conf
