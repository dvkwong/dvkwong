---
categories:
  - OS
tags:
  - Virtual Box
  - Mac OSX
---

[MacOS in Virtualbox](https://www.soupbowl.io/2020/04/macos-in-virtualbox/)
[Youtube video](https://www.youtube.com/watch?v=32ZLGl32j6U&t=433s)

## Instructions

Run install.nsh

## Settings

```cmd
VBoxManage modifyvm "Mac OSX" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage modifyvm "Mac OSX" --cpu-profile "Intel Core i7-6700K"
VBoxManage setextradata "Mac OSX" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "Mac OSX" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Mac OSX" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "Mac OSX" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Mac OSX" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
```




