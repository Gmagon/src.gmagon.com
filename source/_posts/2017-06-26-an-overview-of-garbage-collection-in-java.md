---
title: An Overview of Garbage Collection in Java
---

## An Overview of Garbage Collection in Java

DZone's Guide to

Here we examine the importance of proper garbage collection for Java apps, the components of GC, and the various patterns at your disposal.

[Johnny Morgan](https://dzone.com/users/2746645/guideinfoways.html)

Jun. 26, 17

·

[Java Zone](https://dzone.com/java-jdk-development-tutorials-tools-news)

Free Resource

Join the DZone community and get the full member experience.

What every Java engineer should know about microservices:[Reactive Microservices Architecture](https://info.lightbend.com/COLL-20XX-Reactive-Microservices-Architecture-RES-LP.html?utm_source=dzone&utm_medium=pre-roll-text&utm_campaign=COLL-20XX-Reactive-Microservices-Architecture&utm_term=none&utm_content=java-zone).  Brought to you in partnership with[Lightbend](https://info.lightbend.com/COLL-20XX-Reactive-Microservices-Architecture-RES-LP.html?utm_source=dzone&utm_medium=pre-roll-text&utm_campaign=COLL-20XX-Reactive-Microservices-Architecture&utm_term=none&utm_content=java-zone).

The Java garbage collector poses a great impact on the overall working and performance of an application. As the size of the garbage grows, the runtime of an application decreases. Hence, it is essential that you clear this garbage off of your application every now and then to enhance its productivity and user performance.

Garbage collection can be quite a daunting task. After all, choosing a wrong garbage collector type or settings can hamper the functionality of your app. There are typically seven types of garbage collectors known to us. These are classically bifurcated between the ‘mostly’ and ‘most concurrent’ category. With the ‘mostly’ types, they sometimes do not operate as expected and a fallback mechanism takes place. On the other hand, the ‘most concurrent’ collectors function concurrently with the application’s execution and rarely stop the world.

## Steps Involved in Garbage Collection

Before implementing the garbage cleaning step, it is essential to note whether your application has touched the GC safe point. That is the range where the collector can quickly recognize the thread execution references and complete the process. If your application has to wait for the safe point, it could very well run out of memory and collapse.

* Mark: Otherwise known as trace, this step involves finding all the live and dead objects in the expansive heap. The collector paints all the reachable live objects, and those left are tagged as dead.

* Sweep: Here, the garbage collector looks for dead objects and tracks their location. The bigger the heap, the more time will it take in the sweep to complete the task.

* Compact: In this step, the garbage collector rearranges the live objects in order to make the space congestion free. As the process commences, remapping takes place, which means your application's overall runtime should be significantly enhanced.

## Types of Collectors

* Mark/sweep/compact collector: Performs the function in three phases.

* Mark/Compact Collector: Performs the task in two steps, skipping the sweep phase.

* Copying Collector: Performs all the three phases in one go. It’s quite aggressive in nature and makes use of ‘from’ and ‘to’ space to move all the live objects. It then fixes the bugs and removes the garbage.

* Generation Collector: This works on the principle that most objects die young. The software creates new objects but at the same time, sooner rather later, it discards them, too. Through a generator collector, a developer can filter the creation, reduce the rate at which the Young Generation is pushed to the Old Generation, and keep pace with contemporary CPU throughput.

* Remembered Set: In this set, marks are used. These record the exact location of the Young Generation. Write banners are put to use to track the references from these generations into the Old Generation and keep these ‘remembered sets’ up-to-date.

Note on commercial implementations: There are two basic commercially available and proven approaches for the garbage collection implementation. The first one being a parallel approach and the other being the concurrent approach. 

## Role of Developers and Architects

The first and the foremost thing is to understand the nature of the application and the core functionality of the garbage collector.

* Garbage Collection Metrics: A plethora of application features affect the workings of the garbage collector. These include the allocation time of objects in memory, their life, and the need to save some for a long time. The mutation rate is the next thing that matters. And lastly, there are the metrics that help track the live set and the heap shape of these objects.

* The compaction time and the mark time make for the most important metrics for tracking the time of the garbage collection cycle. While the latter measures the time taken for identification of live objects, the former maps time taken to free up the memory and do the necessary allocation.

* Empty Memory for Clean-up Process: Each of these above-listed garbage collectors needs some amount of space to perform the task efficiently. More space practically halves the collector’s work and CPU consumption required for the job. The opposite applies to when there’s a shortage of empty memory.

* Implementing the GC Strategy: While the process of compaction is unavoidable, what many GCs do is delay the process to a possible point and free the easy empty space as soon as possible. Another technique is the focusing on concurrent markings and sweeping while at the same time skipping compaction. This proves helpful, too.

Bottom line, garbage collection is an integral part of an application’s performance over the Java platform. As Java devs, we need to implement strategies in order to build an application that speaks of excellent performance, scalability, and reliability.

Microservices for Java, explained. Revitalize your legacy systems \(and your career\) with[Reactive Microservices Architecture](https://info.lightbend.com/COLL-20XX-Reactive-Microservices-Architecture-RES-LP.html?utm_source=dzone&utm_medium=post-roll-text&utm_campaign=COLL-20XX-Reactive-Microservices-Architecture&utm_term=none&utm_content=java-zone), a free O'Reilly book. Brought to you in partnership with[Lightbend](https://info.lightbend.com/COLL-20XX-Reactive-Microservices-Architecture-RES-LP.html?utm_source=dzone&utm_medium=post-roll-text&utm_campaign=COLL-20XX-Reactive-Microservices-Architecture&utm_term=none&utm_content=java-zone).

Source: [https://dzone.com/articles/an-overview-of-garbage-collection-in-java](http://www.tuicool.com/articles/hit/rmQJJzJ)

