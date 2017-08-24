---
title: Chaos caused by Facebook Patents Grant License
---

The popular React Javascript library from Facebook, amongst other open source projects from them, has a license \(3-clause BSD license\) and a patents grant. Recently, the Apache Software Foundation declared that this license + patents grant belongs to Category X. The licenses in Category X means that projects that are part of the ASF \(Apache Software Foundation\) umbrella cannot use libraries or code that are licensed under those licenses.

![](https://sourcecontribute.files.wordpress.com/2017/08/facebook-patent-grant-causing-chaos.png )

The patents grant basically amounts to this:

> The patent grant says that if you’re going to use the software \[Facebook\] released under it, you lose the patent license from us if you sue \[Facebook\] for patent infringement

This means that if you’re usingReact.jsin your startup’s code and later on down the line, Facebook patents something related to your startup and you try to sue them for patent infringement, then Facebook revokes the patent license. Their reasoning for this is that it will prevent patent trolls from suing Facebook but this doesn’t make much sense. There are other ways to protect themselves from patent trolls and it feels like this chaos is much more punishing to the open source communities around Facebook’s code.

[Another alternative is that Facebook could support campaigns to end software patents](https://en.wikipedia.org/wiki/Software_patent_debate).

The prominent example is CouchDB which was usingReact.jsfor their UI and is now looking for a replacement, which will likely be [Preact](https://preactjs.com/). The commentary on reddit and hacker news has been deafening and close to unanimous. Almost all developers are against the patent grant and will be hesitant to use any Facebook code that carries that license and PATENTS file.

It seems like Facebook decided on this approach around 2 years ago and they considered one of their alternatives as “stop contributing to open source”. At the end of the day, Facebook is a business that uses open source to further their goals; they can choose not to contribute or close things up \(which Google and Apple and others have done over the years\).

**If you’re looking to switch away from Facebook’s projects, here is a partial list of projects that include the poorly-considered patent protection:**

* React.js
* Jest
* Yoga \(which was mentioned earlier in the SourceContribute blog\)
* prepack
* React-Native
* Relay
* Redex
* Flow type checker
* osquery
* bistro
* proxygen
* fboss
* wangle
* draft-js
* ds2
* reason
* infer
* litho
* FBSimulatorControl
* DataLoader
* Fresco
* Recipes-For-AutoPkg
* regenerator
* fbshipit
* mcrouter
* metro-bundler
* fatal
* react-devtools

While the PATENTS file has been around for 2 years in some of these projects, its implications have only been thought through recently. This is why it’s important for all open source projects to have a clear LICENSE file in their repositories and to clear up any potential confusion as early as possible.

Source: [https://sourcecontribute.com/2017/08/23/facebook-patents-grant-license-is-causing-chaos/](https://sourcecontribute.com/2017/08/23/facebook-patents-grant-license-is-causing-chaos/)

