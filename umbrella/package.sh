#!/bin/sh

# Test for a compiled kernel
if [ ! -f out/include/generated/autoconf.h ]; then
    echo "Please compile a kernel before attempting to package it!"
    exit 1
fi

VERSION=$(git rev-parse --short HEAD)

# Extract the version name of the kernel
KVERSION=$(grep "CONFIG_LOCALVERSION" out/include/generated/autoconf.h)
KVERSION=$(echo $KVERSION | sed -s 's/#define CONFIG_LOCALVERSION "\(\S*\)"/\1/g')

# Extract the device name
KDEVICE=$(echo $KVERSION | sed -s 's/-umbrella-\S*-\(\S*\)/\1/g')
KDEVICE=$(echo $KDEVICE | tr '[:lower:]' '[:upper:]')

# Extract the used config
KCONFIG=$(echo $KVERSION | sed -s 's/-umbrella-\(\S*\)-\S*/\1/g')
KCONFIG=$(echo $KCONFIG | sed -s 's/.*/\u&/')

# Copy the template config
cp -r umbrella/template umbrella/.tmp

# Update the variables
echo "Version: 4.4.153$KVERSION" > umbrella/.tmp/version
sed -i "s/{DEVICE}/$KDEVICE/g" umbrella/.tmp/anykernel.sh

# Copy the kernel
cp out/arch/arm64/boot/Image.gz-dtb umbrella/.tmp

# Package the zip file
mkdir -p umbrella/out
cd umbrella/.tmp
zip -r ../out/Umbrella-$KCONFIG-$KDEVICE-$VERSION.zip .
cd ../..

# Clean up
rm -r umbrella/.tmp