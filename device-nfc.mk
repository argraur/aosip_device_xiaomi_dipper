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

# Define TARGET_USES_NQ_NFC
TARGET_USES_NQ_NFC := true

# Nfc config
# This file is used to pick up NFC stuff
# If TARGET_USES_NQ_NFC = true, pick NQNfc
# If TARGET_USES_NQ_NFC = false or null, pick AOSP Nfc

# Some packages are common for both
# SE
PRODUCT_PACKAGES += SecureElement

# Tag
PRODUCT_PACKAGES += Tag

# NFC Extras
PRODUCT_PACKAGES += com.android.nfc_extras

# Main service
PRODUCT_PACKAGES += NQNfcNci

# Main static libraries
PRODUCT_PACKAGES += \
        libnqnfc-nci \
        libnqnfc_nci_jni \
        libnqp61-jcop-kit

# Main HALs
PRODUCT_PACKAGES += \
        android.hardware.nfc@1.0 \
        android.hardware.nfc@1.1:64 \
        vendor.nxp.hardware.nfc@1.0 \
        vendor.nxp.nxpese@1.0 \
        vendor.nxp.nxpnfc@1.0

# Main shared library
PRODUCT_PACKAGES += com.nxp.nfc.nq

# Main NFC configurations
PRODUCT_PACKAGES += \
        libnfc-nci.conf \
        libnfc-nci_NCI2_0.conf