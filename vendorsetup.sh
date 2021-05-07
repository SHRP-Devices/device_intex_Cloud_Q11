#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
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
#

add_lunch_combo omni_Cloud_Q11-userdebug
add_lunch_combo omni_Cloud_Q11-eng

export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export TARGET_ARCH=arm
export OF_TARGET_DEVICES="CloudQ11,Cloud_Q11,aryan,Cloud Q11"
export TARGET_DEVICE_ALT="Cloud Q11"
export OF_USE_MAGISKBOOT=1
export OF_DEVICE_WITHOUT_PERSIST=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_PATCH_AVB20=1
export OF_QUICK_BACKUP_LIST="/data;/boot;/system"
export OF_USE_TWRP_SAR_DETECT=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
export OF_TWRP_COMPATIBILITY_MODE=1
export OF_NO_MIUI_OTA_VENDOR_BACKUP=1
export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
export OF_MAINTAINER="Aryan Karan"
export FOX_VERSION="R11.1_3"
export BUILD_2GB_VERSION=0
export LC_ALL="C"
#new
export FOX_USE_NANO_EDITOR=1
export FOX_USE_BASH_SHELL=1
export FOX_USE_TAR_BINARY=1
#torch OF_FL_PATH1 & OF_FL_PATH2
#export OF_FL_PATH1="/sys/class/flashlightdrv/dev"
export OF_DONT_KEEP_LOG_HISTORY=1
export OF_USE_LOCKSCREEN_BUTTON=1
export FOX_USE_GREP_BINARY=1
export FOX_USE_XZ_UTILS=1
