#!/bin/bash
set -e

qemu-system-arm \
  -M lm3s6965evb \
  -semihosting \
  -nographic \
  -kernel build/firmware.elf > test/test_output.log 2>&1 &

sleep 5
pkill qemu-system-arm
