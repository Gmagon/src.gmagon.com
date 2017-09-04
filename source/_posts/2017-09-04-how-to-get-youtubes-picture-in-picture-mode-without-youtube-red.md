---
title: How to get YouTube's Picture-in-Picture mode without YouTube Red
---

![](http://img1.tuicool.com/J73iy2Z.png!web)

One of Android Oreo's best features is Picture-in-Picture mode for phones and tablets. When you press the home button while playing media \(on an app that supports PiP\), the video collapses to a floating window that you can move around the screen. YouTube is one of the few apps that support this feature already, but[it's only enabled if you pay for YouTube Red](http://www.androidpolice.com/2017/08/29/youtubes-picture-picture-mode-oreo-available-paying-red-customers-five-countries-thats-problem/). If YouTube Red isn't available in your country, or you just don't want to pay for it, we'll show you how to force the app to use PiP.

This guide is slightly long because everything is explained in detail, not because it's hard. This should take less than 10 minutes for everyone, and once you finish it, you won't have to do it again \(unless you re-install the Custom Navigation Bar app\).

## Prerequisites

Before getting started, let's go over what you need. Your phone or tablet has to be running Android 8.0 or higher, and you'll need a USB cable to connect your phone/tablet to your computer. If you don't already have the ADB command-line utility installed on your computer, you'll have to download that first.

Even though[Google now offers ADB downloads from its website](http://www.androidpolice.com/2017/01/05/google-makes-adb-fastboot-platform-tools-available-without-full-sdk-android-studio-download/), you still have to manually add it to your system path. For that reason, I still recommend using a 3rd-party ADB installer, like[this one](https://forum.xda-developers.com/showthread.php?t=2588979)for Windows. If you're using Mac or Ubuntu Linux, you can try[the installer I made](https://github.com/corbindavenport/nexus-tools).

You'll also need to turn on ADB Debugging, if you haven't already. On Android Oreo, open the Settings app, tap System near the bottom, tap About Phone, and keep tapping the Build Number at the bottom until you get a popup saying you're a developer. Once you do that, press Back, tap the new Developer Options item, and set 'USB debugging' to On.

If your device is rooted, you can skip installing ADB.

## Installing Custom Navigation Bar

The next step is to download Custom Navigation Bar[from the Play Store](https://play.google.com/store/apps/details?id=xyz.paphonb.systemuituner), or[from APKMirror](https://www.apkmirror.com/apk/paphonb/custom-navigation-bar/). This app was made to give Android 7.0/7.1 users the customizable navigation bar that the Android O Previews had, but we'll use it to add a Picture-in-Picture button to our device.

Once it's installed on your phone or tablet, open it and start going through the setup process. At some point, you'll be asked to run an ADB command on your computer \(if you have root, you can just give the app root permissions and skip this section\). Go ahead and plug your device into your computer, if it wasn't connected already.

On Windows, press the Windows key and R at the same time, type "cmd" in the text box \(without the quotes\), and press Enter. On Mac, search for Terminal with Spotlight and open it. If you're on Linux, you probably already know where the terminal app is.

The screenshots in this post will be from Windows, but the ADB commands work exactly the same across all operating systems.

Now that you have the Command Prompt/Terminal open with your Android device connected, type "adb devices" \(without the quotes\) and press Enter. This will search for connected Android devices. If you get an alert on your phone/tablet about allowing USB debugging, press 'Always allow from this computer' and tap OK.

![](http://img0.tuicool.com/UZjINfA.png!web)

If you see anything under 'List of devices attached,' it means you're on the right track. In the above screenshot, you can see my Google Pixel is properly connected. Now you just have to give the Custom Navigation Bar app the proper permissions it needs. Type in "adb shell" \(without the quotes\) and press Enter. Then type "pm grant xyz.paphonb.systemuituner android.permission.WRITE\_SECURE\_SETTINGS" \(without the quotes\) and press Enter. Now you should be able to complete the app setup on your phone or tablet.

## Adding the Picture-in-Picture button

Now it's time to add a Picture-in-Picture toggle to the navigation bar. Open the Custom Navigation Bar app and press 'Navigation Bar.' Under 'Extra right button' \(or 'Extra left button', if you want the button on the left\), tap 'Type' and select 'Keycode.' Then tap on 'Keycode,' and pick 'Window' from the long list of options. It should be near the bottom.

![](http://img1.tuicool.com/6FbQB3u.png!web)![](http://img1.tuicool.com/fQzmqi6.png!web)![](http://img1.tuicool.com/m2eQZn2.png!web)

If you want to set an Icon for the PiP button, you can tap 'Icon' and choose whatever you like. If you don't set an icon, you'll just have to tap the empty space on the right \(or left, if you chose left\) side of the navigation bar to toggle PiP.


Source: http://www.androidpolice.com/2017/09/03/tutorial-get-youtubes-picture-picture-mode-without-youtube-red/

