#!/usr/bin/env bash
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op --add with arguments"
  rm -f op.conf
  approve "op --add say echo say --say -s"
  approve "op --add shout echo shout"
  approve "op shout"
  rm -f op.conf

describe "op --add without arguments"
  set +e # allow non zero exit code
  rm -f op.conf
  approve "op --add"
  set -e

describe "op --add with quoted arguments"
  rm -f op.conf
  approve "op --add say echo \"hello world\" --color"
  rm -f op.conf
