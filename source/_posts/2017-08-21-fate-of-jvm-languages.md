---
title: Fate of JVM languages
---

Every now and then, there’s a post predicting the death of the Java language. The funny thing is that none of them writes about a date. But to be honest, they are all probably true. This is the fate of every language: to disappear into oblivion - or more precisely to be used less and less for new projects. The question is what will replace them?

Last week saw another such article[on InfoQ](https://www.infoq.com/news/2017/08/Java-Still-One-Tiobe:). At least, this one told about a possible replacement, Kotlin. It got me thinking about the state of the JVM languages, and trends. Note that trends have nothing to do with the technical merits and flaws of each language.

I started developing in Java, late 2001. At that time, Java was really cool. Every young developer wanted to work on so-called new technologies: either .Net or Java, as older developers were stuck on Cobol. I had studied C and C++ in school, and memory management in Java was so much easier. I was happy with Java…​ but not everyone was.

[Groovy](http://groovy-lang.org/)came into existence in 2003. I don’t remember at what time I learned about it. I just ignored it: I had no need of a scripting language then. In the context of developing enterprise-grade applications with a long lifespan with a team of many developers, static typing was a huge advantage over dynamic typing. Having to product tests to check the type system was a net loss. The only time I had to create scripts, it was as a WebSphere administrator: the choice was between Python and TCL.

[Scala](https://www.scala-lang.org/)was incepted one year later in 2004. I don’t remember when and how I heard about it, but it was much later. But in opposition to Groovy, I decided to give it a try. The main reason was my long interest in creating "better" code - read more readable and maintainable. Scala being statically typed, it was more what I was looking for. I followed the Coursera course[Principles of Functional Programming in Scala](https://www.coursera.org/learn/progfun1). It had three main consequences:

* It questioned my way to write Java code. For example, why did I automatically generate getters and setters when designing a class?
* I decided Scala made it too easy to write code unreadable for most developers - including myself
* I started looking for other alternative languages

After Groovy and Scala came the second generation \(3rdif you count Java as the first\) of JVM languages, including:

* [JetBrains Kotlin](https://kotlinlang.org/)
* [Red Hat Ceylon](https://ceylon-lang.org/)
* and
  [Eclipse eXtend](https://eclipse.org/xtend/)

After a casual glance at them, I became convinced they had not much traction, and were not worth investing my time.

Some years ago, I decided to teach myself basic Android to be able to understand the development context of mobile developers. Oh boy! After years of developing Java EE and Spring applications, that was a surprise - and not a pleasant one. It was like being sent backwards a decade in the past. The Android API is so low level…​ not to even mention testing the app locally. After a quick search around, I found that Kotlin was mentioned in a lot of places, and finally decided to give it a try. I fell in love immediately: with Kotlin, I could improve the existing crap API into something better, even elegant, thanks to extension functions. I dug more into the language, and started using Kotlin for server-side projects as well. Then, the Spring framework announced its integration of Kotlin. And at Google I/O, Google announced its support of Kotlin on Android.

|  | This post is about my own personal experience and opinion formed from it. If you prefer the comfort of reading only posts you agree with, feel free to stop reading a this point. |
| :--- | :--- |


Apart from my own experience, what is the current state of those languages? I ran a[quick search on Google Trends](https://trends.google.com/trends/explore?q=%2Fm%2F0_lcrx4,%2Fm%2F02js86,%2Fm%2F091hdj,Ceylon,XTend).

![](http://img0.tuicool.com/JrIrYnA.png!web)

There are a couple of interesting things to note:

* Google has recognized search terms
  _i.e._
  "Programming Language" for Scala, Groovy and Kotlin, but not for Ceylon and eXtend. For Ceylon, I can only assume it’s because Ceylon is a popular location. For eXtend, I’m afraid there are just not enough Google searches.
* Scala is by far the most popular, followed by Groovy and Kotlin. I have no real clue about the scale.
* The Kotlin peak in May is correlated with Google’s support announcement at Google I/O.
* Most searches for Scala and Kotlin originate from China, Groovy is much more balanced regarding locations.
* Scala searches strongly correlate with the term "Spark", Kotlin searches with the term "Android".

Digging a bit further may uncover interesting facts:

* xTend is not dead, because it has never been living. Never read any post about it. Never listend to a conference talk neither.
* In 2017, Red Hat gave Ceylon to the Eclipse Foundation, creating
  [Eclipse Ceylon](https://projects.eclipse.org/proposals/eclipse-ceylon)
  . A private actor giving away software to a foundation might be interpreted in different ways. In this case and despite all reassuring talks around the move, this is not a good sign for the future of Ceylon.
* In 2015, Pivotal stopped sponsoring Groovy and it moved to the Apache foundation. While I believe Groovy has a wide enough support base, and a unique niche on the JVM - scripting, it’s also not a good sign. This correlates to the
  [commit frequency](https://github.com/apache/groovy/graphs/contributors)
  of the core Groovy committers: their number of commits drastically decreases - to the point of stopping for some.
* Interestingly enough, both Scala and Kotlin recently invaded other spaces, transpiling to JavaScript and compiling to native.
* In Java,
  [JEP 286](http://openjdk.java.net/jeps/286)
  is a proposal to enhance the language with type inference, a feature already provided by Scala and Kotlin. It’s however limited to only local variables.
* Interestingly enough, there are efforts to
  [improve Scala compilation time](https://github.com/twitter/reasonable-scala)
  by keeping only a subset of the language. Which then raises the question, why keep Scala if you ditch its powerful features \(such as macros\)?

I’m not great at forecast, but here are my 2 cents:

1. Groovy has its own niche - scripting, which leaves Java, Scala and Kotlin vying for the pure application development space on the server-side JVM.
2. Scala also carved its own space. Scala developers generally consider the language superior to Java \(or Kotlin\) and won’t migrate to another one. However, due to Spring and Google announcements, Kotlin may replace Scala as the language developers go to when they are dissatisfied with Java.
3. Kotlin has won the Android battle. Scala ignored this area in the past, and won’t invest in it in the future given Kotlin is so far ahead in the game.
4. Kotlin’s rise on the mobile was not an intended move, but rather a nice and unexpected surprise. But JetBrains used it as a way forward as soon as they noticed the trend.
5. Kotlin interoperability with Java is the
   _killer_
   feature that may convince managers to migrate legacy projects to or start new projects with Kotlin. Just as non-breaking backward compatibility was for Java.

I’d be very much interested in your opinion, dear readers, even \(especially?\) if you disagree with the above. Just please be courteous and provide facts when you can to prove your points.



Source: [https://blog.frankel.ch/rise-fall-jvm-languages/](http://www.tuicool.com/articles/hit/vuyqIzI)

