#!/bin/bash

set -xe

# Initialize the TWRP repository.
repo init \
  --depth=1 \
  --manifest-url=https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git \
  --manifest-branch=twrp-12.1

# Add a new local manifest.
mkdir -p .repo/local_manifests
cat <<- EOF > .repo/local_manifests/roomservice.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project
    name="Fairphone/android_device_fairphone_FP5"
    path="device/fairphone/FP5"
    remote="github"
    revision="android-12.1"
  />
</manifest>
EOF

# Sync the repo.
repo sync

# Remove superfluous makefile.
rm -f Android.mk

# Compile TWRP.
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_FP5-eng
m bootimage
