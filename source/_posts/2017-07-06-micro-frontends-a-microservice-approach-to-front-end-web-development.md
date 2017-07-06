---
title: Micro frontends – a microservice approach to front-end web development
---

![](http://img0.tuicool.com/7BFRBrz.png!web)

For web apps, the front end is becoming bigger and bigger, and the back end is getting less important. Our web app at[**Weld**\(web/app creation tool\)](https://www.weld.io/?utm_source=medium.com&utm_content=micro-frontends)is 90% front-end code, with a very thin back end. I can imagine that a majority of new web apps being built today are dealing with a similar situation.

Web apps also change over time, as do development techniques and frameworks. This requires support for allowing different front-end frameworks to co-exist, e.g. older modules built in JQuery or AngularJS 1.x, combined with newer modules built in React or Vue.

### The monolithic approach doesn’t work for larger web apps

Having a monolithic approach to a large front-end app becomes unwieldly. There needs to be a way of breaking it up into smaller modules that can act independently.

Example:

* `myapp.com/`
  - landing page built with static HTML.
* `myapp.com/settings`
  - old settings module built in AngularJS 1.x.
* `myapp.com/dashboard`
  - new dashboard module built in React.

I would imagine the following is needed:

1. A
   **shared codebase**
   in pure JavaScript e.g. managing routing and user sessions. Also some shared CSS. Both should be as thin as possible.
2. A
   **collection of separate modules**
   , “mini-apps”, built in various frameworks. Stored in different code repositories.
3. A deployment system that
   **bundles all the modules together**
   from different repositories and deploys to a server, whenever a module is updated.

### The solution: “micro frontends”

But as it turns out, a lot of other people is thinking about the same ideas. The common term is_“micro frontends”_.

Companies like[Spotify](https://news.ycombinator.com/item?id=13009285),[Klarna](https://news.ycombinator.com/item?id=13012916),[Zalando](https://www.mosaic9.org/),[Upwork](https://www.upwork.com/blog/2017/05/modernizing-upwork-micro-frontends/), and[Allegro](http://allegro.tech/2016/03/Managing-Frontend-in-the-microservices-architecture.html)are using the micro frontends approach to build their web apps.

### Implementing micro frontends

Here’s a few different approaches to implementing micro frontends:

1. Isolating micro-apps into
   [**IFrames**using libraries and Window.postMessage APIs](https://news.ycombinator.com/item?id=13009285)
   to coordinate. IFrames share APIs exposed by their parent window.
2. [Multiple single-page apps that live at different URLs](https://news.ycombinator.com/item?id=13011795)
   . The apps use NPM/Bower components for shared functionality.
3. Using
   [**Varnish Cache**to integrate different modules](http://allegro.tech/2016/03/Managing-Frontend-in-the-microservices-architecture.html)
   .
4. [**Web Components**as the integration layer](https://technologyconversations.com/2015/08/09/including-front-end-web-components-into-microservices/)
   .
5. [“Blackbox”**React**components](https://news.ycombinator.com/item?id=13012916)
   .

### Resources

* [Ask Hacker News: “What do you use to build micro-front ends?”](https://news.ycombinator.com/item?id=13009285)
* [Project Mosaic](https://www.mosaic9.org/)
  by Zalando, a set of libraries to support a microservice style architecture for large scale websites. See also
  [this presentation from Zalando Tech](https://www.microservices.com/talks/mosaic-microservices-zalando-tech/)
  .
* [Micro Frontends \(GitHub\)](https://github.com/neuland/micro-frontends)
  — will contain techniques, strategies and recipes for building a modern web app with multiple independent teams.



Source: [https://medium.com/@tomsoderlund/micro-frontends-a-microservice-approach-to-front-end-web-development-f325ebdadc16](http://www.tuicool.com/articles/hit/aeM3Ybf)

