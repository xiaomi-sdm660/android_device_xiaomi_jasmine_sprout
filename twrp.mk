ifeq ($(BUILD_TWRP),true)

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp

# TWRP specific build flags
TW_THEME := portrait_hdpi
BOARD_HAS_NO_REAL_SDCARD := true
TW_MAX_BRIGHTNESS := 100
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INCLUDE_NTFS_3G := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0 bootctrl.sdm660 android.hardware.boot@1.0-impl android.hardware.boot@1.0-service android.hardware.keymaster@3.0-service-qti libgptutils
TW_RECOVERY_ADDITIONAL_RELINK_FILES := ${OUT_DIR}/target/product/jasmine_sprout/system/lib64/android.hardware.boot@1.0.so
TW_RECOVERY_ADDITIONAL_RELINK_FILES += ${OUT_DIR}/target/product/jasmine_sprout/vendor/bin/hw/android.hardware.boot@1.0-service
TW_RECOVERY_ADDITIONAL_RELINK_FILES += ${OUT_DIR}/target/product/jasmine_sprout/vendor/bin/hw/android.hardware.keymaster@3.0-service-qti
TW_SCREEN_BLANK_ON_BOOT := true


# Security Patch Hack to prevent Anti Rollback
BOARD_SUPPRESS_SECURE_ERASE := true

ALLOW_MISSING_DEPENDENCIES := true

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true

# Crypto
TW_INCLUDE_CRYPTO := false


# A/B partition device flags
#TARGET_NO_KERNEL := false
#TARGET_NO_RECOVERY := true
#BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_UPDATER := true
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
#TW_HAS_EDL_MODE := true

PRODUCT_COPY_FILES += \
    vendor/xiaomi/sdm660-common/proprietary/vendor/lib64/libdiag.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libdiag.so \
    vendor/xiaomi/sdm660-common/proprietary/vendor/lib64/libtime_genoff.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libtime_genoff.so \
    vendor/xiaomi/sdm660-common/proprietary/vendor/lib64/libidl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libidl.so \
    vendor/xiaomi/wayne/proprietary/vendor/firmware/dbmd4_va_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/dbmd4_va_fw.bin \
    vendor/xiaomi/wayne/proprietary/vendor/firmware/tas2557_uCDSP.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/tas2557_uCDSP.bin \
    vendor/xiaomi/wayne/proprietary/vendor/lib64/libssd.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libssd.so \
    ${OUT_DIR}/target/product/jasmine_sprout/vendor/lib64/hw/bootctrl.sdm660.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/bootctrl.sdm660.so \
    ${OUT_DIR}/target/product/jasmine_sprout/vendor/lib64/hw/android.hardware.boot@1.0-impl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/android.hardware.boot@1.0-impl.so \
    ${OUT_DIR}/target/product/jasmine_sprout/vendor/lib64/libgptutils.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libgptutils.so
endif
