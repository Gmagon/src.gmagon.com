---
title: The First Journey to becoming a fully-fledged developer
---

![](http://img1.tuicool.com/AF7ZVvv.png!web)

So, you’ve decided you’d like to learn how to develop Android apps? Great! That is definitely the first step on your journey to becoming a fully-fledged developer. Unfortunately, that’s as far as a lot of people get. Learning to code can be complicated and sometimes that includes even knowing where to start.

* What programming language should you learn?
* Where can you learn about your chosen language?
* Once you’ve grasped the basics
  _where_
  do you even start typing the code?

In this post, we’re going to attempt to answer that first question. Deciding which programming language to start with will depend entirely on what you hope to accomplish. And once you know the language, you can find the IDE and the tools to match.

Seeing as you’re reading a site called ‘Android Authority’, it’s probably safe to assume you’re interested in how to create Android apps predominantly. And in that case, you have a few options when it comes to learning how to develop Android apps.

## Take your pick

If you want to develop Android apps, it starts b y picking a language. The differences between the various Android programming languages can be a little complex and nuanced. Choosing which one to start with requires an understanding of the individual strengths and weaknesses, so I don’t want to short-change you.

![](http://img2.tuicool.com/VRnEfuV.jpg!web)

But I don’t want to bore you to death either and with that in mind, you’ll find a short break down of each language option here, followed by more detailed information below. Pick the one that looks interesting to you and then jump to there.

The languages you might consider learning for Android development include:

* Java – Java is the official language of Android development and is supported by Android Studio. It has a steep learning curve however.
* Kotlin – Kotlin was recently introduced as a secondary ‘official’ Java language. It is similar to Java in many ways but is a little easier to get to grips with.
* C/C++ – Android Studio also supports C++ with the use of the Java NDK. This allows for native coding applications, which can be handy for things like games. C++ is more complicated still however.
* C\# – C\# is a slightly more beginner friendly alternative to C or C++ that obfuscates more code. It’s supported by some very handy tools like Unity and Xamarin which are great for game development and for cross platform development.
* BASIC – A bonus option is to learn BASIC and try the B4A IDE from Anywhere Software. This is an easy but powerful tool, though definitely much more ‘niche’!
* Corona/LUA – Another cross-platform tool build on LUA. It massively simplifies the app-building process and allows you to call native libraries.
* PhoneGap \(HTML, CSS, JavaScript\) – If you already know how to build interactive web pages, then you can use this knowledge with PhoneGap to build a more basic cross-platform app.

## Java

When it comes time to develop Android apps, the first and most popular option is Java. Java is the_official_language of Android development, meaning it is the one that has the most support from Google and the one that most apps on the Play Store are built using.

The number one way to develop Android apps, is to go ahead and downloadAndroid Studio. This is a piece of software called an ‘IDE’ or ‘Integrated Development Environment’. It will come packaged with theAndroid SDK \(a set of tools to facilitate Android development specifically\) and basically this will give you everything you need in one place to get up and running.

![](http://img1.tuicool.com/yUnqQvV.jpg!web)

The[official tutorials and documentation](https://developer.android.com/index.html)from Google will reference this method and you’ll find the largest number of libraries \(free code to enhance your own apps\) and tutorials that focus on this method.

Java itself was released by Sun Microsystems back in 1995 and is used for a wide range of programming applications. Java code gets run by a ‘virtual machine’ which runs on Android devices and interprets the code.

Unfortunately, Java is also a little complicated and it’s not a great ‘first language’. This is what will provide the biggest barrier for many people who want to get started with Android development, in fact. Android is an object oriented programming language with confusing topics like constructors, null pointer exceptions, checked exceptions and more. It’s not terribly readable and you’ll use a lot of ‘boiler plate’ code doing simple things. Add in the Java SDK and things get more complicated still – a first time coder can struggle to know what’s Java and what’s Android! Development using this route also requires a basic understanding of concepts like Gradle, like the Android Manifest and the markup language XML.

That’s not to say that Java is a bad language – far from it. Not only would it be wrong to call_any_language ‘bad’ but it’s also true that most of the ‘inconveniences’ of Java are actually there for our own good and encourage clean code. A lot of people love Java for this reason and it’s also one of the most versatile and widely used.[According to the PYPL](http://pypl.github.io/PYPL.html)\(PopularitY of Programming Languages\) table, Java is the most sought after programming language among employers.

Making life a lot simpler is Android Studio, which has been going from strength to strength over the last few years. Features like a visual designer and suggestions make the process a fair bit smoother, while advanced, powerful features are being added all the time to give developers access to things like cloud storage with easy implementation. It’s worth getting aboard, even if this rapid progress does make it hard to keep up sometimes.

![](http://img1.tuicool.com/JBfym2f.png!web)

So, what’s the verdict? For those that want the ‘full’ Android development experience, diving into Java is the best place to start. For those who are put off by complex code, it’s possible to work largely with the designer and to follow tutorials for anything more complicated. If you’re a beginner and you’re looking to make a game however, or you just want to start learning for the sake of learning and you’d like to get some rewarding projects off the ground; then I recommend you start with something easier and then come back to this once you’ve got a bit more of a grounding.

Check out Gary’s[introduction to Java here](http://www.androidauthority.com/java-tutorial-beginners-2-582147/).

Note:

That said, it is also possible to use Java with Unity. I’ll discuss Unity under the section on C\# – but just note that you could opt for the slightly more complicated Java language when going this route and then use that to more easily transition to developing with Android Studio.

## Kotlin

Kotlin recently burst onto the scene as the ‘other’ official language for Android development. Some speculation suggests that this is likely to raise the language’s profile and that it could possibly become the next ‘Siwft’.

Like Java, Kotlin runs on the Java Virtual Machine. It’s also completely interoperable with Java and doesn’t cause any slow down or increase in file sizes. The difference is that Kotlin requires less ‘boiler plate’ code, meaning that it is a more streamlined and easy-to-read system. It also does away with errors like null point exceptions and even excuses you from ending every line with semi colons. In short, it’s great if you’re just learning to develop Android apps for the first time.

![](http://img2.tuicool.com/yQNRBjN.png!web)

So Kotlin is definitely an easier starting point for beginners and the fact that you can still use Android Studio is a big plus. It’s still not quite as simple to pick up as say C\# with Unity though, and the community support is in its relative infancy. In fact, you currently need to download a beta version of Android Studio in order to get the out-the-box support.

Still, Kotlin should definitely be on your radar and could offer an easier entry point to ‘proper’ Android Development. Which is likely why Google introduced it in the first place.

Learn[why you should try Kotlin here](http://www.androidauthority.com/introduction-to-kotlin-for-android-775678/).

## C/C++

It’s fair to say that most people reading this should not choose this route to develop Android apps. Android Studio offers support for C/C++ code using theAndroid NDK \(Native Development Kit\). This means you’ll be writing code that doesn’t run on the Java Virtual Machine but rather runs ‘natively’ on the device and gives you more control over things like memory. For intensive applications like 3D games, this can let you squeeze extra performance out of an Android device. It also means you’ll be able to use libraries written in C or C++.

![](http://img2.tuicool.com/JJ7jY3B.png!web)

However, it also tends to be much harder to set up, it introduces more bugs and it is less flexible. And if you_did_want to create a computer game, you’d probably be better off using a ready-made game engine

## C\#

C\# is basically an easier, pure object-oriented version of C and C++ developed by Microsoft. It aimed to bring the power of C++ and the ease of Visual Basic and reads a little like a simplified version of Java. Like Java, C\# is garbage collected meaning you don’t need to worry about things like memory leaks and freeing up memory yourself. At the same time though, C\# is more modern than Java with a cleaner syntax – though this may just be my own bias coming through. The best language to develop Android apps often just comes down to taste.

If you want a particularly easy and welcoming introduction to Android app development though, then I recommend the combination of[C\# and Unity](https://unity3d.com/). Unity is a ‘game engine’ \(meaning it provides things like physics calculations and 3D graphics rendering\) and an IDE like Android Studio. This is a free tool that makes it_incredibly_easy to create your own games – with just a few lines of code you can have a basic platform game set up in less than an hour. No exaggeration. And it’s perfectly powerful too, being the tool used by most game studios on the Google Play Store. And it’s multiplatform too. On top of all that, developing in this way provides a very practical way to learn Object Oriented coding \(because the objects in this case actually_are_objects most of the time\).

![](http://img2.tuicool.com/m2IJZni.png!web)

The limitation? Unity is useful for creating_games_but sub-par for creating standard Android Apps, especially if you want to conform to Google’s Material Design language. If you want to become a professional Android Developer, then this non-standard route will limit your employment opportunities – unless you aim is to become a game developer in which case this is a perfectly relevant and professional background.

Not keen on Unity? Then you could consider[Unreal](https://www.unrealengine.com/what-is-unreal-engine-4)instead \(better graphics, less suited to mobile\) or simplified game-makers like[GameMaker Studio](https://www.yoyogames.com/gamemaker).

C\# can also be used with Xamarin through Visual Studio. This is more akin to traditional Android development with the advantage of being cross platform \(one codebase for Android and iOS\). For a complete beginner, this route is again a slightly obtuse entry point to Android development – but for a small company wanting to create an app for iOS and Android it makes sense and there’s plenty of support and information out there to help you out.

## BASIC

Remember how I said that C\# was an attempt to offer the power of C with the ease of Visual BASIC? Well that’s because BASIC \(Beginners All-Purpose Symbolic Instruction Code\) is incredibly pleasant to use and an absolutely ideal jumping on point for learning to code.

![](http://img1.tuicool.com/3MvEB3.png!web)

Unfortunately, it isn’t officially support by Android Studio and nor can you use it in Unity or Xamarin. The good news is that there is a lesser-known option for developing Android apps in BASIC called ‘[B4A](https://www.b4x.com/)’ from Anywhere Software. This is an acronym for ‘BASIC 4 Android’ and as you might expect, it lets you code Android apps with BASIC. It’s certainly not the first choice for most programmers who want to develop Android apps, but it’s always nice to have more options.

B4A is designed as a ‘RAD’ or Rapid Application Development environment. There are lots of other smart design decisions to make life easier and there’s a very supportive community if you have any questions.

This is a great way to learn to code in my personal opinion and you can build some pretty powerful apps using this method alone. It’s not ideal for making higher-end games though and once again suffers from being an ‘unofficial’ option – so it’s harder to create something that exactly meets the Material Design specifications and you’ll find it harder working as a professional developer with only BASIC. The other big drawback is that this is the only option on the list that isn’t free to get stuck into.

## Corona

[Corona](https://coronalabs.com/)offers another considerably simpler option for developing Android apps while still giving you a fair amount of power and control. You’ll be coding in LUA which is already much simpler than Java and on top of that, the Corona SDK \(Software Development Kit\) will make things even easier. It supports all native libraries, allows you publish to multiple platforms. It is largely used for creating games but can be used in a variety of other ways too. You’ll need to use a text editor like Notepad++ to enter your code and you can run said code on an emulator without even needing to compile first. When you’re ready to create an APK and deploy, you’ll be able to do this using an online tool.

![](http://img0.tuicool.com/URFVRb.png!web)

This does require basic coding skills but it offers a nice and gentle introduction to the world of programming. At the same time though, it is definitely limited to some extent and is a few steps removed from getting into ‘app builder’ territory. This is more useful for someone who wants to create something relatively simple and isn’t as concerned about developing their coding skills or becoming a pro. If you want to use features such as in-app purchasing, then you’ll need to pay a fee. The same goes for using native Android APIs.

## PhoneGap

Finally, the last major ‘simplified’ option you can to turn to develop Android apps is[PhoneGap,](https://phonegap.com/)unless you want to turn instead to an[ ‘app builder’ program](http://www.androidauthority.com/android-app-makers-672412/). PhoneGap is powered by Apache Cordova and essentially allows you to create apps using the same code you’d normally use to create a website: HTML, CSS and JavaScript. This is then essentially shown through a ‘WebView’ but packaged like an app. PhoneGap then acts like a bridge, allowing developers to access some basic native features of the phone or tablet – such as the accelerometer or the camera.

![](http://img0.tuicool.com/EBryEj7.png!web)

This isn’t really ‘true’ Android development though and the only real programming will be JavaScript. For many basic tasks it will do the job, but if you want to be able to claim true ‘Android app developerhood’ \(that’s a thing\), then you should brave one of the other choices on this list.

## Conclusion

So take your pick! I wish there was a way to develop Android apps \(easily\) withPython but otherwise you do have a wide selection of different options there for developing Android apps: from Java and Kotlin, to C, C\# and BASIC! You can even use HTML and CSS to make something simple using PhoneGap.

![](http://img2.tuicool.com/VBJR32e.jpg!web)

The right choice will differ depending on your sensibilities and your objectives but whatever you decide, you’ll find that learning to code is a fantastically rewarding experience and one that opens up a ton of doors for you. And learning to code with Android is the perfect place to start. Hopefully now you at least now a bit more about how to develop Android apps, but if you have any questions shout them in the comments and our team – and our readers – will do our best to answer them. Good luck!

  




Source: [http://www.androidauthority.com/develop-android-apps-languages-learn-391008/](http://www.tuicool.com/articles/hit/2AbeQnu)

