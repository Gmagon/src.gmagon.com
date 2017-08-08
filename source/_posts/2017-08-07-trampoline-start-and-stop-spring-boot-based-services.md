---
title: 'Trampoline: Start and Stop Spring Boot-Based Services'
---

The times when a single deployment was enough to have a whole application deployed are gone. As everything in life, this has positive consequences and, unfortunately, negative ones.

The evolution from monolithic to microservices, knowing that there were several intermediate steps as it could be an SOA paradigm, has introduced a huge improvement to the way developers structure their applications. As we all know, it is not the same to open a project with a set of 30 classes, well structured among packages and with its corresponding units tests, as opening a monster with 1000 \(or more\) classes where, after five seconds, you can smell the stench of the bodies that precede you.

Not only that, reusability, decoupling, and separation of concerns have benefitted from the microservices evolution. Although microservices' benefits are well-known, here I will list some of them:

* Single Responsibility Principle: important in terms of maintainability and testing.

* Resilient: failure in one service does not impact other services.

* High scalability: demanding services can be deployed in multiple instances.

However, we lost the only positive thing that monolithic paradigm had: the single deployment, and we have to deal with that… not everything could be wine and roses. To solve it in a production environment, we have a whole set of CD tools which will help and will make our lives easier there, but… what happens on our local machine?

![](http://img2.tuicool.com/UjiMNnJ.png!web)

## An Open Source Tool:Trampoline

Here’s when Trampoline[http://ernestort.github.io/Trampoline/](http://ernestort.github.io/Trampoline/)comes to the stage. Built on top of Spring Boot and aimed to help Spring Cloud Community on its daily basis on their local deployments. The goal is to help during the course of developing an application based on the paradigm of microservices with a Spring Boot nature. How? Easy; thanks to a comfortable interface, you can declare new microservices, starting instances and kill them. Information introduced will be stored in a settings file, next to the script to launch each microservices.

When this project was presented in the Spring Cloud community, it experienced an incredible welcome, and was included in the[weekly post on the Spring Blog](https://spring.io/blog/2017/07/18/this-week-in-spring-july-18th-2017).

## Join and Contribute!

You are welcome to contribute, or if this project rings someone's bell it will have been a success in its original goal. Try to give something back to my favorite Java framework, Spring.



Source: [https://dzone.com/articles/trampoline-start-and-stop-spring-boot-based-servic](http://www.tuicool.com/articles/hit/iaq2IrA)

