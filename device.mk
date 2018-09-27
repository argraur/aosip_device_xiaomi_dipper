#
# Copyright 2017-2018 Phh-Treble
# Copyright 2018 Google Pixel2ROM Project
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

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/dipper/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/dipper/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
	ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
	ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
	ro.build.version.release=$(PLATFORM_VERSION) \
	ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
	ro.adb.secure=0

#Huawei HiSuite (also other OEM custom programs I guess) it's of no use in AOSP builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	persist.sys.usb.config=adb

#VNDK config files
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/vndk-detect:system/bin/vndk-detect \
	device/xiaomi/dipper/vndk.rc:system/etc/init/vndk.rc

#USB Audio
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/rw-system.sh:system/bin/rw-system.sh \
	device/xiaomi/dipper/fixSPL/getSPL.arm:system/bin/getSPL

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/empty:system/phh/empty \
	device/xiaomi/dipper/phh-on-boot.sh:system/bin/phh-on-boot.sh

PRODUCT_PACKAGES += \
	treble-environ-rc

PRODUCT_PACKAGES += \
	bootctl \
	vintf

# NFC
PRODUCT_PACKAGES += \
	NfcNci \
	Tag \
	com.android.nfc_extras \
	android.hardware.nfc@1.0 \
	android.hardware.nfc@1.1:64

ifneq (,$(wildcard external/exfat))
PRODUCT_PACKAGES += \
	mkfs.exfat \
	fsck.exfat
endif

PRODUCT_PACKAGES += \
	android.hardware.wifi.hostapd-V1.0-java \
	vendor.qti.hardware.radio.am-V1.0-java \
	vendor.qti.qcril.am-V1.0-java \

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/interfaces.xml:system/etc/permissions/interfaces.xml

# Define DPI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

# NFC
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Fingerprint navigation
PRODUCT_COPY_FILES += \
        device/xiaomi/dipper/uinput-goodix.idc:system/usr/idc/uinput-goodix.idc \
        device/xiaomi/dipper/uinput-goodix.kl:system/usr/keylayout/uinput-goodix.kl

# Audio configs
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/audio_diag.cfg:system/etc/audio_diag.cfg \
	device/xiaomi/dipper/audio_effects.conf:system/etc/audio_effects.conf \
	device/xiaomi/dipper/audio_policy.conf:system/etc/audio_policy.conf

# Treble GSI (import from build/target/product/treble_common.mk)

# Split selinux policy
PRODUCT_FULL_TREBLE_OVERRIDE := true

# NFC:
#   Provide default libnfc-nci.conf file for devices that does not have one in
#   vendor/etc
#PRODUCT_COPY_FILES += \
    device/generic/common/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt

# TODO(b/78308559): includes vr_hwc into GSI before vr_hwc move to vendor
PRODUCT_PACKAGES += \
    vr_hwc
