include build/make/target/board/generic_arm64_a/BoardConfig.mk

TARGET_SYSTEM_PROP := device/xiaomi/dipper/system.prop $(TARGET_SYSTEM_PROP)
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/dipper/bluetooth
TARGET_EXFAT_DRIVER := exfat

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
