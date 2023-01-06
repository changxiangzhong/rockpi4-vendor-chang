LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

#LOCAL_MODULE_TAGS := samples

# This is the target being built.
LOCAL_MODULE := libemmcchecker_jni


# All of the source files that we will compile.
LOCAL_SRC_FILES := \
  main.cpp \
  # native.cpp \
  # TVInfo.cpp \
  # TVInfo.h \
  # Vop.h \

LOCAL_SHARED_LIBRARIES := \
	libutils liblog

LOCAL_CLFAGS += -Wno-unused-parameter
# LOCAL_C_INCLUDES += \
# 	$(JNI_H_INCLUDE)

include $(BUILD_SHARED_LIBRARY)
