#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SDK_DIR="${SCRIPT_DIR}/../sdk/"

rm -rf "${SDK_DIR}"
mkdir -p "${SDK_DIR}"

echo "Settng up Toolchain..."
wget -O "${SDK_DIR}/toolchain.tar.gz" https://storage.googleapis.com/xcompile_sdk/pi/toolchain/darwin_x64.tar.gz
tar -xzvf "${SDK_DIR}/toolchain.tar.gz" -C "${SDK_DIR}"
rm "${SDK_DIR}/toolchain.tar.gz"
mv "${SDK_DIR}/darwin-x64" "${SDK_DIR}/toolchain"

echo "Setting up Sysroot..."
wget -O "${SDK_DIR}/sysroot.tar.gz" https://storage.googleapis.com/xcompile_sdk/pi/sysroot.tar.gz
tar -xzvf "${SDK_DIR}/sysroot.tar.gz" -C "${SDK_DIR}"
rm "${SDK_DIR}/sysroot.tar.gz"
