# SPDX-License-Identifier: Apache-2.0
# Copyright 2019 The Android Open Source Project
# Copyright 2021 Fairphone B.V.

PRODUCT_PLATFORM := lahaina

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := FP5
PRODUCT_NAME := twrp_FP5
PRODUCT_BRAND := Fairphone
PRODUCT_MODEL := Fairphone 5
PRODUCT_MANUFACTURER := Fairphone

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM).recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# FBE
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe
