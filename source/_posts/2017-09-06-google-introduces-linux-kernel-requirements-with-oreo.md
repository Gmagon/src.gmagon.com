---
title: Google is introducing Linux kernel requirements with Android Oreo
---

![](https://betanews.com/wp-content/uploads/2017/09/android-oreo-security-fixed.jpg)

Android may be a Linux-based operating system, but the Linux roots are something that few people pay much mind. Regardless of whether it is known or acknowledged by many people, the fact remains that Android is rooted in software regarded as horrendously difficult to use and most-readily associated with the geekier computer users, but also renowned for its security.

As is easy to tell by comparing versions of Android from different handset manufacturers, developers are -- broadly speaking -- free to do whatever they want with Android, but with Oreo, one aspect of this is changing. Google is introducing a new requirement that OEMs must meet certain requirements when choosing the Linux kernel they use.

Until now, as pointed out by [XDA Developers](https://www.xda-developers.com/google-mandating-linux-kernel-versions-android-oreo/), OEMs have been free to use whatever Linux kernel they wanted to create their own version of Android. Of course, their builds still had to pass Google's other tests, but the kernel number itself was not an issue. Moving forward, Android devices running Oreo must use at least kernel 3.18, but there are more specific requirements to meet as well.

Google explains on the [Android Source](https://source.android.com/devices/architecture/kernel/modular-kernels#core-kernel-requirements) page:

> Android O mandates a minimum kernel version and kernel configuration and checks them both in VTS as well as during an OTA. Android device kernels must enable the kernel .config support along with the option to read the kernel configuration at runtime through procfs.

The company goes on to detail the Linux kernel version requirements:

* All SoCs productized in 2017 must launch with kernel 4.4 or newer.
* All other SoCs launching new Android devices running Android O must use kernel 3.18 or newer.
* Regardless of launch date, all SoCs with device launches on Android O remain subject to kernel changes required to enable Treble.
* Older Android devices released prior to Android O but that will be upgraded to Android O can continue to use their original base kernel version if desired.

The main reason for introducing the Linux kernel mandate is security -- and it's hard to argue with that.

Source: https://betanews.com/2017/09/03/android-oreo-linux-kernel/



