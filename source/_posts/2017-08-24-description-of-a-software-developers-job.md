---
title: Description of a Software Developer's Job - Now and Then
---

![](http://www.rainerhahnekamp.com/wp-content/uploads/2017/08/On-Modern-Software-Development.jpg)_Classical and Modern Software Development_

**Introduction**

Software development today is different than it was 20 years ago. For a software developer to keep up with the technical progress, constant learning is required. This is not true.

In this posting, I want to show that modern mainstream software development, and web applications in particular, requires a completely different type of developer. You must learn and apply a completely different skillset. Just improving your core coding skills is not enough.

Modern software development is about knowing the landscape of tools and libraries as well as using them. Knowing how to create an optimal algorithm is not mandatory anymore.

Programming has transitioned from the traditional coding of the 90s which required sophisticated application of the right data structures and algorithms to today’s orchestration of libraries, frameworks. Programming talent is still essential for reading and understanding alien code, but no longer enough to be an effective developer.

Just as “there’s an app for that”, you will find there’s a library for every need.

### Classical Software Development: Algorithms & Knuth

In the old days, things were very clear. Windows was the operating system and a computer was a desktop. No smartphone, no tablet, no cloud. Mainstream software development meant developing desktop applications with IDEs like Visual Studio, Delphi, or Oracle Forms. You bought them and had to live with their functionality. If you needed some missing functionality, then you had to develop it on your own.

You had to rely on your skills and the books on your shelf. If you worked in a privileged environment that gave you Internet access, you could at least get help from newsgroups. Even then, you had to implement lots of features on your own that libraries provide today.

I can only speculate about the reasons. One thing I know for sure is that, in the Internet’s early days, getting software still meant getting it physically on floppy disks or CD-ROMs from vendors you had to find in the first place. That meant selecting the product from printed catalogs or ads in technical magazines. Open Source had barely begun so you actually had to pay for the software.

It is quite understandable that this time-consuming process gave no other choice than to implement lots of functionality on your own.

By creating your own libraries, you stepped one abstraction layer down and found yourself in situations where you had to make sure the performance was decent, there were no memory leaks, and would work in many use cases. This required a sound understanding of how to implement common data structures and operations running on top of the libraries – in other words, writing algorithms.

The formal curriculum aligned with these requirements. You learned data structures and algorithms. You breathed implementations of binary trees, linked lists, all sorts of sorting algorithms, and the use of Big O Notation for calculating the performance of an algorithm’s best/worst/average cases. Knuth’s compendium “The Art of Computer Programming” was the classical software developer’s bible.

Last but not least, you had to be wise in the ways of mathematics.

### Modern Software Development: Managing and combining libraries

With the rise of the World Wide Web, mainstream software development moved from desktop applications to web applications. A completely new scale of complexity impacts project infrastructure, programming language, database design, and more. That scale means a single developer, or even a team, can’t possess the knowledge needed to complete the project using classical techniques.

The Open Source scene got a big boost as developers spread their self-developed libraries to the public via the Internet. As a result, the number and variety of libraries is overwhelming. For example, libraries for the browser range from gigantic frameworks like Angular down to smaller, specialised tools like moment.js or lodash.

Continuing the example above, it should be quite clear that you should never, ever spend your time writing JavaScript utility functions for time operations. Spare yourself the horrible hours of developing, bugfixing and refactoring! Just take moment.js and move on.

Unless you must develop a library for a unique goal,  you won’t do better than a team of skilled developers specialized in that particular domain, with years of experience, and backed by an actively-contributing open source community.

Also for the most primitive operations like iterating over a collection, it is better to use a library if it exists.

For example, it is better to use a library like lodash for primitive operations like executing loops in Javascript where the native forEach is slower in certain browsers.

The main challenge for today’s programmer is not crafting the most suitable algorithm, but finding the right libraries and knowing how to combine them. In the best case you only write so-called glue code to manage the interplay between the libraries.

Of course, your application has a unique selling proposition that sets it apart from others. That core code should, and probably must, be developed by your internal team. For code that is not part of the core, you should take the time to check for existing libraries. You ought to find one that provides you with all the required functionalities and is actively maintained.

### Conclusion

In the introduction I  made the bold statement that keeping up to date with the technological progress is enough to “stay in demand”.

By distinguishing between a classical and a modern software developer, I hope I have shown that this is another type of work. From a classical developer’s perspective it requires a complete change of mindset.

Try to avoid active programming and switch to passive programming. That means reading others’ code and deciding if it suits the current application you are working on. You should be happy if your main programming task is writing glue code that binds together all these libraries.

This is what makes a good developer: finding the right combination of libraries, keeping them up to date, and reducing self-written code to the absolute minimum. Ideally the only code you write should  be the part that makes your application special.

By no means do I want to discredit coding. You must understand and evaluate external code, after all. That is impossible if you don’t have sound programming skills.

Source:[http://www.rainerhahnekamp.com/en/modern-software-development/](http://www.rainerhahnekamp.com/en/modern-software-development/)  


