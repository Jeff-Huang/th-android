##########################################
## Torch-7 for Android                  ##
##########################################
Torch7 provides a Matlab-like environment for state-of-the-art machine
learning algorithms. It is easy to use and provides a very efficient
implementation, thanks to an easy and fast scripting language (Lua) and a
underlying C implementation.

Modified to be compiled and used with Android

Features
--------
* Loading of lua packages from the apk directly.
* This is done by writing a custom package.loader
  Reference: http://www.lua.org/manual/5.1/manual.html#pdf-package.loaders
  The loader is in torchandroid.cpp as loader_android
* torchandroid.h and torchandroid.cpp give lots of helper functions to make life easier
  * Print function overriden to redirect to logcat (only handles strings for now)
  * Function to get apk assets as bytes (very useful)
* Full support for ffi and shared libraries

`torch.load` now takes three additional modes: `apkbinary32`, `apkbinary64`, `apkascii`. One can store model files in the `assets` folder and use these modes to load them. If the model was saved on a 64-bit machine, use `apkbinary64`, if it was saved on a 32-bit machine, use `apkbinary32`.


Requirements
------------
For CUDA-enabled version: NVIDIA CodeWorks for Android: https://developer.nvidia.com/codeworks-android.
For CPU-only version : Android NDK and Android SDK

Samples
--------
* Three sample projects has been provided in demos/
* demos/android-demo/jni/torchdemo.cpp is a simple use-case
* demos/android-demo/assets/main.lua is the file that is run
* demos/android-demo-cifar showcases classifying Camera inputs (or images from gallery) into one of 10 CIFAR-10 categories.
* Vinayak Ghokale from e-lab Purdue (https://github.com/e-lab) contributed a face detector demo, which showcases a fuller use-case (demos/facedetector_e-lab ).

Building Torch-Android Libraries and Java class. 
--------------
If on ubuntu, install the following packages: `sudo apt-get install libx32gcc-4.8-dev libc6-dev-i386`
Default is to build with CUDA - so make sure you installed NVIDIA CodeWorks for Android and its nvcc is in your PATH.
Otherwise, set WITH_CUDA=OFF in build.sh

0. git submodule update --init --recursive
1. Optionally, open build.sh and modify ARCH (to match your device architecture) and WITH_CUDA variables.
2. run build script:
3 ./build.sh 

You can use torch in your android apps. The relevant directories are
* install/include - include directories
* install/lib - static libs cross-compiled for armeabi-v7a
* install/share/lua - lua files


Building Example
----------------
1. Build Torch-Android atleast once using the steps above.
2. [Optional] Connect your android phone in debugging mode,
              to automatically install the apk.
3. Change directory into demos/android-demo folder.
4. Run build script.
$ ./build.sh
5. Run the app TorchDemo on your phone.
