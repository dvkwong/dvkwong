---
title: Update Xiaomi Firmware
categories:
  - posts
tags:
  - Links  
---

[Fastboot method to update firmware](https://forum.xda-developers.com/showpost.php?p=72402783&postcount=15)

1. Go to Xiaomi [Fastboot Update Page](http://en.miui.com/a-234.html) and download latest Fastboot ROM eg latest China stable.
1. Extract the contents to disk
1. Run Terminal cd to the folder that has the firmware files, like /images for example.
1. Boot your phone to Bootloader Mode. Restart phone and hold Volume Down and Power button to boot to Fastboot.
1. Run each of these commands (or put into a batch file).
1. Copying files to Android device while in Recovery - adb push 'filename' /sdcard/Download

```cs
// Put into a batch file if on windows
fastboot flash dsp adspso.bin
fastboot flash bluetooth BTFM.bin  
fastboot flash cmnlib64 cmnlib64.mbn
fastboot flash cmnlib64bak cmnlib64.mbn
fastboot flash cmnlib cmnlib.mbn
fastboot flash cmnlibbak cmnlib.mbn
fastboot flash devcfg devcfg.mbn
fastboot flash aboot emmc_appsboot.mbn
fastboot flash abootbak emmc_appsboot.mbn
fastboot flash hyp hyp.mbn
fastboot flash hypbak hyp.mbn
fastboot flash keymaster keymaster.mbn
fastboot flash keymasterbak keymaster.mbn
fastboot flash logo logo.img
fastboot flash modem NON-HLOS.bin
fastboot flash pmic pmic.elf
fastboot flash pmicbak pmic.elf
fastboot flash rpm rpm.mbn
fastboot flash rpmbak rpm.mbn
fastboot flash splash splash.img
fastboot flash tz tz.mbn
fastboot flash tzbak tz.mbn
fastboot flash xbl xbl.elf
```