#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd libvpx

make clean

./configure \
  --sdk-path="$ANDROID_NDK_ROOT_PATH" \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --enable-pic \
  --target=armv7-android-gcc \
  --extra-cflags="-mfloat-abi=softfp -mfpu=neon" \
  --disable-examples \
  --disable-docs \
  --enable-static \
  --disable-runtime-cpu-detect \
  --disable-shared || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
