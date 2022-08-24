#########################################################
# Smart Tube Next
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := SmartTube
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := smarttube_stable.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED

# LOCAL_PRIVILEGED_MODULE = true
# LOCAL_MODULE_PATH := $(TARGET_OUT_DATA)
# LOCAL_OVERRIDES_PACKAGES := Home Launcher2  Launcher3

LOCAL_MODULE_SUFFIX :=  $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
