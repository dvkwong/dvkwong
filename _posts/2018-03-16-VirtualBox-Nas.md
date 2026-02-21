---
title: VirtualBox Nas Headless
description: Create a VirtualBox Nas that runs headless using a raw disk vmdk file.
pubDate: 2018-03-16
categories:
  - OS
tags:
  - Virtualisation
---

```cs
VBoxManage internalcommands createrawvmdk -filename "d:\raw.vmdk" -rawdisk \\.\PhysicalDrive0
```
