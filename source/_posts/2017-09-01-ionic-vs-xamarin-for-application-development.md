---
title: Ionic vs Xamarin for Application Development
---

![](https://www.simform.com/wp-content/uploads/2017/07/Xamarin-vs-ionic.png)

**What is Ionic?**

A standard definition would say:

“It is a front-end framework for developing hybrid mobile apps in HTML5.”

But Ionic is not “just” a framework, Ionic allows you to:

* Generate Icons and splash screens for all devices with a single command: ionic resources which Saves at least a day of image preparing in various sizes.
* Instantly reflect code changes, even when you are running directly on your device or emulator.
* Build and test iOS and Android application side-by-side and see changes instantly
* Share your ionic apps with clients, customers, and testers all around the world without even going through the App/play store
* Easily access the full native functionality of the device using ng-Cordova.

Also, Ionic now supports a full stack Backend services and tools for Deployment, Analytics, Push notifications, etc. Ionic has a command line interface which uses Cordova in the Backend and allows you to build apps for iOS and Android.

Prerequisites to getting started with Ionic: Working knowledge of JavaScript is required.

**Major parts of Ionic framework:**

* Powerful HTML5 SDK
* CSS/Sass
* AngularJS
* Ionic CLI
* Native wrapper like Cordova/Phonegap

**Development environments for Ionic:**

* MacOSX
* Windows
* Linux

**Getting started with development:**

* For Mac OSX: Use command line
* For Windows: Make sure to download Git for Windows, and optionally console2

**Note:**

* In order to run Cordova, you need to have Node.js installed
* Familiarity with Angular as a front end framework is extremely helpful in building Ionic applications.

Ionic framework also comes with the Ionic creator, a great tool that helps in quick user interface prototyping. To create an interface using Ionic creator, you need to sign-up on their website and choose your application name.

Creating an interface using this tool is similar to working on any prototyping tool, e.g. Balsamiq. Here you can create elements, add aesthetics to them. It can later be exported as a template to build an actual application.

To go from the template to mockups, Ionic offers three options: Ionic CLI, Zip file, and Raw HTML. You can choose whatever feels best for your needs.

**What is Xamarin?**

Xamarin is a cross-platform development framework, which allows you to build iOS, Android and Mac apps using C\#. Xamarin aims directly at the.NET developers. It uses C\# language and.NET framework.

Performance could be a major issue when it comes to Non-Native applications, but Xamarin has the ability to leverage hardware acceleration to boost the performance unlike other Hybrid platforms including Ionic. Last year, we ran experiments to measure the[computing performance of Native vs cross-platforms applications](https://www.simform.com/native-vs-cross-platform-development/)and the results were staggering.

Anyways, so Xamarin is pretty much intended for .NET people, if that’s what you have, it makes sense to go forward with Xamarin. Xamarin apps have a full range of API access to add different functionality to your app.

Xamarin apps are built with native interface controls, so their look and feel is very close to Native.

There are three major parts of Xamarin ecosystem:

* Xamarin development ecosystem which mainly provides a set of runtime engines, Native APIs access, Native user-interface and Native code base to develop Native and cross-platform applications.

* Xamarin test cloud: It provides an online testing cloud that automates your app testing on thousands of real devices in the cloud. Xamarin has embedded around 2000 real devices in the cloud to ease the testing process.

* Xamarin Insights – Xamarin recently joined with Hockey app to bring you the monitoring service that tracks crashes and exceptions, and helps developers know in real time what’s happening with real users.

Xamarin supports all the major platforms including Android, iOS and Windows and they offer a Native like development environment to build the applications. These development platforms are:

**1.Xamarin.Android**–  A development environment to build Xamarin apps with Android. Unlike the Native development, here you work in C\# instead of Java.  You can define your UI in activities, similar to the Native development.  Xamarin provides runtime and binding together, to make it all work.

**2. Xamarin.iOS**–  It uses \#C instead of Objective-C or Swift to develop the app. The runtime environment is similar to Native iOS development, so developers need to code in \#C and Xamarin takes care of the build by using Objective-C wrappers to make the codes compatible with Ios platform.

**3. Xamarin.Forms**– With Xamarin forms, you can build true cross-platforms which work with all the platforms .i.e. Android, iOS, and Windows. The codes and business UI can be shared across all the platforms, in an otherwise, you had to create separate UI layers and code base for each platform.

**Xamarin Technology Stack**

![](https://www.simform.com/wp-content/uploads/2017/07/Xamarin-Stack-768x351.png)

How does the development environment look like for various Operating systems:

* Mac: Xamarin Studio for iOS and Android; Windows not supported
* Windows: Visual Studio for iOS, Android, and Windows

## **1. Xamarin vs Ionic developers in Numbers**

According to the latest developer survey done by StackOverflow. These are the statistics:

![](http://www.simform.com/wp-content/uploads/2017/07/numberofdevs-1.png)

C\# lags 8.5% behind javascript when it comes to market demand.

Angular.Js and Cordova developers are available in abundance when you compare it with the total number of Xamarin developers.

A simple search on Github shows 13k repositories for Xamarin, and staggering 30k repositories for Ionic.

It’s matter of the fact that  Xamarin claims that they passed[1 million unique developers](https://blog.xamarin.com/xamarin-passes-1-million-developer-milestone/) mark in 2015, but it doesn’t reflects well on Github.

## **2. User experience of Ionic vs Xamarin**

### **UI implementation challenges in Ionic**

UI implementations in Ionic are a bit challenging, and often very non-standardized. Last year Apple started rejecting apps that were using UIWebBrowserView. Now, many thought this was a completely random step in doing so, but Apple suggests public UIWebView to developers.

Think of UIWebView as something that’s meant to support websites, not apps. So, basically, they end up accessing internal hierarchy of UIWebView when they use UIWebBrowserView, which also means that Ionic is often digging into private implementation details in order to whatever they want.

This takes the minor cross platform offense to something that’s a bit hacker life, not app store safe.

But, if it’s very simple to avoid, then people could have done it?

Getting back to our original discussion around UX related issues “have you ever seen an auto fill inside an app?” Never, right? Basically, when you don’t offend Apple, you end up offending some of your users:

![](https://www.simform.com/wp-content/uploads/2017/07/autofill-2.png)

Designers, who love the prototyping tools and the extra control over the design process of  the application, prefer Ionic creator. Ionic creator is also more collaborative in onboarding everyone who is associated with the project- from stakeholders to designers and developers.

You can create wireframes or add custom themes without requiring any understanding of the underlying code.

Ionic 2 also has them-ing, which means that your apps won’t look the same as all other applications. Changing defaults is easy on Ionic, often the best apps on Ionic are fully customized.

As far as theme-ing goes, Ionic has three different modes to apply following different themes on your platforms: iOS style theme, Windows Phone style themes, and Material design style theme.

For anything that doesn’t falls into iOS, Android and Windows phone, the default selection of theme would be “material design”.

On the other hand- For UI Implementations  in Xamarin, one has to know the platform specific SDKs, components, usage and architectural concepts. For someone works with .NET will face a little difficulty but any C\# developer can easily build a shared library and implement the business logic with UI.

Anyways, let’s have a look at  some UI/UX, which are necessary to be included:

* Custom transitions between screens – Extremely smooth in case of Xamarin, Ionic performs less
* Animations similar to material design
* Percentage/constraint based layouts
* UI responsiveness
* Availability of collections of reusable elements

### **Default booting time**

The default booting time in Ionic is not great, Xamarin apps on the other hand launches pretty quickly. Usually to compensate the booting time in Ionic, developers do the following:

1. Delay the splash screen launch with a plugin. The plugin dismiss the launch screen after the app has fully initialized.

2. Using Navigation controllers to handle the custom animations.

3. Use a livereload tool to create a default back state, even after the saved-in memory history is lost.

The purpose here is to reduce the booting time, which becomes a hindrance in development process as well as, when users use the app.

### **Responsive design**

In Ionic 1 if you setup simple image sliders,[the sliders initially aren’t responsive](https://github.com/driftyco/ionic/issues/7616), until the pane containing application is manually nudged.  But, In Xamarin\( Xamarin native and Xamarin.Forms\) it is easy to create responsive designs.

Secondly, Implementing animations and transitions in Ionic is not as smooth as it should be,  [Xamarin on the other hand offers](https://forums.xamarin.com/discussion/18818/custom-page-transitions-with-xamarin-forms) smooth much better working animations and transitions. Moreover they also support custom animations.

Speaking of Animations, Ionic won’t be an ideal choice for building games or Graphically complex applications. There aren’t much tools available to support high intensive graphics or highly interactive transitions. But, by Using material design components, you can build custom or strange animations in Xamarin applications.

## **3. OS version support and backwards compatibility**

Ionic Currently supports:

* iOS7+
* Android 4.1+
* Progressive web apps

Although Ionic reports 4.1+ supported, but there has been some cases of a broken experiences for 4.2 and other[versions below 4.4](https://forum.ionicframework.com/t/minimum-android-version-supported-by-ionicv2/54164).

Ionic 2 specifically supports Android 4.4 and up, no support for any versions below that.

Xamarin on the other hand supports:

* Everything from Android 1.0+\(Base\) to Android 7.1\(Nougat\)
* With Xamarin.Forms, Xamarin only provides support for
[OS versions greate](https://developer.xamarin.com/guides/xamarin-forms/getting-started/installation/#Target_Platforms)
r than Android 4.0.3; iOS 6.1 or newer
* Xamarin.iOS provides same day support for iOS. Any updates that are reflected in new iOS release are updated on the same day when it comes to Xamarin.iOS
* There are couple of
[iOS 9 compatibility issues](https://developer.xamarin.com/guides/ios/platform_features/ios9/)
: Apps developed for iOS 8 or earlier show some issues as they sometimes don’t launch properly on 32-bit devices.

Also, developers often face P/invoke path failed. These two are the most faced issues with developers, however, they can be dealt with re-building the app with stable release of the application.

* Xamarin has
no support to build progressive web apps
.

## **4. Nightmode availability**

Xamarin applications can be build for Night Mode feature, but as of now Ionic doesn’t provide any similar support.

Although, some may confuse it with the app going into sleep mode, while in background. So, just for information, there is Cordava plugin which can be integrated with Ionic to enable the sleep mode feature. For Xamarin, sleep mode is officially embedded in their platform.

## **5. Consulting and development partner network**

Xamarin has a good network of[technical](https://www.xamarin.com/technical-partners) and[consulting partners](https://www.xamarin.com/consulting-partners) for the businesses who are inclined towards building Hybrid or Native applications.  As of now, Ionic has a very limited set of development partners which is around 50, where Xamarin has around 250 partners worldwide.

## **6. Mobile device management with Ionic and Xamarin**

Xamarin has a better mobile device management suite for enterprises than Ionic. Xamarin apps can be easily integrated with Microsoft Intune services for organizations dealing with BYOD devices.

For Ionic, Microsoft had launched a Cordova plugin, which can be use with Ionic apps to manage enterprise devices remotely.

## **7. Realm for Xamarin vs Ionic**

For the developers, who are more serious about the performance of the applications, use a custom and single API to compose advance queries and modeling complex data. Realm is one such tool to do so.

Ionic has[no official support by Realm](https://github.com/realm/realm-js/issues/261), but they have[built a Realm database with an API](https://news.realm.io/news/introducing-realm-xamarin/) support, which can be used by Xamarin apps.

## **8. Firebase for Xamarin vs Ionic**

Firebase has a really[nice support for Ionic apps](https://www.airpair.com/angularjs/posts/build-a-real-time-hybrid-app-with-ionic-firebase), but for[Xamarin there are a couple of wrappers available in Objective-C but no real support](https://github.com/xamarin/XamarinComponents/issues/29). Apart from Firebase, there are some MBaaS vendors like Microsoft Azure, IBM Bluemix and Kinvey, who provides support for Xamarin platform to build highly available and scalable apps in cloud.

## **9. Integration with existing enterprise architecture: Xamarin vs Ionic**

Xamarin can be leveraged to use the existing .NET libraries to interact with the web and other data services while sharing the C\# code and business logic across both client and server.

But, Ionic can only be integrated with existing back-end technologies like Node.Js, Express.Js or Ruby on Rails . If there are any subtle difference in the overall architecture, things can get messy as there won’t be any shared code-base. Nonetheless, familiarity with Angular.Js would drastically impact the rapid development and integration.

Angular supports all the possible architecture .i.e. MVC, MVVM, MVW etc, so you can expect a smoother integration but be prepared to spend huge time.

### **Compatibility with SAP**

Both Xamarin and Ionic are easily integrable with SAP, with Xamarin being more compatible due to their hybrid approach with C\# and.NET framework.

## **10. Availability and Integration with third party SDKs**

![](https://www.simform.com/wp-content/uploads/2017/07/SDK.png)

## **11. Code Reusability and Technology Limitations**

![](https://www.simform.com/wp-content/uploads/2017/07/Platforms.png)

On the limitations part, Xamarin.iOS doesn’t complies ahead of time, so the developers don’t have the same level of control over the code that executes on iOS.

Also, when you use Xamarin, you lose the ability to share the code with your HTML5 app team.On the limitations part, Xamarin.iOS doesn’t comply ahead of time, so the developers don’t have the same level of control over the code that executes on iOS.

Ionic on the other hand is extremely compatible with code sharing with other HTML5 platforms.

For someone who utilized.NET APIs to increase the functionality, the chances are that not everything is available for the Xamarin.IOS.

Here’s a list of the available assemblies:

[https://developer.xamarin.com/guides/cross-platform/advanced/available-assemblies/](https://developer.xamarin.com/guides/cross-platform/advanced/available-assemblies/)

## **12. Size of Application: Xamarin vs Ionic**

Xamarin based mobile applications are extremely large when it comes to app size. For enterprise dedicated mobile devices, it may be extremely easy to incorporate these applications, but when it comes to BYOD, especially with users having limited space on their mobile, a large sized app may create performance issues.

Ionic apps on the other hand are extremely lightweight.  Even though, some people confuse the folder size with App size\([like this guy](https://forum.ionicframework.com/t/app-size-is-too-big/19448/13)\), so keep in mind that when you actually compile the app, it boils down to few Mbs.  If it doesn’t, then you can do the following:

* Compress the images using tinypng or something similar.
* Reduce the server side dependencies like Database and server request etc.
* Minimize the CSS file along with updating the index file.

## **13. IoT integration**

Xamarin can be integrated with Azure IoT easily, as Xamarin uses Microsoft’s IoT and Cloud capabilities. On the other hand, there is no Integration of[nRF’s hardware development kit with](https://forum.ionicframework.com/t/ionic-2-with-iot/86021)[Ionic](https://forum.ionicframework.com/t/ionic-2-with-iot/86021).

But, Ionic apps can be integrated with wireless sensors, ibeacons or bluetooth devices for simple use-cases. Femto CTO, Alex  Albino used Ionic along with Cordova plugins to create an interface for hardwares over Bluetooth smart. You can check their[codes on Github](https://github.com/femtoduino/imuduino-btle).

While we agree that these are tiny glimpse, but there are endless possibilities on what could be built on Ionic’s speed to market capabilities.

## **14. Battery life, best practices guidelines**

Xamarin has nice guidelines on how to improve performance and decrease battery consumption by a mobile application.  Ionic on the other hand makes it very difficult for us to[optimize battery consumption](https://forum.ionicframework.com/t/battery-optimization/33621/2).

## **15. Continuous Integration with Xamarin**

[Continuous integration with Xamarin](https://developer.xamarin.com/guides/cross-platform/ci/) can be done using:

* TFS with Xamarin
* TeamCity with Xamarin
* Jenkins with Xamarin

Subsequently,[Continuous integration with Ionic](http://blog.samuelbrown.io/2015/10/20/continuous-delivery-with-ionic-ios-and-travisci/)can be done using:

* BitBucket Pipelines
* Jenkins CI
* Travis CI,
* Greenhouse CI

## **16. Compliances Xamarin vs Ionic**

Industries have strong compliances in place like for:

Healthcare- Patient Protection and Affordable Care Act \(PPACA\)

Federal-  Office of Federal Contract Compliance Programs \(OFCCP\)

Finance-  Data Protection Act, SEPA\(single euro payment area\)

Energy-  Federal Energy Regulatory Commission \(FERC\)

Manufacturing- FDA, EPA and SEC etc.

Xamarin applications can be build to imply these regulations despite the industry and their policies. Furthermore, Microsoft’s cloud data-centers are available in 36 regions worldwide, which is assuring for enterprises, who are dealing with these compliances globally.

We can not say the same for Ionic, but it definitely depends on the skills of the developers, you’re working with.

## **17. Testing and Debugging for Xamarin vs Ionic**

Xamarin Studio and Xamarin’s Visual Studio extensions include advanced debugging tools that work across the full spectrum of supported platforms and environments. Developers can perform interactive debugging on an app that is running in the Android emulator, the iOS simulator, or even directly on hardware.

Xamarin’s debugger supports breakpoints, catchpoints, watch expressions, stepping, and inspecting threads and local variables. It also supports advanced debugging features, such as conditional breakpoints and an interactive REPL

### **Xamarin test cloud**:

In contrast to manual testing and simulator-only testing, Xamarin Test Cloud lets teams test every feature on more than a thousand devices and on every commit. Catching bugs before released shortens development cycles and allows more time for innovation.

Xamarin test cloud has –

* 2,000+ real devices
* Write automated testing scripts using C\# or Ruby
* Detailed reports are available: Track results, Trend analysis
* Integrate Xamarin with Hockey app to leverage in house app store for beta testers. Crash reports are also available for Android, iOS, Mac and Windows apps. Report provides meaningful stack traces with friendly class names, methods, and accurate line numbers.

### **Xamarin’s model for mobile quality**:

– Complete test coverage

– Comprehensive device testing

– Fast troubleshooting – screenshots and graphical reports

– Accelerated cycles with Continuous integration

– Comprehensive support for all native and hybrid apps

### **Test automation with Xamarin**

Xamarin’s UITest and Calabash frameworks enable powerful automated UI testing. Developers write tests that behaves as users do, performing taps, swipes, rotations, and waiting for UI elements to appear. These test results are available within minutes, and they include everything from feature testing to comprehensive regression tests for complete coverage and a fault free application deployment.

Scripts written are flexible to any UI change that may happen in design and development, as opposed to other available OCR solutions that frequently break when UI changes are introduced.

These scripts/tests are written in C\# in Xamarin Studio or VS, , or in Ruby using Calabash, the industry’s most powerful framework for automated testing of native and hybrid apps.

Xamarin’s test cloud has one of the world’s largest collection of iOS and Android devices\(2000 real devices\) and allows you to select testing devices by market share, OEM, form factor and even the OS version

### **Ionic – Testing and quality approaches**

Ionic is missing code quality options and various workflows that are needed by enterprises when building an app in a CI/CD environment. For Deploying the apps to the app store, Ionic supports tools like Fastlane.

Ionic doesn’t offer any cloud testing offerings, you can test your app in simulators, mobile browsers or by using Apple’s testing services through Apple developer account.

## **18. App Analytics and reporting: Xamarin vs Ionic**

Xamarin have built-in Insight tool for easy analytics and crash reporting solution that enables fast discovery, troubleshooting, and resolution of issues for live users. It’s a proactive method for monitoring and maintaining apps that significantly increases user satisfaction since problems can be resolved before they impact users..

Although, Ionic doesn’t have any analytics dashboard, but you can still integrate your app with third party MBaaS tools like Firebase for real-time analytics and reporting.

## **Conclusion**

Ionic and the updated Ionic 2.0 is a rapidly growing Framework which does offer many features and but has some drawbacks since it’s not matured enough for enterprises.

Where, Xamarin offers everything from Development platform, test cloud, app Insights to an eminent Microsoft Integration for a truly scalable application for your business.

Source: https://www.simform.com/xamarin-vs-ionic-application-development/

