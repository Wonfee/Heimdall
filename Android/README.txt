Heimdall (c) 2010-2014 Benjamin Dobell, Glass Echidna
http://www.glassechidna.com.au/products/heimdall/

DISCLAIMER:

    This software attempts to flash your Galaxy S device. The very nature of
    flashing is dangerous. As with all flashing software, Heimdall has the
    potential to damage (brick) your device if not used carefully. If you're
    concerned, don't use this software. Flashing ROMs onto your phone may also
    void your warranty. Benjamin Dobell and Glass Echidna are not responsible
    for the result of your actions.

Flashing Firmware from Command Line:

    1. Fully charge your phone (use the wall charger as it's faster).

    2. Download a decrypted device ROM or a Heimdall Firmware Package
       and extract everything to the one directory.

    3. If the ROM is not a Heimdall Firmware Package it may instead be provided
       as multiple archives (nested or otherwise), extract them all to the same
       location.

       NOTE: If you want to use the CSC then extract it last.

    4. Put your Galaxy S device into download mode and plug it in..

    5. Open a terminal and navigate to the directory where you extracted
       the ROM/firmware files.

    6. Type the following to list all the functionality Heimdall supports:

            heimdall help

    7. Before flashing, you must first know the names of the partitions you
       wish to flash. These can be obtained by executing:

            heimdall print-pit --no-reboot

       The inclusion of --no-reboot ensures the phone will not reboot after PIT
       file has been downloaded and displayed. After executing a command with
       the --no-reboot argument, the next command should include the --resume
       argument.

       NOTE: You can still safely reboot your phone manually (with the power
             button) after executing --no-reboot commands.

    8. Use the help and print-pit output to construct a command with all the
       files you want to flash.

       Here is an example that does a full flash and repartition on a GT-I9000:

            heimdall flash --repartition --resume --pit s1_odin_20100512.pit --FACTORYFS factoryfs.rfs --CACHE cache.rfs --DBDATA dbdata.rfs --IBL+PBL boot.bin --SBL Sbl.bin --PARAM param.lfs --KERNEL zImage --MODEM modem.bin

    9. Heimdall will display the progress as it flashes so that you know things
       are working as they should.

Installing Heimdall CommandLine Tool from Source on Android system:

    1. First make sure you have installed android-ndk, download android-ndk and set ndk envrionment. 
        ex: export PATH=$NDK_ROOT/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin:$PATH
        NOTE:  this is tested with android-ndk-r8c
    
    2. Second download depended libusb-1.0 source code to jni
        cd jni && wget http://downloads.sourceforge.net/libusb/libusb-1.0.19.tar.bz2
        tar jxvf libusb-1.0.19.tar.bz2

    3. With ndk to compile Heimdall tool for android:
        ndk-build
    
    4. Install and test:
        cd ../
        adb push libs/armeabi/ /data/local/tmp/
        adb shell
        cd /data/local/tmp/
        export LD_LIBRARY_PATH=/data/local/tmp/
        ./heimdall -help
        exit
