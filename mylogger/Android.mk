LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	mylogger.c

LOCAL_LDLIBS := -llog

LOCAL_CFLAGS:=-O2 -g
#LOCAL_CFLAGS+=-DLINUX

LOCAL_MODULE_TAGS := eng

# Avoiding putting it to /vendor/bin folder
# That could leads to SeLinux issue
# LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_EXECUTABLES)

LOCAL_MODULE:= mylogger

LOCAL_INIT_RC := mylogger.rc

# gold in binutils 2.22 will warn about the usage of mktemp
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

include $(BUILD_EXECUTABLE)
