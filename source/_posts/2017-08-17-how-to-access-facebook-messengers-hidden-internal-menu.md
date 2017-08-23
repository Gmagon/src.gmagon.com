---
title: How to Access Facebook Messenger’s Hidden Internal Menu
---

The hidden internal menu in Facebook Messenger is used by developers at Facebook to modify some aspects of the application during testing. It normally cannot be opened by users because the hidden menu activity does not have a direct way to accessed within the app. However, if your device has root access then it’s possible to enter this internal menu to play around with some of the hidden development/debugging tools used by Facebook engineers. Previously, accessing the internal menu could be used to[disable the Messenger Day](https://www.xda-developers.com/disable-facebook-messenger-day-android/), though Facebook realized people were doing this and hence disabled the ability to turn off Messenger Day.

![](http://img0.tuicool.com/Vju6rmZ.png!web)

Error message when attempting to disable Messenger Day in “MobileConfig”

Still, there are other aspects of the application not located within MobileConfig that we can play around with. We will show you how to access this menu so you can take a look at what can be changed, and we will also give a few examples of some things you can do in Facebook Messenger’s internal menu.

You will need to either have the Android Debug Bridge \(ADB\) or a terminal application installed on your device such as[Termux](https://play.google.com/store/apps/details?id=com.termux&hl=en)to continue. If using ADB, you need to enable USB debugging on your phone. To do so, open Settings then navigate to “About Phone” and repeatedly tap on the build number until it tells says you are a developer. Press the back button and you will now have “Developer options” in the Settings list. Scroll down and enable USB debugging.

![](http://img2.tuicool.com/i63uMvj.png!web)

Build number

![](http://img1.tuicool.com/ZjEBZvu.png!web)

USB Debugging

This guide requires root.You can get root by either flashingMagisk orSuperSUafter unlocking your device’s bootloader. If you device is unrooted, you can instead usethis modified APKfrom XDA-Memberevilwombatwhich lets you access the internal menu right within the app. But, doing so requires you to uninstall any existing Facebook apps you have installed and to instead use_all_of the modified Facebook apps from the same developer if you want to use more than just Messenger.

### Using adb

Download adb, either “[Minimal ADB & Fastboot](https://forum.xda-developers.com/showthread.php?t=2317790)” right here on XDA, or theofficial binaries released by Google. Extract them and in the folder containing adb, hold shift + right click within the folder and click “Open command window here”. Connect your phone to your PC and grant debugging access.

Next, type the following commands in the command prompt.

```
adb
 shell
```

```
su
```

Grant superuser access when prompted.

```
am
 start -n 
"com.facebook.orca/com.facebook.messaging.internalprefs.MessengerInternalPreferenceActivity"
```

Then scroll down below.

### Using terminal

Open the terminal app of your choosing. I use[Termux](https://play.google.com/store/apps/details?id=com.termux&hl=en), but anything that can access the terminal will work fine. Next type the following commands.

```
su
```

Grant superuser access when prompted.

```
am
 start -n 
"com.facebook.orca/com.facebook.messaging.internalprefs.MessengerInternalPreferenceActivity"
```

## Enabling Facebook Messenger’s Internal Menu Permanently

After doing the commands, the “internal menu” should show which looks like the menu below.

![](http://img0.tuicool.com/IBnIjyN.png!web)

Scroll down to “Gatekeeper Override.” Tap that and in the following menu tap “search gatekeepers”. Type “**internal**” \(without quotes\) and tap the field which says “messenger\_internal\_prefs\_android”. It should change to say YES.

![](http://img2.tuicool.com/AVbq6fr.png!web)

Gatekeeper Override

![](http://img1.tuicool.com/73YFzu.png!web)

Internal

![](http://img0.tuicool.com/QjIrIfF.png!web)

messenger\_internal\_prefs\_android

That’s it! Now the menu is permanently accessible for you, located here in the screenshot below.

![](http://img0.tuicool.com/bYFnYzq.png!web)

### Explanation

We use adb or the terminal to start the`MessengerInternalPreferenceActivity`which is the hidden internal menu activity. We then edit the application settings from within the internal menu to permanently display a menu item to access that activity. The reason we require root access is that this activity is an unexported activity defined in the AndroidManifest of the Facebook Messenger application. Unexported activities require elevated permissions to launch them, but once we launch it we can then enable it from within the menu.

## Example Features of the Messenger Internal Menu

### Crashes

If for whatever reason you want to cause the app to crash \(maybe you’re testing some system edits you made\), the internal menu contains 4 crash types under “**Performance and Profiling.**”

![](http://img2.tuicool.com/mimyEje.png!web)

### Language

If you want to choose your language yourself in Facebook Messenger, under “**Subsystems**” in the root of the internal menu is an option to change the application language to any that you want.

![](http://img0.tuicool.com/fqIveev.png!web)

### Always enabled chat heads

When you open Facebook Messenger, your currently opened chat heads disappear. If you wish to have chat heads available even when already using Facebook Messenger, you can enable “**Don’t hide over messenger**” located under features.

![](http://img0.tuicool.com/yIzuInI.png!web)

And that’s it! Have a poke through the settings, see if you can find something within Facebook Messenger and let us know in the comments below if you do!



Source: [https://www.xda-developers.com/facebook-messenger-internal-menu/](http://www.tuicool.com/articles/hit/ua2EjmV)

