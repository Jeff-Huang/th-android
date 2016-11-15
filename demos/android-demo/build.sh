android update project --path .
ndk-build V=1
if [ $? -ne 0 ]; then
    exit
fi
rm -rf assets/lua
cp -r ../../install/share/lua assets/
cp -r ../../install/libs/armeabi-v7a/*.so libs/armeabi-v7a/
#rm libs/armeabi-v7a/libpng16.so
#cp ../../install/libs/armeabi-v7a/libpng16.so.16.20.0 libs/armeabi-v7a/libpng16.so
#cp ../../install/libs/armeabi-v7a/libpng16.so.16.20.0 libs/armeabi-v7a/libpng16.so.16
ant debug
if [ $? -ne 0 ]; then
    exit
fi
adb install -r bin/TorchDemo-debug.apk
if [ $? -ne 0 ]; then
    exit
fi
