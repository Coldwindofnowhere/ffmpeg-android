#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ogg

make clean

./autogen.sh

./configure \
  --with-pic \
  --host="$NDK_TOOLCHAIN_ABI" \
  --disable-asm \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
