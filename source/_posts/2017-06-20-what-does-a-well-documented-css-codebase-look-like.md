---
title: What Does a Well-Documented CSS Codebase Look Like?
---

In the front-end community, there is a lot of attention related to documenting JavaScript. That's not so much the case with CSS. Often times I feel like lost when I join a project with minimal or no CSS documentation.

Even though CSS is relatively easy to write, it can be quite hard to maintain.The specificity, the global scope of everything, and the lack of guidance can easily lead to inconsistency, code duplication, and over-complication.

I've long been curious what a really well-documented CSS codebase looks like. Here, I'll share my experience, along with the expectations I have towards my vision of well-documented stylesheets.

It surprises me where I hear people say that commenting CSS is not that important. I imagine none of them have had to deal with 10,000+ line stylesheets! Often I've struggled with what HTML results in what specific style. Without having a solid context about the development decisions taken, debugging efforts increase.[WTFs per minute](http://commadot.com/wtf-per-minute/)increase exponentially too.

Many times I've spent hours to figure out what the developer intended, why she didn't do it the another way, why is this layout seemingly so complex. There is much pain buried in these "why" questions.

So, here we go! Let's examine the 4 big signs of a well-documented CSS codebase.

![](http://img2.tuicool.com/mE3YfiU.jpg!web)

### 1\) CSS Tech Stack & Toolchain

There are likely things as part of our CSS code base like third-party libraries, mixins, or other tools. Looking in the package manager's dependencies list doesn't give a lot of context_why_the decisions were made to add these things, what they do exactly, and how we're using them.

It would be good for everyone to know why a certain library or tool was introduced. Imagine, for example, that a third-party library was introduced only to solve what has become an obsolete CSS issue. If we had context like that, we could make more informed decisions.

There sometimes can be quite a few third-party libraries in a project. Have you ever spent a bunch of time on web searching each one figuring out what it even is? It can be quite a challenge to know or to keep track of what each exactly does.

A well-documented codebase would include a description for each dependency. Perhaps you could the comment tweet-length \(140 characters\) explaining why it is there. That would give anyone else in the code base a head start on why something is there.

I like adding these descriptions right in the place where I`@import`them.

### 2\) CSS Conventions

Good coding conventions result in consistent, readable, and unambiguous source code. They standardize the structure and coding style of an application so that you and others can easily read and understand the code.

It's important to know if there are any project-specific naming conventions or methodologies in place \(likeBEM,[OOCSS](https://css-tricks.com/on-style-maintenance/#article-header-id-2),[SMACSS](https://smacss.com/), orACSS\). I've seen cases where a certain methodologies principles are applied but[the actual rules followed are modified based on the preferences of the developers involved](https://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/). So an indication how strictly we must follow the methodology principles would be good to leave in a well-documented code base.

This brings up the larger issue of CSS style guides. A naming convention is just one choice as part of a complete styling strategy. Other parts might be:

* How is code sectioned?
* How are files structured?
* [How are properties ordered?](https://css-tricks.com/poll-results-how-do-you-order-your-css-properties/)
* How is commenting done?
* How is the formatting done \(indentation, rule declarations\)?
* [How to bind JavaScript hooks to classes?](https://github.com/airbnb/css#javascript-hooks)
* … and many more rules or anti-patterns like nesting more then 3 levels deep, avoiding ID selectors,
  [using !important only for utility classes](https://css-tricks.com/when-using-important-is-the-right-choice/)
  and etc.

All this makes up a completeCSS style guide. Having a shared vocabulary like this I'd consider a strong plus towards consistency.

### 3\) CSS Architecture

Most scalable projects follow some type of architecture in terms of ordering styles. In a well-documented codebase, the fundamental principles that the project follows when structuring and sectioning styles should be mentioned.

I was first inspired to explore CSS architecture by[watching Harry Roberts's talk about managing CSS projects](https://youtu.be/1OKZOV-iLj4). Here's Harry:

CSS architecture seems to be somewhat in vogue right now. It's something you've no doubt heard mentioned numerous times over the past year or so, and with good reason: UIs \(and the teams that build them\) are getting bigger and more complicated than ever before.

There are a number of aspects of CSS which make it troublesome. It's declarative, meaning there is no logic or control flow to tell other developers much about the state or construction of the project. It operates in a global namespace, meaning we get collisions, leaking styles and inadvertent regressions. It utilizes inheritance, making everything somewhat interdependent and brittle. Finally, the unavoidable specificity model can cause problems when selectors fight each other for prominence.

Therefore, he[introduces a concept for architecting CSS called ITCSS](http://www.creativebloq.com/web-design/manage-large-css-projects-itcss-101517528). If you are working on a project of reasonable scale, chances are someone already defined similar principles or ideas that aim to resolve these problems. So in a well-documented codebase, I would expect to see them written somewhere.

One could tell if the architecture is explained well enough if you can answer the following question: Where should new styles or stylesheets be added?

### 4\) CSS Component Descriptions and Examples

A common pattern is to separate the logical modules into CSS components \(or "blocks" according to BEM\). Some of them might be re-usable, some may not, but the important thing is that they are the building blocks of our project. Therefore, describing what they are should be a top priority in a well-documented codebase.

Ideally, you should arrange and group them, name them, and establish rules between them to generate an overview of all components. A well-described CSS component doesn't only include information about what the component does but also has other valuable intel like example HTML markup and the context in which it's meant to be used. Going one step further brings up the issue of[Pattern Libraries](https://www.smashingmagazine.com/taking-pattern-libraries-next-level/). A pattern library is a collection of reusable components that can be used together to create a website. With modular, component-based architecture becoming a trend, they can bring huge value.

The goal of a pattern library is to show what can be built with existing patterns \(components\). But let's take a look at what additional information can be displayed alongside each pattern also. Vitaly Friedman shared a good summary on[how taking the pattern library to the next level looks like](https://www.smashingmagazine.com/taking-pattern-libraries-next-level/). He states that focusing on components isn't good enough:

One of the main problems with pattern libraries is that, while they provide an overview of components, they often leave a lot open to interpretation. Components can be combined in a variety of ways, consistently and inconsistently. It's great to be able to see what button variants and iconography are available and what kinds of tables and pricing tags one may use, but what if you need to design or build an interface that contains all of these components at once — and perhaps another that doesn't yet exist in the library?

A list of modules alone wouldn't convey any context or any specifics on how the modules should \(and should not\) be used.

Based on Vitaly's post and[Brad Frost's anatomy of a pattern in a pattern library](http://bradfrost.com/blog/post/anatomy-of-a-pattern-in-a-pattern-library/), here are a few ideas I can imagine each of our patterns \(components\) could have, despite the usual unique name, code sample and a description of the component's purpose. Basic \(fundamental\):

* Tags or categories: The assigned tags or categories for the component. Developers could tag their components with "in use", "needs refactoring" tags and etc.
* Responsive preview: A real-life, resizable preview of the component, using the actual snippet of code being used in production. Alternatively, just a screenshot.
* Versioning and legacy, team members involved or responsible: In a bigger team, the ownership of the \(family of\) components and which team members have been actively developing them could be really helpful for maintenance and further development.

… and here are a few more advanced:

* Performance impact: Sometimes CSS could be heavy too. An indicator of performance or a "warning signs" section, outlining not only performance impact but also any common mishaps when the pattern is used incorrectly.
* Accessibility implications: Indicator of accessibility requirements. Some components might require more work to maintain accessibility, especially if they interact with other components.
* Related patterns: A quick overview of related components or the family of components that a given component belongs to. Could use an explanation of when to use a component, when not to, and why.
* Fallback and print previews.

… the list goes on and on to whatever makes sense for your specific use-case.

### Conclusion

A well-documented CSS codebase enforces consistency, boosts maintainability, and helps the team to build a shared vocabulary. It is a prerequisite for efficient CSS design and development. Moreover, based on my experience, it inevitably leads to better performance. I strongly believe that these are the signs of the professional execution of a project.

If you have thoughts, please feel free to add them in the comments below, so together we can come closer to better documentation practices.



Source: [https://css-tricks.com/well-documented-css-codebase-look-like/](http://www.tuicool.com/articles/hit/yINJrmZ)

