#!/usr/bin/env bash
set -e
set -u

cat please.wren test.wren > /tmp/wren_compiled.wren
"$WREN_PATH" /tmp/wren_compiled.wren
