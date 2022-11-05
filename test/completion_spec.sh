#!/usr/bin/env bash
# set -e
source 'approvals.bash'

# The commands described in this feature are not directly executed by the
# user, but rather by some other bash tricks, like eval and bash completion
# Nonetheless, they still return output to standard output, and this is what
# is tested here

cd ./fixtures/completion

describe "Run op only and press tab to cycle through all commands"
  export COMP_LINE=op
  approve "op --completion"

describe "Run the completion command with a single match"
  export COMP_LINE="op c"
  approve "op --completion" "op_compoletion_op_c"

describe "Run the completion command with multiple matches"
  export COMP_LINE="op b"
  approve "op --completion" "op_compoletion_op_b"

describe "Run the completion command with -w"
  export COMP_LINE="op -w b"
  approve "op --completion" "op_compoletion_op_b"
  # note: same approval file as previous test, expecting same output

describe "Run the completion command in a folder without op.conf"
  export COMP_LINE="op "
  cd ../empty-dir
  approve "op --completion" "op_completion_empty"


unset COMP_LINE
cd ../../