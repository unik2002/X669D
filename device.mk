#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/infinix/X669D

# A/B Support & Virtual A/B
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true

# Inherit Virtual A/B launch with vendor ramdisk (Critical for vendor_boot devices)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# A/B OTA Postinstall Configuration
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Boot Control HAL (Merged & De-duplicated)
# Using 1.2 as it is standard for newer Unisoc A/B devices
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.0-service \
    vendor.sprd.hardware.boot@1.2-impl \
    vendor.sprd.hardware.boot@1.2-impl.recovery \
    bootctrl \
    bootctrl.recovery \
    bootctrl.ums9230

#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
   # bootctrl.ums9230 \
    #libgptutils \
    #libz \
    #libcutils

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    libhealthd.$(PRODUCT_PLATFORM)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Update Engine & Essential Tools
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client \
    bootctrl.ums9230

# API Levels & VNDK
PRODUCT_TARGET_VNDK_VERSION := 33
PRODUCT_SHIPPING_API_LEVEL := 32

# TWRP Kernel Modules Loading
# This script automatically picks up modules from the recovery root
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/recovery/root/lib/modules)\")
