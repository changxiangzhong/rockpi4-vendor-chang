mylzma_root := $(call my-dir)
###############################################
# Compile shared library 
###############################################
LOCAL_PATH := $(mylzma_root)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-c-files-under, lzma)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_CFLAGS:=-O2 -g

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE:= libmylzma

LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

include $(BUILD_SHARED_LIBRARY) 
# To build static library use the following function
# BUILD_STATIC_LIBRARY


###############################################
# Compile executable
###############################################
LOCAL_PATH := $(mylzma_root)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := test/LzmaUtil.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES += libmylzma

LOCAL_CFLAGS:=-O2 -g

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE:= mylzma

LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

include $(BUILD_EXECUTABLE) 
