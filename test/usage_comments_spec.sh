#!/usr/bin/env bash
set -e
source 'approvals.bash'
cd ./fixtures/usage-comments

describe "op ?"
  approve "op ?"
