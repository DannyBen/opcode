#!/usr/bin/env bash
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op --version"
  approve "op --version"
