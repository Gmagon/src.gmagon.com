---
title: Functional Programming Is Definitely Worth Learning.
---

>I absolutely love functional programming_. It does help in a lot of ways, but you should keep in mind thatyou can still end up with a written program that is completely, utterly, broken.

![](http://img2.tuicool.com/eA3MFju.jpg!web)

### Avoiding mutable state

Functional programming will help you avoid most of the errors caused by having an unmanageable amount of mutable state in your code. This does not mean you are forced to use a functional programming language in order to take advantage of immutability in your code though.

In general, it’s useful to carefully consider where in your program you definitely need state and where it can just be avoided altogether using a more functional approach. Sometimes immutability can have a performance impact but most of the time we value our productivity much more. Having working code in production that is less prone to bugs is usually of greater importance.

Immutability can also make it easier to manage concurrency and parallelise tasks. Don’t forget, though, that **not every algorithm or problem is parallelisable**. Imperative languages often offer standard libraries to try to help reduce the complexities of having to handle concurrency in your code. But at the same time, they give you enough power to manage it yourself if you need to do so.

Functional programmers argue that state changes over an immutable state are easier to reason about, and **that’s probably true for most people**. But I’m still not sure whether it’s compatible with how the real world behaves.

In the real world, if I punch you in the face I will change your state in place. I won’t be creating a new version of you with a black eye. Concurrency is handled by the laws of physics.

### Functional programming and productivity

Terseness and conciseness of our code can usually make us feel more productive. While this is usually very true there are still times where fewer but less straightforward lines of code can hurt productivity in the long run. It might simply take you or other people longer to review, understand and reason about that code over time.

A regular expression can be very concise, but also quite cryptic to decode and understand. This is usually the case with[glorious one-liners](https://softwareengineering.stackexchange.com/questions/17355/what-are-some-famous-one-liner-or-two-liner-programs-and-equations).

Depending on your language of choice, the ecosystem can also have a huge impact on productivity. Languages like Scala and Clojure picked up great momentum in the enterprise also due to the ability for developers to tap into the Java ecosystem when necessary to avoid having to reinvent the wheel and move faster.

Some of the wheels could be rebuilt in much nicer ways by more modern languages, but unfortunately,**this doesn’t happen often**.

### Purity can backfire

Another common strength of functional programming is the ability to abstract over side-effects and build a pure set of computations that can be composed into a program that is mostly free of side-effects.

This is great for maintainability of our software, but it doesn’t have to fit every purpose. If you are building a compiler or a mathematical model a functional language can be a great fit. But if you are trying to build software where the main concern is dealing with tons of side-effects it won’t improve things all that much.

Some developers take purity a little too far by trying to shoehorn every solution into a pure computational model resulting in very convoluted code. Ten levels of monad transformers or using the shiny new extensible effects won’t look that much of an improvement compared to some boring code that deals with your database, your HTTP calls, or the email client you are using, when that’s all it’s doing.

Your pure computation won’t make the world you are interacting with pure.

### Think about the solution

Code that is 100% pure, immutable, parallelisable and free of side-effects**doesn’t guarantee a working production system**.

I’ve seen incredibly beautiful functional code doing the wrong thing, creating too much coupling between components of the application, or not handling failures at all.

An example was a functional JSON parser failing miserably when sending malformed JSON through it. The developer built a 100% pure parser assuming the input will always be, as well, 100% correct. You might consider this is an extreme case, but it’s still good to think outside of the box from time to time.

The correct implementation of business processes, reduced coupling or increased stability of your software running in productioncan help your software more than a 100% purely functional solution.

### Welcome to the real world

Most of the advocates of functional programming out there showcase very attractive solutions for rather simple tasks. This happens very often in tech, due to the limited time people have to talk about what they’ve been working on.

The fact that a free monads interpreter works when all it handles is reading from standard input and printing to standard output doesn’t mean it would scale very well to more complex domains like the one you are working on right now.

In the real world, you will have to take the time to learn things first, then incrementally start using them in your code. If you want to use free monads for something, learn how they compose in your language of choice, make sure you know about their performance implications, and most importantly get feedback from your peers to validate your solution.

It can take a lot of time to get new approaches feel right in complex systems. I’m encouraging to try things out thoroughly if you can, they might end up fitting your problem really well. However,**a word of caution is in order**.

### Mastering the theory

You are most likely not required to learn and understand category theory or read white papers in order to solve a business problem using basic functional programming. You are also not required to know the exact definition of a functor, a monad, an applicative, and so on.

If reading about it is your passion, that’s awesome,**you’ll learn a lot from it**. For everybody else out there thinking they are not smart enough to understand these principles, the reality is that you might just be prioritising learning different things that interest you more or that you currently consider more useful.

It’s pretty common in our industry to work on a higher level of abstraction without really knowing what happens under the hood, so**don’t feel too bad about it**. I’m not saying this is ideal, but it’s one way to go when learning everything about everything is not really feasible yet. At least until we can upload knowledge to our brains like in The Matrix.

### The best is yet to come

With the advent of React in the front-end world and his functional approach to building web applications, or Serverless being mentioned almost every day on Hacker News, it’s really hard to know what the future holds.

We are increasingly moving towards stream-based systems, where the data is virtually immutable and flows through a set of processing steps to be aggregated, analysed and displayed.Functions-As-A-Service providers are working towards supporting a zero infrastructure workflow to be used for such tasks. It makes sense for a lot of things, and it’s taking the functional programming paradigm to the next level.

It does look exciting, it just felt a little immature the last time I tried it.

I’m also slightly concerned about what this approach would do to the efficiency and maintainability of the software if every developer starts pushing unrelated functions to a cloud provider because it’s easy to do so. We’ll hear some good stories soon enough.

Our relatively young industry can ask us a lot in terms of time investment towards learning new things and new paradigms. What’s new today could be, and will most likely be, considered legacy in a few years time.

### Last thoughts

Functional programming is definitely worth learning. It will make you a much better developer. What I’m advocating here is to apply**JEFP**\(_Just Enough Functional Programming_\) to deliver working, maintainable software without forcing yourself to achieve 100% purely functional solutions.

The main reasons why I’ve picked Scala to build most of my products is that I can leverage its strong type system and its functional programming characteristics to reduce the verbosity of my code and the number of runtime errors and bugs I end up creating. Secondarily, it still allows me to use libraries from the Java ecosystem that have been battle-tested for years and years. It also does not force me to build 100% of my software in a functional way allowing me a greater degree of freedom when choosing the right approach to building a solution.

I’ve tried to build a few things with Haskell as well, while it feels and looks amazing I still struggle to make my code look straightforward enough. But that might just be me not having invested enough time and effort into it.

I do program in other languages day to day \(damn, JavaScript is everywhere\). Sometimes I miss not having, for example, higher-kinded types, but most of the languages at least provide higher-order function and I can also embrace immutability where necessary. This is usually good enough to build decent working software and end up with code that other people can easily understand and fix if it happens to be completely, utterly broken.

What’s your approach to functional programming?

Source:  https://medium.com/@bfil/just-enough-functional-programming-a0c4fd09c8f7