#!/usr/bin/env bash

killall -q polybar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar primary >>/tmp/polybar1.log 2>&1 & disown

echo "Primary bar launched..."

