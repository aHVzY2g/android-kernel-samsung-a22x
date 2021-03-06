#!/bin/bash

export CROSS_COMPILE=$(pwd)/PLATFORM/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CC=$(pwd)/PLATFORM/Clang-R383902/bin/clang
export CLANG_TRIPLE=$(pwd)/PLATFORM/aarch64-linux-gnu/bin/aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y a22x_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
