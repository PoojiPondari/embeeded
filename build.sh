#!/bin/bash
set -e

GIT_SHA=$(git rev-parse HEAD)
BUILD_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Wall -g \
  -T linker.ld \
  -specs=rdimon.specs -lc -lrdimon \
  src/main.c -o build/firmware.elf

arm-none-eabi-objcopy -O ihex build/firmware.elf build/firmware.hex

echo "{\"git_sha\": \"$GIT_SHA\", \"build_time\": \"$BUILD_TIME\"}" > metadata/build_metadata.json
sha256sum build/firmware.elf > metadata/firmware.sha256
