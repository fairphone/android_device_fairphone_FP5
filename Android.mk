# SPDX-License-Identifier: Apache-2.0
# Copyright 2021 Fairphone B.V.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),FP4)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
