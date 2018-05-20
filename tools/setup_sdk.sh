#!/usr/bin/env bash

set -e

ReportError() {
	echo "$@" 1>&2;
}

TOOCHAIN_NAME=""

if [ "$(uname)" == "Darwin" ]; then
    TOOLCHAIN_NAME="darwin-x64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	TOOLCHAIN_NAME="linux-x64"
else
	ReportError "This platform is not supported. Supported platforms are Darwin or Linux."
	exit -1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SDK_DIR="${SCRIPT_DIR}/../sdk/"

rm -rf "${SDK_DIR}"
mkdir -p "${SDK_DIR}"

echo "Settng up Toolchain..."
wget -O "${SDK_DIR}/toolchain.tar.gz" https://storage.googleapis.com/xcompile_sdk/pi/toolchain/${TOOLCHAIN_NAME}.tar.gz
tar -xzvf "${SDK_DIR}/toolchain.tar.gz" -C "${SDK_DIR}"
rm "${SDK_DIR}/toolchain.tar.gz"
mv "${SDK_DIR}/${TOOLCHAIN_NAME}" "${SDK_DIR}/toolchain"

echo "Setting up Sysroot..."
wget -O "${SDK_DIR}/sysroot.tar.gz" https://storage.googleapis.com/xcompile_sdk/pi/sysroot.tar.gz
tar -xzvf "${SDK_DIR}/sysroot.tar.gz" -C "${SDK_DIR}"
rm "${SDK_DIR}/sysroot.tar.gz"
