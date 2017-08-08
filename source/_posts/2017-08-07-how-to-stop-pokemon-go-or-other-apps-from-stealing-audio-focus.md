---
title: How to Stop Pokemon Go (or other apps) From Stealing Audio Focus
---

Despite dwindling in popularity,[Pokemon Go](https://play.google.com/store/apps/details?id=com.nianticlabs.pokemongo)still has a[ton of fans](https://www.reddit.com/r/pokemongo/)playing the game every day. Although most of the game’s issues have beenrelated to cheating, there are other, more minor ones that annoy existing users. One such issue is related to audio focus in Android. Users who like to listen to music or podcasts when playing Pokemon Go find that audio playback immediately halts when they launch the game. This requires users to manually restart playback on their favorite media app such as Google Play Music, Spotify, or PocketCasts. Today, I’m going to show you how to stop Pokemon Go \(or any other app\) from stealing permanent audio focus – **without root**.

What happens when Pokemon Go launches is that it requests audio focus from the system, meaning any existing media playback over the same volume stream will be[ducked](https://en.wikipedia.org/wiki/Ducking). The issue here is that Android’s audio focus relies on an honor system among applications. Android does not pick and choose which applications should be prioritized to hold focus, instead it relies on applications requesting and releasing focus as needed. Thus, because Pokemon Go requests audio focus when it launches, other applications can’t stop it from taking over the media volume.

Some applications such as[Poweramp](https://play.google.com/store/apps/details?id=com.maxmpz.audioplayer)or[Podcast Addict](https://play.google.com/store/apps/details?id=com.bambuna.podcastaddict)have experimental settings to hold on to audio focus to prevent other apps from stealing it away, but obviously many media applications out there do not. Some users have come up with their own way to retain audio focus through the use ofTasker profiles, which is something I likely would have tried if there wasn’t a better way – but thankfully there is. It involves the use of a hidden ADB command to access the command line interface for Android’s permission management system known as appops. With a single command, you can stop Pokemon Go \(or any other app\) from taking audio focus ever again!

The method we are using here is aimed at stock, unrooted users who are not running any sort of custom ROM. Custom ROM users, such as those on LineageOS, may have access to a more powerful permission control method that lets them bypass the need for this command.

## Stop Pokemon Go from Taking Audio Focus – Tutorial

1. Download then install USB drivers for your
   [device](https://developer.android.com/studio/run/oem-usb.html)
    – most likely only necessary if on Windows.
2. Download the ADB binary for your OS and extract the file to any folder on your PC.
3. On your phone, open Settings then find the “About Phone” option.
4. Scroll down to find the “Build Number” value and tap on it 7 times, enabling Developer Mode.
5. Back to the main menu in Settings, enter Developer Options.
6. Enable USB Debugging Mode here, as shown below.
   ![](http://img1.tuicool.com/Y7fU7j.jpg!web)
7. Plug your phone into your PC and on your phone change the USB mode from “charge only” mode to “file transfer \(MTP\)” mode.
8. Back to the PC, navigate to where you extracted the ADB binary.
   ![](http://img0.tuicool.com/AbeuAvU.png!web)
9. Open a Command Prompt in this ADB directory. On Windows, the easiest method to do this is to press Shift+Right-click. In the context menu, choose the “open command window here” option. Mac or Linux users, open a Terminal.
   ![](http://img1.tuicool.com/zauqQrQ.png!web)
10. Enter the following command: 
    `adb devices`
11. This will start the ADB daemon. If this is your first time running ADB, you will see a prompt asking you to authorize a connection. Allow it.
    ![](http://img1.tuicool.com/yA3Eben.jpg!web)
12. Re-run the command from step 10 and you’ll see the serial number of your device in the output. If so, move on to the next step. If not, re-install your drivers.
13. \(
    _Optional_
    \): if you want to restrict an app other than Pokemon Go from having audio focus, then install the
    [App Inspector](https://play.google.com/store/apps/details?id=com.ubqsoft.sec01)
     app and find the package listed under the app’s name.
14. Send the following command:
    `adb shell`
15. Then execute this command:
    `cmd appops set `
    `<`
    `package`
    `>`
    ` TAKE_AUDIO_FOCUS ignore`
    ![](http://img2.tuicool.com/vyEVFbe.png!web)
    Example: Command used for Pokemon Go

16. As long as you don’t get an error message in the window, it should have worked. Congratulations! Now Pokemon Go won’t stop Google Play Music, Spotify, PocketCasts, or any other app from playing on top of it!

## Explanation

As mentioned at the beginning, we are using the command line to interface with appops, which is Android’s user-facing system for handling app permissions. By default, there are only a handful of permissions that users can toggle by default through the Settings UI. Certain custom ROMs \(such as LineageOS with its Privacy Guard\) expose more permissions you can restrict, but for unrooted users the only way to handle these permissions is through the command line.

Anyways, the particular permission we are restricting is android.permission.TAKE\_AUDIO\_FOCUS which any application that requests it in their AndroidManifest.xml file is granted automatically upon installation. Thanks to the above appops command, we can take away this permission from Pokemon Go, meaning it can no longer request audio focus and thus can no longer stop other music or podcast apps on your phone from playing.

Although the tutorial above is aimed at Pokemon Go users, technically you can do the same thing for any other app also. Just modify the name of the package in step \#15 with whatever other app you want. Just be careful you don’t go around restricting this permission all willy nilly, because Google intentionally hid this permission from being restricted so users wouldn’t mess things up.

See other great tutorials like this in ourtutorials category. Stay up to date on the latest news with theXDA Labs application.



Source: [https://www.xda-developers.com/pokemon-go-audio-focus/](http://www.tuicool.com/articles/hit/nAJF32F)

