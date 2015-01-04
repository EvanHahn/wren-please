#!/usr/bin/env bash
set -e
set -u

cat please.wren test.wren > /tmp/wren_compiled.wren
/vagrant/wren/lang/wren /tmp/wren_compiled.wren
