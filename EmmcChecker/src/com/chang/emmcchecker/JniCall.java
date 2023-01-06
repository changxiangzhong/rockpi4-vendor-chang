package com.chang.emmcchecker;

import android.util.Log;

public class JniCall {
    static {
        Log.i("JniCall", "JniCall init");
        System.loadLibrary("emmcchecker_jni");
    }
    public JniCall() {}

    public int getSlcLife() {
        Log.v("EmmcDoctorService", "getSlcLife");
        return getSlcLife_native();
    }
    public int getMlcLife() {
        Log.v("EmmcDoctorService", "getMlcLife");
        return getMlcLife_native();
    }

    private static native int getSlcLife_native();
    private static native int getMlcLife_native();
}
