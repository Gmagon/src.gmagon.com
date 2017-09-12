---
title: How to Get Java on Android?
---
![](http://nerdsmagazine.com/wp-content/uploads/2013/06/Run-Android-Apps-and-Games-on-Android.jpg)
Java is technically not supported on Android, meaning that you can't run JAR files or visit websites with Java content. Luckily there are a few ways around these restrictions, depending on what you want to do. If you want to run a JAR file on your phone, you will need to gain root access and then install an emulator. If you want to view websites with Java content, you will need to use a remote desktop solution to access the sites with a desktop browser. See Step 1 below to learn how to do both.

### Method1 Emulator

[![](http://pad3.whstatic.com/images/thumb/d/d3/Get-Java-on-Android-Step-1-Version-5.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-1-Version-5.jpg.webp "Image titled Get Java on Android Step 1")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-1-Version-5.jpg)

#### **1. Root your phone.**

Since this method requires to copy file to system directory \(which is not possible without root access\), you will need to have root access on your phone. Gaining root access is referred to as "rooting" your phone. The process varies from device to device, but [this guide](http://www.wikihow.com/Root-an-Android-Phone-with-UnlockRoot-Software) will let you know how for the majority of Android devices.

* Note: A Java emulator will not let you view websites built with Java, it will only let you run JAR files. If you want to view websites built with Java, see the next section.

[![](http://pad3.whstatic.com/images/thumb/c/c0/Get-Java-on-Android-Step-2-Version-5.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-2-Version-5.jpg.webp "Image titled Get Java on Android Step 2")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-2-Version-5.jpg)

#### 2. **Find and download a Java emulator for Android.**

There are several different Java emulators available, all with strengths and weaknesses. Different emulators will work better for different devices, so it's recommended that you download a couple different emulators. These emulators are not available on the Google Play Store; the APK files will need to be downloaded from the developers' website. Some of the more popular emulators include:

* phoneME
* JBED
* JBlend
* Netmite

[![](http://pad3.whstatic.com/images/thumb/d/d0/Get-Java-on-Android-Step-3-Version-5.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-3-Version-5.jpg.webp "Image titled Get Java on Android Step 3")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-3-Version-5.jpg)

#### 3. **Install and use phoneMe.**

Download the "phoneMe Feature" APK file from the developer's website. You will also need to download the OpenIntents File Manager APK. Copy both APK files to the root directory of your Android device.

* Run the APK files to install them onto your device.
* Download JADGen on your computer, and then use it to create a JAD file for any JAR files you want to run.
* Copy both the JAR and JAD files into the same folder on your device. Make sure that the JAR file doesn't have any spaces in the filename.
* Run the file by using phoneMe and selecting the file on your device.

[![](http://pad3.whstatic.com/images/thumb/a/ad/Get-Java-on-Android-Step-4-Version-5.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-4-Version-5.jpg.webp "Image titled Get Java on Android Step 4")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-4-Version-5.jpg)

#### 4. **Install and use JBED.**

Download the JBED archive file and unzip it on your computer. Copy the APK file to the root directory on your phone, and use ADB to push the libjbedvm.so to the

/system/lib

directory. Run the APK file to install it on your device.

* You can push the libjbedvm.so file by using ADB and entering
adb push /
filelocation
/libjbedvm.so /system/lib
.
* Copy any JAR files you want to run to their own directory on your phone.
* Launch JBED and tap the "Menu" button. Navigate to the location of your JAR files and then select the JAR file you want to run.

[![](http://pad3.whstatic.com/images/thumb/f/fe/Get-Java-on-Android-Step-5-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-5-Version-3.jpg.webp "Image titled Get Java on Android Step 5")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-5-Version-3.jpg)

#### 5. **Install and use JBlend.**

Download the JBlend archive file and extract the contents. Copy the files onto your phone's storage. Install the Root Explorer application. Open Root Explorer and tap the "r/w" button in the upper corner. Copy the following files to the destination specified:

* ibDxDrmJava.so – /system/lib
* libjbmidpdy.so – /system/lib
* libjbmidp.so – /system/lib
* javax.obex.jar – /system/framework
* MetaMidpPlayer.apk – /system/app
* MidpPlayer.apk – /system/app
* Copy the JAR files that you want to run to your phone's storage. Use JBlend to select the files to load them.

[![](http://pad1.whstatic.com/images/thumb/f/f7/Get-Java-on-Android-Step-6-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-6-Version-3.jpg.webp "Image titled Get Java on Android Step 6")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-6-Version-3.jpg)

#### 6. **Install Netmite.**

Download the latest release from the Netmite website. Copy the APK file to your phone and then run it to install Netmite.

* Convert JAR/JAD files to APK files using the converter found on the Netmite website.
* Copy the converted APK file onto your phone and run it to install. Repeat this for all the JAR files that you want to run.
* Open Netmite on your phone and use it to select any of your installed JAR files.


### Method2 Remote Desktop

[![](http://pad2.whstatic.com/images/thumb/9/9f/Get-Java-on-Android-Step-7-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-7-Version-3.jpg.webp "Image titled Get Java on Android Step 7")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-7-Version-3.jpg)


#### 1.**Install the Chrome Remote Desktop app on your Android device.**

If you need to access a Java website on the go, the only way to do it is to use a remote desktop app to access another computer. This will allow you to use that computer's browser to load the website.

* Google's Chrome Remote Desktop quickly connects to Chrome on your computer, making it the most pain-free way to set up remote access.

[![](http://pad3.whstatic.com/images/thumb/0/0c/Get-Java-on-Android-Step-8-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-8-Version-3.jpg.webp "Image titled Get Java on Android Step 8")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-8-Version-3.jpg)


#### 2.**Install the Remote Desktop extension on your computer.**

You will need [Google Chrome installed on your computer](http://www.wikihow.com/Download-and-Install-Google-Chrome) to use it. The Remote Desktop extension can be installed for free from the Chrome Web Store. Click the Chrome Menu button \(☰\) and select Tools → Extensions. Click the "Get more extensions" link at the bottom of the page, and then search for "Chrome Remote Desktop".

* After installing the extension, you will need to sign in with your Google account and then click the "Enable remote connections" button.
* You can create a PIN for the connection as an extra layer of security.

[![](http://pad3.whstatic.com/images/thumb/2/2d/Get-Java-on-Android-Step-9-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-9-Version-3.jpg.webp "Image titled Get Java on Android Step 9")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-9-Version-3.jpg)

#### 3.**Launch the Remote Desktop app.**

Log in with your Google account, and then select your home computer from the list of available connections. Enter in the PIN if you created one, and after a moment your desktop will load.

[![](http://pad1.whstatic.com/images/thumb/6/64/Get-Java-on-Android-Step-10-Version-3.jpg/aid2232706-v4-728px-Get-Java-on-Android-Step-10-Version-3.jpg.webp "Image titled Get Java on Android Step 10")](http://www.wikihow.com/Get-Java-on-Android#/Image:Get-Java-on-Android-Step-10-Version-3.jpg)


#### 4. **Open the browser on your desktop.**

Use the Remote Desktop app to launch the web browser on your remote computer. Enter in the address of the Java site you want to visit like you would if you were on your computer. You may notice a delay between when you tap something and when the action occurs. This is caused by the lag between the remote computer and your phone.

Source: http://www.wikihow.com/Get-Java-on-Android



