###############################################
# The whole project is copied from Lzma projec
# This make file is writte by Chang
# 
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	   Asm/arm64/LzmaDecOpt.S \
       C/7zFile.c \
       C/7zStream.c \
       C/Alloc.c \
       C/CpuArch.c \
       C/LzFind.c \
       C/LzFindMt.c \
       C/LzFindOpt.c \
       C/LzmaDec.c \
       C/LzmaEnc.c \
       C/Util/Lzma/LzmaUtil.c \
       C/Threads.c 

LOCAL_LDLIBS := -llog

LOCAL_CFLAGS:=-O2 -g

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE:= lzma

# LOCAL_INIT_RC := mylogger.rc

# gold in binutils 2.22 will warn about the usage of mktemp
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

include $(BUILD_EXECUTABLE)
