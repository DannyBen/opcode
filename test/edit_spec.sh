#!/usr/bin/env bash
source 'approvals.bash'
cd ./fixtures/empty-dir

describe "op --edit"
  original_editor=$EDITOR
  export EDITOR="echo stubbed editor with: "
  approve "op --edit"
  export EDITOR=$original_editor

