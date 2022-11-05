LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	7zFile.c \
	7zStream.c \
	Alloc.c \
	CpuArch.c \
	LzFind.c \
	LzFindMt.c \
	LzFindOpt.c \
	LzmaDec.c \
	LzmaEnc.c \
	Util/Lzma/LzmaUtil.c \
	Threads.c

LOCAL_LDLIBS := -llog

LOCAL_CFLAGS:=-O2 -g

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE:= lzma

# LOCAL_INIT_RC := mylogger.rc

# gold in binutils 2.22 will warn about the usage of mktemp
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

include $(BUILD_EXECUTABLE)
