# Copyright (C) 2024 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/unicorn/unicorn-vendor.mk)

# Inherit Firmware
$(call inherit-product-if-exists, vendor/xiaomi/firmware/unicorn/config.mk)

# Display - timers
PRODUCT_ODM_PROPERTIES += \
    ro.surface_flinger.set_idle_timer_ms?=1000 \
    ro.surface_flinger.set_touch_timer_ms?=200

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.taro.api31

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.touch_report.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/init/init.touch_report.rc \
    $(LOCAL_PATH)/rootdir/etc/init.touch_report.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.touch_report.rc

# Kernel
KERNEL_PREBUILT_DIR := $(LOCAL_PATH)-kernel

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResUnicorn \
    NfcResUnicorn \
    SettingsProviderResUnicorn \
    SettingsResUnicorn \
    SystemUIResUnicorn \
    WifiResUnicorn \
    UnicornSystemUIOverlay

# NFC
TARGET_NFC_SKU := unicorn

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.nfc.camera.pause_polling=true

# Powershare
PRODUCT_PACKAGES += \
    vendor.aospa.powershare-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.unicorn.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.unicorn.rc

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.us.proximity=true \
    ro.vendor.audio.us.proximity_waitfornegative_feature=true \
    vendor.audio.ultrasound.stoplatency=60 \
    vendor.audio.ultrasound.usync=1000 \
    ro.vendor.sensors.notifier.light_sensors=5,33171089 \
    ro.vendor.sensors.xiaomi.single_tap=true \
    ro.vendor.sensors.xiaomi.udfps=true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
