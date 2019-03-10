#!/bin/sh

# Setup build configuration
export ARCH="arm64"
export SUBARCH="arm64"

# Fetch the toolchain
if [ ! -d .toolkit ]; then
    git clone https://bitbucket.org/matthewdalex/aarch64-linux-android-4.9 .toolkit
fi
export CROSS_COMPILE="$(pwd)/.toolkit/bin/aarch64-linux-android-"

# Set the output directory
export KBUILD_OUTPUT="$(pwd)/out"

# Setup usernames to hide the real machine data
export KBUILD_BUILD_USER="user"
export KBUILD_BUILD_HOST="build"

# Nice output
echo "Build Environment initialized:"
echo "  ARCH: $ARCH"
echo "  KBUILD_OUTPUT: $KBUILD_OUTPUT"
echo ""
echo "To configure the build for NB1, type"
echo "  make nb1_defconfig"
echo ""
echo "To configure the build for A1N, type"
echo "  make a1n_defconfig"
echo ""
echo "To compile the configured kernel, type"
echo "  make -j$(nproc --all)"
