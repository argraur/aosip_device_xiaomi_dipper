#
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

# Inherit some common aosip stuff
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# Inherit common AOSP configuration
$(call inherit-product, device/xiaomi/dipper/aosp_dipper.mk)

# Device identifiers
PRODUCT_NAME := aosip_dipper
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := MI 8
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_RELEASE_NAME := dipper

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=dipper \
	PRIVATE_BUILD_DESC="dipper-user 8.1.0 OPM1.171019.011 V9.5.11.0.OEACNFA release-keys"

BUILD_FINGERPRINT := "Xiaomi/dipper/dipper:8.1.0/OPM1.171019.011/V9.5.11.0.OEACNFA:user/release-keys"