LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := torchdemo

LOCAL_C_INCLUDES += ../../install/include

LOCAL_SRC_FILES := torchdemo.cpp

LOCAL_LDLIBS :=  -L ../../install/libs/armeabi-v7a  #-lnnx -limage  -lTHNN -ltorch  -lTH -lluaT -lluajit -ltorchandroid -llog -landroid

LOCAL_SHARED_LIBRARIES := libnnx libimage libTHNN libtorch libTH libluaT liburajit libtorchandroid liblog libandroid libnnpack libnnpack_ukernels

include $(BUILD_SHARED_LIBRARY)
