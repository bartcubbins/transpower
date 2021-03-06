# Licensed under the LICENSE.
# Copyright 2017, Sony Mobile Communications Inc.
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := TransPowerProx
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_SRC_FILES := $(call all-java-files-under, src)
res_dirs := \
    ../common/res
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, $(res_dirs))

LOCAL_STATIC_JAVA_LIBRARIES := \
    libpower \
    libprox

ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 28),)
    LOCAL_JAVA_LIBRARIES += telephony-common
endif

LOCAL_AAPT_FLAGS := --auto-add-overlay

# proguard:
#LOCAL_PROGUARD_ENABLED := disabled
# note that proguard.flags MUST contain proguard flags
# from the common library
LOCAL_PROGUARD_FLAG_FILES := \
    proguard.flags \
    ../common/proguard.flags

include $(BUILD_PACKAGE)
