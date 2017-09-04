---
title: Building a mini card game-Polymer 3.0 Preview
---

The longer title should be: Experiment with Polymer 3.0 Preview — Building a mini card game with Polymer + Typescript + Webpack.

Webpack and Typescript are not necessarily in Polymer but that’s the tools I familiar with and I like Typescript\(probably you should give it a try\)!

* I have no prior experience using Polymer. I’m blogging this from a
**noob Polymer**
+
**normal Angular/Vue**
developer perspective.

Here is the demo and sourcode:

* demo:
[https://poly-mini-game.firebaseapp.com/](https://poly-mini-game.firebaseapp.com/)
* sourecode:
[https://github.com/chybie/poly-mini-game](https://github.com/chybie/poly-mini-game)

### Why

Being a long time AAV developer \(AngularJs, Angular, Vue\), I did follow the Polymer news, but didn’t really take a closer look into it\(for some reasons\) , until last week — during[Polymer Summit 2017](https://summit.polymer-project.org/), the Polymer team announces two big changes:

[Polymer 3.0 preview: npm and ES6 Modules — Polymer Project_While these changes will be significant, we’re committed to making the transition as seamless as possible. The Polymer…_www.polymer-project.org](https://www.polymer-project.org/blog/2017-08-22-npm-modules.html)

1. Polymer is moving from
**Bower to NPM**
\(with a twist, you need
**Yarn**
with a specific configuration\).
2. Polymer is switching to using
**ES6 modules**
instead of
**HTML Imports**

Suddenly, I feel like “it’s time to try it out!” \(I always feel the HTML import syntax looks weird\). Probably the marketing slogan works too, \#useThePlatform sound welcoming :\)!

On a serious note, wouldn’t it be good if you can building performant component using the platform? \(Polymer is not a framework. It’s a thin sugar layer to use the web-components\)

After going through the[Polymer 3.0 Preview hands-on](https://www.polymer-project.org/blog/2017-08-23-hands-on-30-preview.html)published by the Polymer team, I found a few things that doesn’t look “normal” for a typical AAV developer \(me\).

* _import statement with _
_**.js**_
_and import directly from_
_**node\_modules**_
_using relative path_
— It’s a minimalistic example. However, it’s not how we import in Angular, Vue and React “normally”. It’s the Bower way of import but it’s not how I normally work with modules.
* _HTML in JS —_
Personally, I prefer to separate the do HTML template unless the it’s so short \(
&lt;
10 lines\). Also, with proper syntax highlight.

Therefore, I decide to build a Polymer 3.0 project from scratch with the way I used to.

![](http://img2.tuicool.com/n6bMFbV.gif)

The GIF

