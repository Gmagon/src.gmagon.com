---
title: Improve your app's performance on portable devices
---

![](https://www.simform.com/wp-content/uploads/2017/08/progress-graph.png)

Last year, I was on my flight returning back from London, I was traveling with a mobility Industry practitioner. He has worked with really big firms from last 20 years helping enterprises adopt technologies.

While we had a great good 8 hours of flight together, he highlighted something that I have been thinking a lot lately. Not only he thought mobile apps and performance were just about continuous delivery, he, in fact, couldn’t audit any mobile application that significantly improves the performance.



When I landed in San Francisco, I reached out to more people and learned everyone had the similar assumptions. Code quality and basic architecture were the only things that people were talking about.

I immediately thought of how we approach [building apps](https://www.simform.com/product-engineering-services/) at [Simform](http://www.simform.com/) and saw some clearly [outstanding practices](https://www.linkedin.com/pulse/my-6-steps-formula-enhance-any-app-performance-purvak-pathak?published=t) that we follow to build benchmark breaking apps that scale to billions.

The following would drastically impact the quality of your mobile application:

* Application size
* Application performance
* Platform-specific guidelines
* Architecture design

Now, let’s see how you can optimize each of them to make your application faster in simple, easy to follow steps.

## Minimize the application size

Mobile phones aren’t powerful GPUs, yet! Also, do you know that most of the Android market share is consumed by low-end configuration mobile phones? Some of them don’t even support 2G or 3G, even downloading your huge application in a momental need would be a nightmare for the app’s users. The less your app consumes space on such constrained phones, the better.

![](https://www.simform.com/wp-content/uploads/2017/08/App-and-size-768x384.png)  
Optimize networking

Text first, image second

To optimize networking, try to load textual data first. Image based content present in your application can then be loaded as the second preference, asynchronously.

Avoid duplicate network requests

Those who are familiar with [Volley](https://developer.android.com/training/volley/index.html%20rel=) in Android will know a lot about this. When poorly implemented that android app using Volley can send two requests to the server at the same time, you might delete an item, it will get deleted, but your app would say, no such item exists. Not only just the functionality, but duplicated requests increase system congestion and decrease app’s performance, especially when you have a million app users. Imagine increasing the number of requests to your server increased by 2 folds when you are extremely desperate to optimize these costs.

Understand and adjust based on connection quality

Think about an app that adjusts everything based upon the network quality available. Your app can change the content quality delivered based upon what network conditions a user is present in to make sure that the app’s usage doesn’t fall through.

Effective API design

The way an API has been designed has a huge impact on how it impacts app’s performances. An incomplete or lazily designed API can be a burden on the mobile application. Workarounds on [APIs](https://www.simform.com/android-app-developers-top-api/) usually put too much pressure on the network limitations.

When designing the API payloads of your mobile app ensure that you have:

* Consistency: The developer should know that expect, leaving no space for least astonishment.
* Completeness: Having reduced workarounds

![](https://www.simform.com/wp-content/uploads/2017/08/img-1-768x384.png)

## Optimize images in your application

To optimize images in your application, you can:

* Use vector images
* Serve dynamic image sizes
* Apply color filters as opposed to using different sets of colored images
* Use image caching
* Use libraries like Picasso and Fresco

## Cache data to optimize for offline

When your network is weak, display whatever data you have, while fetching required data. Doing so will:

* Reduce your server load
* Reduce the number of your mobile phone’s radio usage, improving your app’s battery life

If you don’t have a testing team at your disposal, try switching your phone into the airplane mode and test your app for offline performance.

## Make sure you optimize your app for screen size as well

A lot has been spoken about the screen sizes, Android raises some really big concerns here as there are literally thousands of devices, each with their own resolution and screen size.

As a rule of thumb:

* Build for small and medium screens
* Optimize for MDPI and HDPI
* Implement adaptive UI flows

![](https://www.simform.com/wp-content/uploads/2017/08/android-fragmentation.png)

Don’t have a 100’s of devices to test the screen size and resolution? Test with emulator configurations.

## Memory usage in Android

In order to provide mobile users with the ability to multitask, Android sets limits to how much RAM is available to an application. These limits are not static and change as the mobile usage increases or decreases.

Considering RAM limitations throughout app development, and apps that are running in the background can hog unnecessary resources.

But, you can optimize your app by:

* Limiting the lifespan of services, consider using intent service to limit the lifespan
* Release UI resources when users move to a different UI
* Utilize memory efficient code constructs
* Minimize the use of external libraries

## How fast does your app launches?

Do you know that for average top 25 apps on PlayStore, the launch time goes anywhere from 800ms to 4.5s.  Now, 4.5s is way too much for most use cases.

Bottom line, apps need to start quickly!

### To optimize your iOS app’s launch time, you should consider the following:

* Embed fewer dylibs
* Consolidate Objective-C classes
* Eliminate static initializers
* Use more Swift, Apple recommends
* Measure your efforts using DYLD\_PRINT\_STATISTICS
* Discourage the usage of dlopen\(\)

### On Android, the following usually impacts the app launch time:

* Instantiation of many views
* Expensive content like decoding bitmaps
* Running layouts

### To make your app launch faster on Android:

* Don’t inflate parts of UI that you don’t require on the first launch. Use placeholder for hierarchies that can be optionally inflated later
* Avoid memory churns due to allocation and garbage collections whenever possible
* Use tools like
  [Apteligent](http://www.apteligent.com/)
  to monitor and optimize your app launch time
* Avoid initialization code in your app’s object
* Remember, an app that has been launched recently, and an app that is launching for the first time will behave differently

## Minimize device wakeups

Waking up mobile too often drastically decreases system performance. It also drains system resources. You can restrict the intents to which your app will respond.

## Consider low-end Android Mobiles

Not all Android users have the latest 2+GBs of RAM. When we look at the device available for Android, we see high division in terms of device capabilities.

When most developers develop and optimize their app for performance, they make this one big mistake. They optimize the app for the wrong device, often for the high-end devices available for them.

A good rule of thumb is that you should always have a variety of devices to optimize your app’s performance. That way you will be able to test across:

* Various speeds
* Form factors and resolutions
* Small RAM sizes

## Smooth frame rate

On both iOS and Android, when it comes to rendering animations and gestures the maximum frame rate is 60fps.

Anything that goes below a 60fps usually will appear as a hiccup to your app’s user.

In order to hit 16ms frame rate \( an equivalent of 60fps\), everything within your app’s rendering code has to be executed within 16ms. This is where on Android you would start to notice how expensive a 5ms from a garbage collection becomes.

Let’s evaluate how this will impact the end user. When you miss the 16ms limit, you often get a slightly lower frame rate ~ 59fps. No big deal here, right?

Wrong!

What actually happens is that if your app misses the 16ms limit once, it is unable to use the window for one frame and now has to wait for the next one. Though your app only took 19ms to render, it actually missed the window, which will appear to the user that now it’s taking TWICE as long. You see! Right there, you just told a user that your app is super bad.

## Restoring user data on new devices

App users often spend a lot of time setting up the application and make it work as they intend to on their phones. When they re-install an app, then most users expect their old settings to re-surface.

Preserving settings data can help enhance the quality of your application by:

* Any setting modified by the user
* Push notification settings
* Whether the user has seen the welcome screens and introductory onboarding screens

## Find latency killers

It is very important to remove latency issues from your application. Latency is known to cause app errors and often crashes the entire application. Statistics have told us that if an app runs slowly, more than 50% users will uninstall your app within 24 hours.

To effectively deal with latency related issues:

* You can restrict third party latency sources when your network quality is poor
* Reduce the need of latency killer APIs that you might be using on your mobile

## Optimizing your iOS app for multitasking

Let’s say you have a user who is using your app, and the app is doing a great job of rendering at 60fps and gets the work done only in 9ms.  Look at the image below to see this:

![](https://www.simform.com/wp-content/uploads/2017/08/1.1-768x384.png)

4

* * * * 
# How to improve your mobile app’s performance?

![](https://secure.gravatar.com/avatar/951b4be91449cd5dfc26597902dba1e7?s=90&d=mm&r=g)

Purvak Pathak

  


in

[Mobility](https://www.simform.com/category/mobility/)

,

[Product Engineering](https://www.simform.com/category/product-engineering/)

[August 18, 2017](https://www.simform.com/mobile-app-performance/)

- 9 minutes

[![](https://www.simform.com/wp-content/uploads/2017/08/progress-graph.png "mobile app performance")](https://www.simform.com/mobile-app-performance/)

Last year, I was on my flight returning back from London, I was traveling with a mobility Industry practitioner. He has worked with really big firms from last 20 years helping enterprises adopt technologies.

While we had a great good 8 hours of flight together, he highlighted something that I have been thinking a lot lately. Not only he thought mobile apps and performance were just about continuous delivery, he, in fact, couldn’t audit any mobile application that significantly improves the performance.



When I landed in San Francisco, I reached out to more people and learned everyone had the similar assumptions. Code quality and basic architecture were the only things that people were talking about.

I immediately thought of how we approach[building apps](https://www.simform.com/product-engineering-services/)at[Simform](http://www.simform.com/)and saw some clearly[outstanding practices](https://www.linkedin.com/pulse/my-6-steps-formula-enhance-any-app-performance-purvak-pathak?published=t)that we follow to build benchmark breaking apps that scale to billions.

The following would drastically impact the quality of your mobile application:

* Application size
* Application performance
* Platform-specific guidelines
* Architecture design

Now, let’s see how you can optimize each of them to make your application faster in simple, easy to follow steps.

## Minimize the application size

Mobile phones aren’t powerful GPUs, yet! Also, do you know that most of the Android market share is consumed by low-end configuration mobile phones? Some of them don’t even support 2G or 3G, even downloading your huge application in a momental need would be a nightmare for the app’s users. The less your app consumes space on such constrained phones, the better.

![](http://www.simform.com/wp-content/uploads/2017/08/App-and-size-1024x512.png "mobile app perfomance factors")



## Optimize networking

Text first, image second

To optimize networking, try to load textual data first. Image based content present in your application can then be loaded as the second preference, asynchronously.

Avoid duplicate network requests

Those who are familiar with[Volley](https://developer.android.com/training/volley/index.html%20rel=)in Android will know a lot about this. When poorly implemented that android app using Volley can send two requests to the server at the same time, you might delete an item, it will get deleted, but your app would say, no such item exists. Not only just the functionality, but duplicated requests increase system congestion and decrease app’s performance, especially when you have a million app users. Imagine increasing the number of requests to your server increased by 2 folds when you are extremely desperate to optimize these costs.

Understand and adjust based on connection quality

Think about an app that adjusts everything based upon the network quality available. Your app can change the content quality delivered based upon what network conditions a user is present in to make sure that the app’s usage doesn’t fall through.

Effective API design

The way an API has been designed has a huge impact on how it impacts app’s performances. An incomplete or lazily designed API can be a burden on the mobile application. Workarounds on[APIs](https://www.simform.com/android-app-developers-top-api/)usually put too much pressure on the network limitations.

When designing the API payloads of your mobile app ensure that you have:

* Consistency: The developer should know that expect, leaving no space for least astonishment.
* Completeness: Having reduced workarounds
  ![](http://www.simform.com/wp-content/uploads/2017/08/img-1-1024x512.png "mobile app network optimization")

Starting from UI and going all the way to data can be one great way to design a consistent and complete API payload that improves your app’s performance. Just because you can send, don’t send everything from mobile to your API. Only send what’s required.

## Optimize images in your application

To optimize images in your application, you can:

* Use vector images
* Serve dynamic image sizes
* Apply color filters as opposed to using different sets of colored images
* Use image caching
* Use libraries like Picasso and Fresco

## Cache data to optimize for offline

When your network is weak, display whatever data you have, while fetching required data. Doing so will:

* Reduce your server load
* Reduce the number of your mobile phone’s radio usage, improving your app’s battery life

If you don’t have a testing team at your disposal, try switching your phone into the airplane mode and test your app for offline performance.

## Make sure you optimize your app for screen size as well

A lot has been spoken about the screen sizes, Android raises some really big concerns here as there are literally thousands of devices, each with their own resolution and screen size.

As a rule of thumb:

* Build for small and medium screens
* Optimize for MDPI and HDPI
* Implement adaptive UI flows

![](http://www.simform.com/wp-content/uploads/2017/08/android-fragmentation.png)

Don’t have a 100’s of devices to test the screen size and resolution? Test with emulator configurations.

## Memory usage in Android

In order to provide mobile users with the ability to multitask, Android sets limits to how much RAM is available to an application. These limits are not static and change as the mobile usage increases or decreases.

Considering RAM limitations throughout app development, and apps that are running in the background can hog unnecessary resources.

But, you can optimize your app by:

* Limiting the lifespan of services, consider using intent service to limit the lifespan
* Release UI resources when users move to a different UI
* Utilize memory efficient code constructs
* Minimize the use of external libraries

## How fast does your app launches?

Do you know that for average top 25 apps on PlayStore, the launch time goes anywhere from 800ms to 4.5s.  Now, 4.5s is way too much for most use cases.

Bottom line, apps need to start quickly!

### To optimize your iOS app’s launch time, you should consider the following:

* Embed fewer dylibs
* Consolidate Objective-C classes
* Eliminate static initializers
* Use more Swift, Apple recommends
* Measure your efforts using DYLD\_PRINT\_STATISTICS
* Discourage the usage of dlopen\(\)

### On Android, the following usually impacts the app launch time:

* Instantiation of many views
* Expensive content like decoding bitmaps
* Running layouts

### To make your app launch faster on Android:

* Don’t inflate parts of UI that you don’t require on the first launch. Use placeholder for hierarchies that can be optionally inflated later
* Avoid memory churns due to allocation and garbage collections whenever possible
* Use tools like
  [Apteligent](http://www.apteligent.com/)
  to monitor and optimize your app launch time
* Avoid initialization code in your app’s object
* Remember, an app that has been launched recently, and an app that is launching for the first time will behave differently

## Minimize device wakeups

Waking up mobile too often drastically decreases system performance. It also drains system resources. You can restrict the intents to which your app will respond.

## Consider low-end Android Mobiles

Not all Android users have the latest 2+GBs of RAM. When we look at the device available for Android, we see high division in terms of device capabilities.

When most developers develop and optimize their app for performance, they make this one big mistake. They optimize the app for the wrong device, often for the high-end devices available for them.

A good rule of thumb is that you should always have a variety of devices to optimize your app’s performance. That way you will be able to test across:

* Various speeds
* Form factors and resolutions
* Small RAM sizes

## Smooth frame rate

On both iOS and Android, when it comes to rendering animations and gestures the maximum frame rate is 60fps.

Anything that goes below a 60fps usually will appear as a hiccup to your app’s user.

In order to hit 16ms frame rate \( an equivalent of 60fps\), everything within your app’s rendering code has to be executed within 16ms. This is where on Android you would start to notice how expensive a 5ms from a garbage collection becomes.

Let’s evaluate how this will impact the end user. When you miss the 16ms limit, you often get a slightly lower frame rate ~ 59fps. No big deal here, right?

Wrong!

What actually happens is that if your app misses the 16ms limit once, it is unable to use the window for one frame and now has to wait for the next one. Though your app only took 19ms to render, it actually missed the window, which will appear to the user that now it’s taking TWICE as long. You see! Right there, you just told a user that your app is super bad.

## Restoring user data on new devices

App users often spend a lot of time setting up the application and make it work as they intend to on their phones. When they re-install an app, then most users expect their old settings to re-surface.

Preserving settings data can help enhance the quality of your application by:

* Any setting modified by the user
* Push notification settings
* Whether the user has seen the welcome screens and introductory onboarding screens

## Find latency killers

It is very important to remove latency issues from your application. Latency is known to cause app errors and often crashes the entire application. Statistics have told us that if an app runs slowly, more than 50% users will uninstall your app within 24 hours.

To effectively deal with latency related issues:

* You can restrict third party latency sources when your network quality is poor
* Reduce the need of latency killer APIs that you might be using on your mobile

## Optimizing your iOS app for multitasking

Let’s say you have a user who is using your app, and the app is doing a great job of rendering at 60fps and gets the work done only in 9ms.  Look at the image below to see this:

![](http://www.simform.com/wp-content/uploads/2017/08/1.1-1024x512.png "mobile app perfomance improvement")

Now, the user brings in a secondary app on his phone, which also takes around 7ms to get the work done. It now looks something like this:  
![](https://www.simform.com/wp-content/uploads/2017/08/1.2-768x384.png)

Now both apps combined as we can see are using 16ms that we have in order to render at 60fps.

Let’s say now the user brings in another app rendering at 60fps, taking 10ms to get the work done. Now the combined total goes up to 9 + 7 + 10 = 26ms, which also means that the rendering of these apps are now as low as approx 40fps and not 60fps.  
![](https://www.simform.com/wp-content/uploads/2017/08/1.3-768x384.png)

Your app’s users will now notice stuttering. The situation is pretty much same for GPU and system memory.

Remember that time when your app kept crashing?

Well, let’s have a look at a scenario where you have one single app that’s running on the device.

Now, let’s introduce another app into this scenario, we are still doing good and have some tiny memory left.

Now, when we introduce another app into the picture, the system doesn’t have any other memory to allocate. It now will kill a process to free up resources.

This is what makes application development so challenging \(for those who actually care about it!\).

Fixing these challenges requires a little understanding of the iOS ecosystem. Let’s see how you can optimize your app for multitasking:

* You can use instruments to identify and fix bugs
* Prioritize your work appropriately and don’t block the main thread
* Identify and manage your working set
* Use caches and respond to memory warnings
* Leveraging the virtual memory system to increase reclaimable memory
* Make tradeoffs

If someone can even follow 50% of these, they will observe a tremendous amount of difference in how their app will perform.

If you liked this article, consider sharing it.

Source: https://www.simform.com/mobile-app-performance/  

  


