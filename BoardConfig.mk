#
# Copyright 2018 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

# VNDK
BOARD_VNDK_VERSION := current

# Properties
TARGET_SYSTEM_PROP := build/make/target/board/treble_system.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Bootloader, kernel and recovery are not part of generic AOSP image
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

# system.img is always ext4 with sparse option
# GSI also includes make_f2fs to support userdata parition in f2fs
# for some devices
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_USES_MKE2FS := true

# Generic AOSP image always requires separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

# Android generic system image always create metadata partition
BOARD_USES_METADATA_PARTITION := true

# Generic AOSP image does NOT support HWC1
TARGET_USES_HWC2 := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/wake_gesture"

# Set emulator framebuffer display device buffer count to 3
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# VBMETA should be never used in Treble GSI
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Dipper properties
TARGET_SYSTEM_PROP := device/xiaomi/dipper/system.prop $(TARGET_SYSTEM_PROP)

# SEPolicy Private
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/dipper/sepolicy/private

# bdroid configuration
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/dipper/bluetooth

TARGET_EXFAT_DRIVER := exfat

# System image size
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472

#SELINUX_IGNORE_NEVERALLOWS := true
