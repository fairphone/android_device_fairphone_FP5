# TWRP for Fairphone 4

## Compile

Download the minimal-manifest-twrp/platform_manifest_twrp_aosp twrp-11 tree as described at https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp#readme

Add this device repository to a new local manifest (`.repo/local_manifests/FP4.xml`):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="z3ntu/android_device_fairphone_FP4" path="device/fairphone/FP4" remote="github" revision="android-11" />
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
lunch twrp_FP4-eng
m recoveryimage
```

To test it:

```
fastboot boot out/target/product/FP4/recovery.img
```

or

```
fastboot flash recovery out/target/product/FP4/recovery.img
```
