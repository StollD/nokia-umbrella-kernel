#!/bin/sh

# Setup build configuration
export ARCH="arm64"
export SUBARCH="arm64"

# Fetch the toolchain
if [ ! -d prebuilt/gcc-arm-8.2 ]; then
    wget -O gcc-arm-8.2.tar.xz https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz
    tar xJvf gcc-arm-8.2.tar.xz    
    if [ ! -d prebuilt ]; then
        mkdir prebuilt
    fi
    mv gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu prebuilt/gcc-arm-8.2
    rm gcc-arm-8.2.tar.xz
fi
export CROSS_COMPILE="$(pwd)/prebuilt/gcc-arm-8.2/bin/aarch64-linux-gnu-"

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
