#!/bin/bash
set -e

echo "Starting QEMU simulation..."
qemu-system-arm \
  -M lm3s6965evb \
  -semihosting \
  -nographic \
  -kernel build/firmware.elf > test/test_output.log 2>&1 &

sleep 5
pkill qemu-system-arm

echo "✅ QEMU simulation complete. Log saved to test/test_output.log"
