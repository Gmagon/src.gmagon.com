---
title: An argument for Electron
---

[![](https://res.cloudinary.com/practicaldev/image/fetch/s--sBo7qU41--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/a59iivu1kwepjxhv9b4g.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--sBo7qU41--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/a59iivu1kwepjxhv9b4g.png)

Electron, a popular framework that allows developers to write code once and deploy on multiple platforms like Mac, Windows, and Linux, has been under a state of[steady](https://josephg.com/blog/electron-is-flash-for-the-desktop/)[attack](http://sircmpwn.github.io/2016/11/24/Electron-considered-harmful.html)over the past year.

Those against it are rallying to hinder the speeds at which Electron is gaining adoption by new and established startups alike. Two of the most popular tools used by developers today are proudly built with Electron: Slack and Atom.

Opponents of Electron say that “it’s too memory intensive.” Or, “It hogs the CPU.” Or even better yet, “It runs the entirety of the Google Chrome engine in every window.”

Even more, anti-Electron posts are usually filled with charts and tables, along with screenshots of Activity Monitor with memory and CPU usage, outlining the evilness of the framework and why it must be stopped at all costs.

Focusing heavily on how it makes a robot computer feel, these posts ultimately neglect what will be the deciding factor in Electron’s success or failure: how it feels for most people to run Electron apps day-to-day.

### A User’s Perception

By no means am I 'most people'. I use a relatively advanced laptop: a 2016 MacBook with 16GB ram \(which came standard\). But advanced development machines of today are the entry level computers of tomorrow. Electron’s dream world would be one where every computer user had a luxurious amount of ram. But I think this world is fast approaching. Do we wait till then to begin taking advantage of a plentiful world, or do we start planning now?

If I were a convenience framework developer, I ought to be more concerned with_where the trend in memory is going_rather than_where it has been_. The computer industry has been stuck on 8GB for what seems like far too long, but a 16GB standard reality is imminent, if not inevitable.

I can speak for myself when I say Electron runs like a dream. On a typical day, I’ll have about three Atom windows open, a multi-team Slack up and running, as well as actively using and debugging my own Electron-based app Standard Notes. I’ll also have a bunch of other non-Electron apps opened or running, like Adobe Photoshop, three Terminal windows with 3–4 tabs each, Sequel Pro, Google Chrome with on average 4–5 tabs, Apple Mail, iMessage, Little Snitch, Dropbox, and iTunes/Apple Music.

So, how does it feel to run this bloat train of death every day?

Well, it feels like_nothing_.

I don’t notice it. My laptop doesn’t get hot. I don’t hear the fan. I experience no lags in any application. My music plays seamlessly. I can watch an HD YouTube video without problem. My screen doesn’t flicker. I get notifications. I download new apps and update old ones.

I go about my day, and Electron doesn’t get in the way.

### The Business Case

But aside from how it makes end-users feel, there is an arguably more important perspective to be had: how it makes software companies feel.

For context, the project I work in is an open-source cross-platform notes app that’s available on most platforms, including web, Mac, Windows, Linux, iOS, and Android. All the desktop applications are based off the main web codebase, and are bundled using Electron, while the iOS and Android app use their own native codebases respectively, one in Swift and the other in Kotlin.

And as a new company without a lot of resources, this setup has just barely allowed us to enter the marketplace. Three codebases is two too many codebases to maintain. Every time we make a change, we have to make it in three different places, violating the most sacred tenet of computer science of keeping it DRY.

As a one-person team deploying on all these platforms, even the most minor change will take at minimum three development days, one for each codebase. This includes debugging, fixing, testing, bundling, deploying, and distributing every single codebase. This is by no means an easy task.

Sometimes, a prospective user tells me that this app is exactly what they were looking for but “Sorry, I don’t use Electron apps.”

If I were speaking candidly, perhaps I’d say “I regret to inform you that the world you imagine could not exist.”

Let us entertain this user’s wishes by simulating the parallel universe where a small software shop can develop natively on every single platform.

This would mean hiring a total of six experienced developers. Let’s ignore the madenning tediousness of having to make every minor change six times on six different platforms, and focus instead on the costs. With an average salary of $150k \(probably more for the hard to find like Mac developers\), and ignoring the massive cost of finding and hiring these developers, that’s a total of $900,000 in development costs every year.

For a bootstrapped, non-VC funded company, this quite literally isn’t an option.

Or actually, maybe it is. You can just pass the cost down to your customers.

Let’s assume a goal of two thousand paying subscribers after 12 months of operation. If we wanted to make a company-wide profit of only $100k, this would mean charging each user $500/year or $42/month. Do you want to pay $500 a year for a notes app?

I dare say that these conditions will constrict any new startup looking to introduce a cross-platform solution to the marketplace, and the amazing app that could have been will never be made in the first place.

Perhaps the devil’s deal is not so bad then? You get something, instead of nothing. That’s always good. Two, you get it for a decent price \($36/year for the notes app\). And three, you get it on every platform you love to use, with web access in most cases as an added bonus.

My bet is that with the favorable conditions that it affords new startups, along with increasing memory availability in personal computers, Electron will continue to see increased adoption by companies and users alike.

---

_If you’re a developer, you can learn more about Electron_[_here_](https://electron.atom.io/)_._

_You can also see some of the apps proudly built with Electron_[_here_](https://electron.atom.io/apps/)_._



Source: https://dev.to/bitario/in-defense-of-electron

