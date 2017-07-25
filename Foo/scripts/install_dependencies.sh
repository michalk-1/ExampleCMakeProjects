#!/usr/bin/env bash
set -o errexit

__DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
pushd ${__DIR}/../dependencies/variant
mkdir -p build
pushd build
cmake -DCMAKE_INSTALL_PREFIX=../result ..
make -j5 -l10
make install
