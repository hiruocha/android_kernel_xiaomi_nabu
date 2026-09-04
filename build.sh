#!/bin/sh

CLANG_ROOT=$HOME/.local/bin/clang-r563880c/bin
export PATH="${CLANG_ROOT}:$PATH"
export ARCH=arm64
export SUBARCH=arm64
export LLVM=1
export LLVM_IAS=1

make ARCH=arm64 O=out HOSTCC=gcc LD=ld.lld vendor/sm8150-perf_defconfig vendor/debugfs.config vendor/xiaomi/sm8150-common.config vendor/xiaomi/nabu.config vendor/droidspaces.config

make -j$(nproc) ARCH=arm64 O=out HOSTCC=gcc LD=ld.lld Image
