#!/usr/bin/env bash

pushd ${BASH_SOURCE[0]}/../dependencies/variant
mkdir -p build
pushd build
cmake ..
make -j8 -l8
make install DESTDIR=.
popd
popd
