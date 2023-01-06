#define LOG_TAG "EMMC_CHECKER_JNI"
#include <utils/Log.h>
#include <stdio.h>
#include "jni.h"
#include <math.h>
#include <fcntl.h>
#include <errno.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define EMMC_LIFE_TIME      "/sys/class/mmc_host/mmc1/mmc1:0001/life_time"

static int get_life_time(int* mlc, int* slc) {
    int fd;
    char char_line[10];
    int ret = 0;
    if (!mlc) {
        ALOGE("get_life_time() failed. mlc == 0");
        return -EFAULT;
    }
    if (!slc) {
        ALOGE("get_life_time() failed. slc == 0");
        return -EFAULT;
    }
    if ((fd = open(EMMC_LIFE_TIME, O_RDONLY)) == -1) {
        ALOGI("failed to open emmc_reg file. Error %s", strerror(errno));
        return -EFAULT;
    }

    memset(char_line, 0, sizeof(char_line));

    if ((ret = read(fd, char_line, sizeof(char_line)) < 0)) {
        ALOGE("get_life_time() failed when reading device file with error %s", strerror(errno));
        goto failure_handling;
    } else if (ret != 0) { // Error
        ALOGE("get_life_time() failed. read() return %d, with error %s", ret, strerror(errno));
        ALOGI("get_life_time(), device_file = %s\n", char_line);
        goto failure_handling;
    }
    char* left_over;
    *mlc = (int)strtol(char_line, &left_over, 0);
    *slc = (int)strtol(left_over, NULL, 0);
    ALOGI("emmc_doc_device_get_life_time(), mlc = %d, slc = %d\n", *mlc, *slc);
    return 0;

failure_handling:
    *mlc = 0;
    *slc = 0;
    return -EFAULT;
}

static int get_slc() {
    int slc, mlc;
    get_life_time(&mlc, &slc);
    return slc;
}

static int get_mlc() {
    int slc, mlc;
    get_life_time(&mlc, &slc);
    return mlc;
}

/*
 * Register several native methods for one class.
 */
static int registerNativeMethods(JNIEnv *env, const char *className,
        JNINativeMethod *gMethods, int numMethods) {
    jclass clazz;

    clazz = env->FindClass(className);
    if (clazz == NULL)
    {
        ALOGE("Native registration unable to find class '%s'", className);
        return JNI_FALSE;
    }
    if (env->RegisterNatives(clazz, gMethods, numMethods) < 0)
    {
        ALOGE("RegisterNatives failed for '%s'", className);
        return JNI_FALSE;
    }

    return JNI_TRUE;
}

static const char *class_path_name = "com/chang/emmcchecker/JniCall";
static JNINativeMethod methods[] = {
    {"getSlcLife_native", "()I", (void*)get_slc},
    {"getMlcLife_native", "()I", (void*)get_mlc},
};

static int registerNatives(JNIEnv *env) {
    if (!registerNativeMethods(
                env, 
                class_path_name,
                methods, 
                sizeof(methods) / sizeof(methods[0])
                )) {
        return JNI_FALSE;
    }

    return JNI_TRUE;
}

typedef union {
    JNIEnv *env;
    void *venv;
} UnionJNIEnvToVoid;

jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    jint result = -1;
    JNIEnv *env = NULL;
    UnionJNIEnvToVoid uenv;
    uenv.venv = NULL;

    ALOGI("JNI_OnLoad()");

    if (vm->GetEnv(&uenv.venv, JNI_VERSION_1_4) != JNI_OK) {
        ALOGE("ERROR: GetEnv failed");
        goto bail;
    }
    env = uenv.env;

    if (registerNatives(env) != JNI_TRUE) {
        ALOGE("ERROR: registerNatives failed");
        goto bail;
    }

    result = JNI_VERSION_1_4;
bail:
    return result;
}
