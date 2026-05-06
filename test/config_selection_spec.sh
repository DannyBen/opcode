#!/usr/bin/env bash
source 'approvals.bash'

describe "config selection"
  context "with -c"
    cd ./fixtures/config-selection
    approve "op -c agent.op.conf hello"
    cd ../../

  context "with --config"
    cd ./fixtures/config-selection
    approve "op --config agent.op.conf hello"
    cd ../../

  context "with OPCODE_CONFIG"
    cd ./fixtures/config-selection
    approve "OPCODE_CONFIG=agent.op.conf op hello"
    cd ../../

  context "when -c is used after the command"
    cd ./fixtures/config-selection
    approve "op -c agent.op.conf args before -c after"
    cd ../../

  context "when -c wins over OPCODE_CONFIG"
    cd ./fixtures/config-selection
    approve "OPCODE_CONFIG=custom.op.conf op -c agent.op.conf hello"
    cd ../../

  context "with a renamed executable"
    cd ./fixtures/config-selection
    ln -sf ../../../op agent
    approve "./agent hello"
    rm -f agent
    cd ../../

  context "when .op.conf wins over .conf"
    cd ./fixtures/config-selection
    ln -sf ../../../op agent
    approve "./agent hello" "renamed_prefers_op_conf"
    rm -f agent
    cd ../../

  context "when OPCODE_CONFIG wins over executable-name discovery"
    cd ./fixtures/config-selection
    ln -sf ../../../op agent
    approve "OPCODE_CONFIG=custom.op.conf ./agent hello"
    rm -f agent
    cd ../../

  context "when a renamed executable has only .conf"
    cd ./fixtures/config-selection
    mv agent.op.conf agent.op.conf.tmp
    ln -sf ../../../op agent
    approve "./agent hello" "renamed_uses_conf_fallback"
    rm -f agent
    mv agent.op.conf.tmp agent.op.conf
    cd ../../

  context "when a renamed executable does not fall back to op.conf"
    cd ./fixtures/renamed-no-fallback
    ln -sf ../../../op agent
    approve "./agent hello" "renamed_no_op_conf_fallback"
    expect_exit_code 1
    rm -f agent
    cd ../../

  context "when a renamed executable adds a command"
    cd ./fixtures/empty-dir
    rm -f agent agent.op.conf
    ln -sf ../../../op agent
    approve "./agent --add hello echo hi" "renamed_add_uses_op_conf"
    rm -f agent agent.op.conf
    cd ../../
