#!/bin/bash

# Start QEMU in background
qemu-system-arm \
  -M lm3s6965evb \
  -semihosting \
  -nographic \
  -S -gdb tcp::1234 \
  -kernel build/firmware.elf &

# Wait briefly to ensure QEMU is listening
sleep 1

# Start GDB using the pre-configured .gdbinit
arm-none-eabi-gdb -x .gdbinit build/firmware.elf
