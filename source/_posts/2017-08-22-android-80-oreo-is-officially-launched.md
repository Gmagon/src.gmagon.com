---
title: Android 8.0 Oreo Is Officially  Launched
---

_Posted By: Dave Burke, VP of Engineering_

![](http://img1.tuicool.com/jIbuea3.png!web)

After more than a year of development and months of testing by developers and early adopters \(thank you!\), we're now ready to officially launch Android 8.0 Oreo to the world. Android 8.0 brings a ton of great features such as picture-in-picture, autofill, integrated Instant Apps, Google Play Protect, faster boot time, and much more.

We're pushing the sources to Android Open Source Project \(AOSP\) for everyone to access today. Pixel and Nexus 5X/6P builds have entered carrier testing and we expect to start rolling out in phases over the next several weeks, alongside Pixel C and Nexus Player. Android Beta users will receive the update to the final version today and images are[available](https://developer.android.com/about/versions/o/download.html)to download and flash manually. We've been working closely with our partners over the last many months, and by the end of this year, hardware makers like Essential, Huawei, HTC, Kyocera, Motorola, HMD Global Home of Nokia Phones, Samsung, Sharp and Sony are scheduled to be launching or upgrading new devices to Android 8.0 Oreo.

### What's in Android Oreo?

![](https://4.bp.blogspot.com/-dkMsuB-xj7k/WZaYi4l41rI/AAAAAAAAEfM/2yXBJi8Iokk_2nUxy2NJpQr5oBQEoqVUACLcBGAs/s1600/image5.gif)

In Android 8.0 Oreo we focused on creating fluid experiences that make Android even more powerful and easy to use, such as:

* **Picture-in-picture**
  lets users manage two tasks simultaneously on any size screen, and it's
  [easy for apps to support it](https://developer.android.com/about/versions/o/android-8.0.html#opip)
  . \(Shown at right\)
* **Notification dots**
  extend the reach of notifications and offer a new way to surface activity in your apps. Dots
  [work with zero effort for most apps](https://developer.android.com/guide/topics/ui/notifiers/notifications.html#badges)
  -- we even extract the color of the dot from your icon.
* **Autofill framework**
  simplifies how users set up a new device and synchronize their passwords. Apps using form data can
  [optimize their apps for Autofill](https://developer.android.com/guide/topics/text/autofill.html)
  , and password manager apps can use the new APIs to make their services available to users in their favorite apps. Autofill will roll out fully over the next few weeks as part of an update to Google Play Services.

We also invested in Android Vitals, a project focused on optimizing battery life, startup time, graphics rendering, and stability, while giving developers better visibility over the health of their apps:

* **System optimizations**
  : We worked across the system to help apps run faster and smoother -- for example, in the runtime we added a new concurrent compacting garbage collection, code locality, and more.
* **Background limits**
  : We added new
  [limits on background location and wi-fi scans](https://developer.android.com/about/versions/o/background-location-limits.html)
  and
  [changes in the way apps run in the background](https://developer.android.com/about/versions/o/background.html)
  . These boundaries prevent unintentional overuse of battery and memory and apply to all apps -- make sure you understand and account for these in your apps.
* Complementary Android Vitals dashboards and IDE profilers:
  In the Play Console you can now see aggregate data about your app to help you
  [pinpoint common issues](https://developer.android.com/topic/performance/vitals/index.html)
  - excessive crash rate, ANR rate, frozen frames, slow rendering, excessive wakeups, and more. You'll also find new performance profilers in Android Studio 3.0, and new instrumentation in the platform.

![](https://4.bp.blogspot.com/-bWw_gTgsyeU/WXtnbTGANvI/AAAAAAAAEaY/vthXlwf2Fhs4Jvvn3VwSrm9hfsS15juRwCLcBGAs/s1600/adam-shortcut.gif)

![](http://img1.tuicool.com/RBZBR3F.gif)

In Android 8.0 your app can directly pin a specific app shortcut in the launcher to drive engagement \(left\). Notification dots keep users active in your app and let them jump directly to the app's core functions \(right\).

For developers, Android Oreo includes many new capabilities to help you build better, more efficient apps. Here are just a few:

* **Autosizing textview**
  : Use
  [autosizing TextView](https://developer.android.com/guide/topics/ui/look-and-feel/autosizing-textview.html)
  to automatically fill a TextView with text, regardless of the amount. You can create an array of preset text sizes, or set min and max sizes with a step granularity, and the text will grow and shrink to fill the available TextView space.
* **Fonts in XML:**
  [Fonts](https://developer.android.com/guide/topics/ui/look-and-feel/fonts-in-xml.html)
  are now a fully supported resource type. You can now use fonts in XML layouts and define font families in XML.
* **Downloadable fonts and emoji**
  : With
  [downloadable fonts](https://developer.android.com/guide/topics/ui/look-and-feel/downloadable-fonts.html)
  you can load fonts from a shared provider instead of including them in your APK. The provider and support library manage the download of fonts and shares them across apps. The same implementation also supports downloadable emoji, so you can get updated emoji without being limited to the emoji built into the device.
* **Adaptive icons:**
  You can now create
  [adaptive icons](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive.html)
  that the system displays in different shapes, based on a mask selected by a device manufacturer. The system also animates interactions with the icons, and uses them in the launcher, shortcuts, settings, sharing dialogs, and in the overview screen.

![](http://img1.tuicool.com/NVzyUb3.gif)

![](http://img2.tuicool.com/fyIbM3z.gif)

Adaptive icons display in a variety of shapes across different device models.

* **Shortcut pinning:**
  App shortcuts and homescreen widgets are great for engaging users and now you can let users add and
  [pin shortcuts and widgets](https://android-developers.googleblog.com/2017/07/whats-new-for-shortcuts-and-widgets-in.html)
  to the launcher from within your app. There's also a new option to add a specialized activity to help users create shortcuts. The activity is complete with custom options and confirmation.
* **Wide-gamut color for apps:**
  Imaging apps can now take full advantage of new devices that have a wide-gamut color capable display. To display wide gamut images, apps enable a flag in their manifest files \(per activity\) and load bitmaps with an embedded
  [wide color profile](https://developer.android.com/reference/android/graphics/ColorSpace.html)
  \(AdobeRGB, Pro Photo RGB, DCI-P3, etc.\).
* **WebView enhancements:**
  In Android Oreo, we've enabled WebView multiprocess mode by default and added an API to let your app
  [handle errors and crashes](https://developer.android.com/guide/webapps/managing-webview.html)
  . You can also opt in your app's WebView objects to
  [verify URLs through Google Safe Browsing](https://developer.android.com/guide/webapps/managing-webview.html#safe-browsing)
  .
* **Java 8 Language APIs and runtime optimizations:**
  Android now supports several new Java Language APIs, including the new java.time API. In addition, the Android Runtime is faster than ever before, with improvements of up to 2x on some application benchmarks.

Learn more about these and other new features by visiting the[Android 8.0 Oreo site](https://developer.android.com/about/versions/o/index.html)on[developer.android.com](https://developer.android.com/index.html). Also check out the[What's New in Android Oreo? video](https://www.youtube.com/watch?v=7kD0ZYzJbYo)for an overview of new features for developers.

### Make sure your apps are ready

If haven't already, take a few moments today to test your apps and make sure they offer the experience you want for users upgrading to Android Oreo.

Just install your current app from Google Play onto a device or[emulator](https://developer.android.com/studio/run/managing-avds.html)running Android Oreo and test the user flows. The app should run and look great, and handle the Android Oreo[behavior changes](https://developer.android.com/about/versions/o/android-8.0-changes.html)properly. In particular, pay attention to[background location limits](https://developer.android.com/about/versions/o/android-8.0-changes.html#abll),[notification channels](https://developer.android.com/guide/topics/ui/notifiers/notifications.html#ManageChannels), and changes in[networking](https://developer.android.com/about/versions/o/android-8.0-changes.html#networking-all),[security](https://developer.android.com/about/versions/o/android-8.0-changes.html#security-all), and[identifiers](https://developer.android.com/about/versions/o/android-8.0-changes.html#privacy-all).

Once you've resolved any issues, publish your app updates to Google Play in your alpha, beta, or production channels so that they're available as users start to receive Android 8.0 Oreo.

### Speed your development with Android Studio

When you're ready to build with new APIs in Android Oreo, we recommend updating to the latest version ofAndroid Studio 3.0, available for download from the[beta channel](https://developer.android.com/studio/preview/index.html). Aside from improved app[performance profiling tools](https://developer.android.com/studio/preview/features/android-profiler.html), support for the[Kotlin programming language](http://android-developers.googleblog.com/2017/05/android-announces-support-for-kotlin.html), and Gradle build optimizations, Android Studio 3.0 makes it easier to develop withInstant Apps,[XML Fonts](https://developer.android.com/guide/topics/ui/look-and-feel/fonts-in-xml.html),[downloadable fonts](https://developer.android.com/guide/topics/ui/look-and-feel/downloadable-fonts.html), and[adaptive icons](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive.html).

![](http://img1.tuicool.com/nA7bAfz.png!web)

Android Studio 3.0 includes tools for developing with Android Oreo features, such as previewing XML font resources in your app.

We also recommend updating to the[Android Support Library 26.0.2](https://developer.android.com/topic/libraries/support-library/revisions.html?utm_campaign=android_launch_npreview_061516&utm_source=anddev&utm_medium=blog), available now from[Google's Maven repository](https://developer.android.com/studio/build/dependencies.html#google-maven), and to the latest SDK, tools, and emulator system images, available in the SDK Manager.

If you're just getting started building for Android Oreo, read the[migration guide](https://developer.android.com/about/versions/o/migration.html#bfa)first. It gives you an overview of the process and the configuration changes you'll need to make.

To compile against the official Android 8.0 APIs, update your project's`compileSdkVersion`to API 26. We also recommend updating your app's`targetSdkVersion`to API 26 to opt-in and test your app with Android Oreo specific[behavior changes](https://developer.android.com/about/versions/o/behavior-changes.html?utm_campaign=android_launch_npreview_061516&utm_source=anddev&utm_medium=blog). See the[migration guide](https://developer.android.com/about/versions/o/migration.html#bfa)for details on how to set up your environment to build with Android Oreo.

### Publish your updates to Google Play

Google Play is open for apps compiled against or targeting API 26. When you're ready, you can publish your APK updates in your alpha, beta, or production channels.

Make sure that your updated app runs well on Android Oreo as well as older versions. We recommend using[Google Play's beta testing feature](https://developer.android.com/distribute/engage/beta.html?utm_campaign=android_launch_npreview_061516&utm_source=anddev&utm_medium=blog)to get early feedback from a small group of users, then do a staged rollout. We're looking forward to seeing your app updates!

### What's next for Android Oreo?

We'll soon be closing the Developer Preview issue tracker, but please keep the feedback coming! You can[file a new issue](https://issuetracker.google.com/issues/new?component=190923&template=841312)against Android 8.0 in the AOSP issue tracker.

Thanks again to the many developers and early adopters who participated in the Android O Developer Preview and public beta. You gave us great feedback, and filed hundreds of issues that helped us to make the Android Oreo platform great for consumers and developers.



Source: [https://android-developers.googleblog.com/2017/08/introducing-android-8-ore](http://www.tuicool.com/articles/hit/eIvuQzJ)

