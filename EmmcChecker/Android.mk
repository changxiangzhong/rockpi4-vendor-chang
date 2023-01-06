LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
# LOCAL_SDK_VERSION := current
LOCAL_PACKAGE_NAME := EmmcChecker
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRIVATE_PLATFORM_APIS := current
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
    $(call all-java-files-under, src) \
    $(call all-Iaidl-files-under, src)

#LOCAL_REQUIRED_MODULES += libemmcchecker_jni
LOCAL_JNI_SHARED_LIBRARIES += libemmcchecker_jni
LOCAL_PROGUARD_ENABLED := disabled
include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))

