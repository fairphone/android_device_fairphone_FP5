# TWRP for Fairphone 5

## Compile

Download the minimal-manifest-twrp/platform_manifest_twrp_aosp twrp-12.1 tree as described at https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp#readme

Add this device repository to a new local manifest (`.repo/local_manifests/roomservice.xml`):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="Fairphone/android_device_fairphone_FP5" path="device/fairphone/FP5" remote="github" revision="android-12.1" />
</manifest>
```

Then sync the sources again:

```
repo sync
```

And finally compile it:

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_FP5-eng
m bootimage
```

To test it:

```
fastboot boot out/target/product/FP5/boot.img
```
