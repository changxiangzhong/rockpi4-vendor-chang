LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
# LOCAL_SDK_VERSION := current
LOCAL_PRIVATE_PLATFORM_APIS := current
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_PACKAGE_NAME := EmmcChecker
include $(BUILD_PACKAGE)
