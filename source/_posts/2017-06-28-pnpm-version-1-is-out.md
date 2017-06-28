---
title: pnpm version 1 is out!
---



## _pnpm_version 1 is out!

Today we’re excited to announce the release of[pnpm](https://github.com/pnpm/pnpm)1!

Why only now? The initial commit to pnpm was made byRico Sta. Cruz on[Jan 27, 2016](https://github.com/pnpm/pnpm/commit/4b42e5fcc402310d028ac54ba8fe979f7c4470af). It was based on the ideas of[ied](https://github.com/alexanderGugel/ied)by[Alexander Gugel](https://twitter.com/alexanderGugel)with initial commit on[Aug 6, 2015](https://github.com/alexanderGugel/ied/commit/d8bae2d63750030b019e9653ce9ea71de93be5c7)!

Unlike_Yarn_, which has decided to use the same**node\_modules**structure that_npm_creates,_pnpm_uses a completely new approach \(about which you can read more inthis article\). It was_really_hard to make a symlinked**node\_modules**structure work with most of the existing npm packages! All the different problems that we have encountered and the dozens of breaking changes we had to make, deserves a post of its own. Finally, almost 2 years since the idea of a symlinked**node\_modules**structure has born, we can tell with confidence: it is possible and**it does work**.

### So what does version 1 mean?

Version 1 means that:

* The
  [store structure](https://github.com/pnpm/pnpm/blob/master/docs/about-the-package-store.md)
  that pnpm uses since
  [version 0.70](https://github.com/pnpm/pnpm/releases/tag/v0.70.0)
  is reliable enough and we are confident that there will be no need in breaking changes in its structure.
* [The**node\_modules**layout](https://github.com/pnpm/pnpm/blob/master/docs/symlinked-node-modules-structure.md)
  that pnpm creates works with most of the ecosystem.
 
  _pnpm@1_
  also ships with an experimental
  **node\_modules**
  layout that can be turned on with the
  [independent-leaves](https://github.com/pnpm/pnpm#independent-leaves)
  config. The experimental layout boosts installation speed by 8% and works almost with all projects. However, we were not confident enough to make it the default yet.
* The format of the
  **shrinkwrap.yaml**
  file, which is pnpm’s lockfile, is good enough for being committed to VCS.
* When possible,
  _pnpm@1_
  works the way
  _npm@5_
  does.

You can rely on these things and they won’t get breaking changes in version 1.

### What’s next?

Even faster!The goal is to make installations_subsecond fast_. So fast that it would run on every Git operation. Maybe one day it would be even integrated to Git?!

As of now, pnpm is faster than Yarn when installing with cold cache but may be a bit slower in different scenarios. For a detailed comparison of npm/pnpm/Yarn speed, see “[Why I still don’t use Yarn](https://intoli.com/blog/node-package-manager-benchmarks/)”. However, there is no reason for pnpm to be slower than Yarn or npm. So we’ll have to find the issues and make pnpm faster.

Simpler codebase.pnpm is currently very hard to contribute to, so it will have to be split into separate packages. The first step will probably be separation of the installation engine.

PR.Although pnpm is public for a longer period of time than Yarn, it is far less popular. So more articles, more documentation, and more interesting tools will be created to promote pnpm. Let’s make our[awesome list](https://github.com/pnpm/awesome-pnpm)huge!

### Try it

Just install pnpm via npm:`npm install -g pnpm`. And use it instead of npm whenever you want to install something:`pnpm i foo`.

Also, you can read more info at the[pnpm GitHub repo](https://github.com/pnpm/pnpm). You can follow[pnpm on Twitter](https://twitter.com/pnpmjs)or ask for help at the[pnpm Gitter Chat Room](https://gitter.im/pnpm/pnpm).

Source: [https://medium.com/pnpm/pnpm-version-1-is-out-935a07af914](http://www.tuicool.com/articles/hit/euQnUn7)

