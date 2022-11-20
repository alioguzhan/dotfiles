#!/bin/bash

set -e

echo "### Benchmarking Write speeds...."
dd if=/dev/zero of=tempfile bs=1M count=4096 conv=fdatasync,notrunc status=progress oflag=direct
echo "Done."

echo "### Benchmarking Read..."
dd if=tempfile of=/dev/null bs=1M count=4096 status=progress iflag=direct
echo "Done"

echo "Cleaning up..."
rm -rf tempfile
echo "Done. Bye"
