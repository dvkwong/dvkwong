---
categories:
    - Firmware
tags:
    - Lineage
toc: true    
---


## Adb / Fastboot


[Lineage install instructions](https://wiki.lineageos.org/devices/land/install)

> Note Fastboot does not like usb 3 ports always use usb 2.0 or even better a usb 2.0 hub

```bash
fastboot flash recovery twrp.img

# Display anti rollback (arb) version
fastboot getvar all
```

## Redmi Note 5 whyred

[Everything About Anti Roll-back [Whyred]](https://forum.xda-developers.com/t/everything-about-anti-roll-back-whyred.3816219/)

* lineage-18.1-20221024-recovery-whyred.img - Works!
* twrp-3.2.3-0-whyred.img - Works!

> Requires latest firware to use newer versions!



```bash
fastboot flash antirbpass dummy.img

fastboot flash recovery twrp.img

fastboot reboot

fastboot boot twrp.img
```
