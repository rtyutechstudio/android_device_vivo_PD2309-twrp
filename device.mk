# Copyright (C) 2026 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/vivo/PD2309

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
AB_OTA_UPDATER := true
TARGET_IS_VAB := true
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Update Engine & Update Verifier 
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

PRODUCT_PACKAGES += \
    bootctrl.mt6989 \
    bootctrl.mt6989.recovery

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd


# Additional Libraries
#TARGET_RECOVERY_DEVICE_MODULES += \
#    libkeymaster4 \
#    libkeymaster41 \
#    libpuresoftkeymasterdevice

#RECOVERY_LIBRARY_SOURCE_FILES += \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so
