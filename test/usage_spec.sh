#!/usr/bin/env bash
source 'approvals.bash'

context "in a folder without op.conf"
  cd ./fixtures/empty-dir
  approve "op"
  approve "op --help"
