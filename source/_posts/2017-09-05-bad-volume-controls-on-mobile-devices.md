---
title: Bad Volume Controls on Mobile Devices
---

![](http://img0.tuicool.com/FZV7zaY.png!web)

Many of you have probably seen[yesterday's XKCD comic](http://www.androidpolice.com/2017/09/02/todays-xkcd-comic-perfectly-sums-androids-volume-problem/)about the laughably terrible state of volume controls on mobile devices. The issue is particularly bad in Android apps, and developers really need to do something about it. Quite honestly, it's embarrassing that this is still a problem in 2017.

Android has three volume sliders: Ring, Media, and Alarm. Their functions aren't hard to understand: the first is for controlling your ringtone, the second for videos and games, and the third for how rudely you wish to be awaken from your beauty sleep. We don't really need to pay any attention to Alarm; that one stays out of the way for the most part, as alarm volume isn't often changed.

It seems pretty logical that media volume should become the default in media-centric apps such as YouTube, or any app that has a video player at all. Funnily enough, the YouTube app actually does switch to media volume as the default, even when you're not playing a video. So YouTube gets that right, but it gets volume controls while buffering tragically wrong.

For some reason, YouTube opts for the ringer volume slider while a video is buffering. You'd think it'd be easy to just code the app to use media controls whenever the video player is detected as being open, but apparently, the developers at the single largest video sharing site - and one that is owned by Google, mind you - can't do it. I've spotted the same issue in the Twitter app, but not in Facebook, Chrome, or Snapchat. It's ironic how Facebook and Snapchat, two apps frequently criticized for their poor Android apps, can get this right, while YouTube, an app that seems to have new UI tweaks every week, falls flat on its face in this regard.

![](http://img1.tuicool.com/Nfia6zV.png!web)

Twitter has this problem, too.

On a related note, Google needs to implement a toggle in Android that enables you to choose media volume as the system-wide default when you press the volume buttons. Samsung's Galaxy S8 has this capability, as do ROMs like LineageOS, and it's very handy. If you don't have an S8 or LOS, an app on the Play Store called "[Rocker Locker](https://play.google.com/store/apps/details?id=com.tomwandroid.rockerlocker)" \(rhyming for the win!\) can do this as well. After all, I'd imagine that most people leave their phone on either silent or vibrate for most of the time, rendering the default ringer slider rather useless. Consider these options if you're frustrated with YouTube's current behavior and want a quick fix.

Developers at YouTube and Twitter \(and any other apps with this problem\), let's get this resolved, shall we?


Source:  http://www.androidpolice.com/2017/09/04/youtube-volume-controls-bad-feel-bad/