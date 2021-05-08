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

DEVICE_PATH := device/intex/Cloud_Q11

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Assert
TARGET_OTA_ASSERT_DEVICE := Cloud_Q11

# Bootloader"
TARGET_BOOTLOADER_BOARD_NAME := Intex

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8589312 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
TARGET_IS_64_BIT := false                      # true/false: Determine if the device is 64-bit or not
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_KERNEL_TAGS_OFFSET := 0x0e000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/intex/Cloud_Q11
TARGET_KERNEL_CONFIG := Cloud_Q11_defconfig
BOARD_HAS_NO_MISC_PARTITION := true

# Platform
TARGET_BOARD_PLATFORM := mt6580

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
# Set the Path of Logical Units (LUNs) for Storage below (as per your chip/device)
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 90                   # Set custom brightness, low is better
TWRP_INCLUDE_LOGCAT := true
TW_DEFAULT_LANGUAGE := en                     # Set Default Language 
TW_EXTRA_LANGUAGES := false
# Set FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab


# NOTE:
# Don't use '-' or blank spaces in flag values! 
# These will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC).
#
# NOTE-2:
# all values within these brackets: "<" ">" showing choice values and need to be 
# replaced by you with the correct values!
# Example: if the codename of your device is "gtexslte" <device-codename> becomes:
# SHRP_DEVICE_CODE := gtexslte
# (so without any brackets ofc!)

################### ############################################
# MANDATORY FLAGS # These flags HAVE TO be set/changed by you! #
################### ############################################

# Device codename
# Default (if not set): N/A
SHRP_DEVICE_CODE := Cloud_Q11

# Path of your SHRP device tree
# Replace <device-brand> with the device brand name
# (SHRP_DEVICE_CODE will expand to the above variable so check if that is correct)
SHRP_PATH := device/intex/$(SHRP_DEVICE_CODE)

# Maintainer name
# Default (if not set): N/A
SHRP_MAINTAINER := Aryan Karan

# Recovery Type (for "About" section only)
# Default (if not set): N/A
SHRP_REC_TYPE := Normal

# Device Type (for "About" section only)
# Default (if not set): N/A
SHRP_DEVICE_TYPE := A_Only

# Your device's recovery path, dont use blindly
# No default
SHRP_REC := /dev/block/platform/mtk-msdc.0/11120000.msdc0/by-name/recovery

################### ################################################################################
# IMPORTANT FLAGS # These are usually good to check - at least if the defaults are what you expect #
################### ################################################################################

# Emergency DownLoad mode (0 = no EDL mode, 1 = EDL mode available)
# Default (if not set): 0
#SHRP_EDL_MODE := 0

# internal storage path
# Default (if not set): /sdcard
SHRP_INTERNAL := /sdcard

# If your device has an external sdcard
# Default (if not set): /
SHRP_EXTERNAL := /external_sd

# USB OTG path
# Default (if not set): /
SHRP_OTG := /usb_otg

# Flashlight: (0 = disable, 1 = enable)
# Default (if not set): 0
SHRP_FLASH := 1

################## #########################################################################
# OPTIONAL FLAGS # Stuff which highly depends on your device and / or personal preferences #
################## #########################################################################

# Use this flag only if your device is A/B.
# Default (if not set) is no A/B device
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_AB := true

# SHRP padding flag (for rounded corner devices only)
# You have to change these values according to your device's roundness.
#SHRP_STATUSBAR_RIGHT_PADDING := <1-XXX>
# Default (for LEFT): 20
#SHRP_STATUSBAR_LEFT_PADDING := <1-XXX>

# For notch devices
# Default (if not set) is no notch
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_NOTCH := true

# SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock
# Default (if not set) is not using Express
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_EXPRESS := true

# SHRP Dark mode, use this flag to have dark theme set by default
# Default (if not set) is not using DARK mode
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_DARK := true

# custom led paths for flashlight
# find yours then replace the examples here
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
SHRP_FONP_2 := /sys/class/leds/led:torch_1/brightness
SHRP_FONP_3 := /sys/class/leds/led:switch/brightness

# Max brightness of flashlight
# you can also check the above led paths in Android when you turn on flashlight
SHRP_FLASH_MAX_BRIGHTNESS := 200

# Force mount system in /system despite SAR policy
# useful for maintaining backwards compatibility and/or Samsung devices
# Default (if not set) is to follow the SAR policy
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_NO_SAR_AUTOMOUNT := true

# Do not include the SHRP theming system
# Useful to save space for devices with a smaller recovery partition
# Default (if not set) is full theming support
# Set this variable when true ONLY (do not use "false" or similiar)
#SHRP_LITE := true

################################## ##############################################
# SHRP DEFAULT ADDONS - OPTIONAL # Default SHRP addon behavior - fully optional #
################################## ##############################################

# SHRP comes with a set of default addons.
# This section allows to disable some or all of them, e.g. to save a little space
# or when a device does not support / need them.

#####
# DEFAULT behavior if neither
# - SHRP_SKIP_DEFAULT_ADDON_X nor
# - INC_IN_REC_ADDON_X
# are set:
# the addon will be added to the build and saved into the internal storage
# on flashing (i.e: $(SHRP_INTERNAL)/SHRP/addons)
#
# SHRP_SKIP_DEFAULT_ADDON_X := true
# --> will not add this addon
#
# INC_IN_REC_ADDON_X := true
# --> will add this addon & store it within the recovery ramdisk (i.e. NOT in the internal storage!)
#
# If SHRP_SKIP_DEFAULT_ADDON_X is set INC_IN_REC_ADDON_X will be ignored!
#
######

# Addon - Substratum Overlay (OMS -Normal- disabler)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
#SHRP_SKIP_DEFAULT_ADDON_1 := true
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_1 := true

# Addon - Substratum Overlay (OMS -legacy- disabler)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
#SHRP_SKIP_DEFAULT_ADDON_2 := true
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_2 := true

# Addon - Clear Fingerprint (remove fingerprint lock from system)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
#SHRP_SKIP_DEFAULT_ADDON_3 := true
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_3 := true

# Addon - Force Encryption (remove force encryption from your device)
# Default (if not set) is not skipping this addon (i.e. add it)
# Ensure you understood the above note on the default behavior!
#SHRP_SKIP_DEFAULT_ADDON_4 := true
# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store this addon into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_ADDON_4 := true


# Default (if not set) is NOT adding it to the ramdisk but internal storage.
# To store magisk zip into the recovery ramdisk instead set to "true" here.
# Ensure you understood the above note on the default behavior!
INC_IN_REC_MAGISK := true

############################ #########################################################
# CUSTOM ADDONS - OPTIONAL # Custom addons! Yea fully optional but.. GREAT STUFF! :) #
############################ #########################################################

# SHRP can be extended as YOU wish! You can add whatever you can think of
# e.g patching a ROM, adding stuff, apps, there is no limit ;)
# Addons will be shown in the "Tweaks" section of SHRP.

# Custom addon folder. Do not forget to put a "/" at the end of the path!
SHRP_EXTERNAL_ADDON_PATH := "device/intex/$(SHRP_DEVICE_CODE)/addon/"

# Addon #1 - Name
SHRP_EXTERNAL_ADDON_1_NAME := "AromaFM"
# Addon #1 - Description
SHRP_EXTERNAL_ADDON_1_INFO := "A new way of seeing file manager"
# Addon #1 - Addon file name as ZIP (zip format is required)
SHRP_EXTERNAL_ADDON_1_FILENAME := "AromaFM.zip"
# Addon #1 - Free defineable button text the user need to press to actually install that addon
# (Examples: Ok, Install, Flask, Enable, Disable, etc)
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Enter AromaFM"
# Addon #1 - Text beeing shown when the installation was successful
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Done!"
# Addon #1 - Inject the addon into the recovery (if so: be sure that it will fit into the partition)
# Default (if not set) is NOT adding this addon into the recovery ramdisk. That means:
# If you do NOT set this the addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons)
# Set this variable when true ONLY (do not use "false" or similiar)
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true

# As you might already guess from the naming scheme: 
# You can add multiple custom addons (max amount is 6)!
#
# just add the above flags again and replace:
# SHRP_EXTERNAL_ADDON_1_XXXX
# with
# SHRP_EXTERNAL_ADDON_2_XXXX for the second addon
# and for the third up to the sixth change it accordingly: 
# SHRP_EXTERNAL_ADDON_3_XXXX, SHRP_EXTERNAL_ADDON_4_XXXX, SHRP_EXTERNAL_ADDON_5_XXXX, SHRP_EXTERNAL_ADDON_6_XXXX

