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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := treble-environ-rc
LOCAL_MODULE_TAGS := optional
LOCAL_POST_INSTALL_CMD := \
	mkdir -p $(PRODUCT_OUT)/system/etc/init/ && \
	sed -e 's?%BOOTCLASSPATH%?$(PRODUCT_BOOTCLASSPATH)?g' device/xiaomi/dipper/init.treble-environ.rc > $(PRODUCT_OUT)/system/etc/init/init.treble-environ.rc && \
	sed -i -e 's?%SYSTEMSERVERCLASSPATH%?$(PRODUCT_SYSTEM_SERVER_CLASSPATH)?g' $(PRODUCT_OUT)/system/etc/init/init.treble-environ.rc
include $(BUILD_PHONY_PACKAGE)

ifneq ($(filter dipper, $(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
