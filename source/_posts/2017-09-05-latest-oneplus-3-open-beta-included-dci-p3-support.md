---
title: Latest OnePlus 3 Open Beta Included DCI-P3 Support
---

OnePlus in the last few hours released OxygenOS Open Beta 23/14 for theOnePlus 3 andOnePlus 3T. There were a number of UX related changes, updated security patches and some other minor optimisations which you can check outhere. However, it appears there are some undocumented changes too, namely relating to DCI-P3.

After speaking with recognised developerJoshuous, he pointed out the addition of DCI-P3 within the new open beta kernel source. It specifically references the panel in the OnePlus 3, the s6e3fa3. With his help, I looked through the synchronised codes on the OnePlus Github and confirmed the existence of display calibration values for DCI-P3 on the OnePlus 3. He also pointed out the addition of a “OnePlus mode” and some night mode changes.

![](http://img0.tuicool.com/eqYbqmN.png!web)

A commit from the latest Open Beta kernel source, showing a new “OnePlus mode”

As can be seen above, OnePlus mode and night mode are new display parameters. After some testing, OnePlus mode is simply the name for their new default calibration, while night mode is simply just the standard night mode within OxygenOS.

However, to those unfamiliar with DCI-P3, it is the same colour gamut widely used in 4K TVs. It was originally featured on the OnePlus 5 as a user-facing feature, which made people turn their attention to the 3 and 3T. The files to enable it were found on the OnePlus 3T, but the OnePlus 3 could not make use of it because the panel is different.[The OnePlus 3T could make use of it though](https://www.xda-developers.com/enable-oneplus5-dci-p3-color-mode-oneplus3t/), as it has the same panel as the OnePlus 5 \(thought as we found, it wasn’t clear whether the calibration was the exact same\).**If you have root access**, you can enable this mode on your OnePlus 3T already. Simply write a value of “1” to the following file.

`/sys/devices/virtual/graphics/fb0/DCI_P3`

Or run the following command in a**superuser-granted terminal**.

`echo "1" > /sys/devices/virtual/graphics/fb0/DCI_P3`

OnePlus 3 users can use this mode too! Do the exact same steps as above and it will work. To early OnePlus 3T adopters who could not use DCI-P3 initially, you should also be able to use this mode. The first batches of the OnePlus 3T shipped with the same panel as the OnePlus 3, while later batches shipped with the new panel which OnePlus supported with DCI-P3. Give it a try!

As for the rest, hopefully, we’ll see these changes in the stable branch of Oxygen OS within the next few weeks or months. The touch latency fixes were released in April of 2017 in the OxygenOS Open Beta but only released in the stable branch on the 22nd of August,**4 months after.**We hope that at the very least the DCI-P3 changes will be added to the next stable release, even if not via a user-facing setting. You can view the other kernel changes[here](https://github.com/OnePlusOSS/android_kernel_oneplus_msm8996/commit/66576d80ee7e31adb098c077584620add879ce99)if you’re interested!


Source:  https://www.xda-developers.com/oneplus-dci-p3-oneplus-3-oxygenos-beta/