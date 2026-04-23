#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/X669D

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit common TWRP configuration (Matches the TWRP build environment)
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from the device-specific makefile
$(call inherit-product, device/infinix/X669D/device.mk)

# Device Identity
PRODUCT_DEVICE := X669D
PRODUCT_NAME := twrp_X669D
PRODUCT_BRAND := infinix
PRODUCT_MODEL := infinix X669D
PRODUCT_MANUFACTURER := infinix
PRODUCT_RELEASE_NAME := infinix infinix X669D

# Client ID for Transsion/Infinix
PRODUCT_GMS_CLIENTID_BASE := android-transsion

# Build Properties Overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="X669D-user 12 SP1A.210812.016 89 release-keys"

# Using the more recent fingerprint (2025 version)
BUILD_FINGERPRINT := Infinix/X669D-GL/Infinix-X669D:12/SP1A.210812.016/GL-20250207V440:user/release-keys
