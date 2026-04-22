#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from Infinix-X669D device
$(call inherit-product, device/infinix/Infinix-X669D/device.mk)

PRODUCT_DEVICE := Infinix-X669D
PRODUCT_NAME := omni_Infinix-X669D
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X669D
PRODUCT_MANUFACTURER := infinix

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="X669D-user 12 SP1A.210812.016 89 release-keys"

BUILD_FINGERPRINT := Infinix/X669D-GL/Infinix-X669D:12/SP1A.210812.016/GL-20250207V440:user/release-keys
