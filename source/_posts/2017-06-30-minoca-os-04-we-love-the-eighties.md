---
title: 'Minoca OS 0.4: We love the eighties!'
---

![](http://img0.tuicool.com/AzmmqmR.png!web)

fceux running on the first Minoca OS X server

We’re pleased to announce the release of version 0.4 of Minoca OS. In the eight months since we released 0.3, our very first open source release, a lot has changed. Most notably Minoca is now sporting the\_early\_signs of a desktop. And of course no desktop would be complete without an application to run on it. So we’ve added[fceux](http://www.fceux.com/web/home.html), an NES emulator, which we used to test both graphics performance and sound. Hopefully you’ll be better at Super Mario Brothers than Chris, who I watched blatantly kill Mario probably upwards of 50 times in the name of testing sound. Here’s what, how, and why we did it.

For those who have never heard of us before, Minoca OS is a new operating system built completely from the ground up. It’s designed to be lean, portable, modular, and modern \(NES emulator notwithstanding\). We’re trying to do more with less, so devices with limited power and resource budgets can get full OS functionality with minimal overhead.

### What’s New

Some new drivers in 0.4:

* AHCI \(the controller usually behind your SATA port\)
* e1000 \(Intel gigabit networking driver\)
* USB and PS/2 mouse
* Intel HD Audio and Raspberry Pi PWM audio

Some new third-party packages worth noting:

* Xorg-server
* SDL
* fceux \(NES emulator\)
* miniDLNA
* Mesa3D \(software rendering\)
* GTK+

You can grab the latest OS images on ourdownloads page. Bugs and feature requests can be filed on our[GitHub](https://github.com/minoca/os)page. You can fire up X for yourself by running “opkg update; opkg install fceux xinit; startx”.

### Motivation

First of all I’d like to say a huge thank you to everyone who tried out Minoca OS since we went open source back in November. An even bigger thank you goes to the intrepid folks who submitted bugs and pull requests on our GitHub page. Chris and I really appreciate that, please continue to do it!

One of the requests we seemed to get a lot was “where’s the GUI” or “can I run this graphical application XYZ?” When we launched 0.3 we had done no work towards a graphical environment, mostly citing the fact that accelerated graphics are hard. That’s still true, and we still don’t have accelerated graphics \(remember these are the\_beginnings\_of a desktop\), but we were curious to find out how far out we were from having some sort of basic graphical environment.

The goal here was not to put out 0.4 with the message of “behold, the glorious desktop GUI has arrived”, but rather to provide the elements and building blocks for people familiar with compiling software to potentially make progress on their own.

### All Roads Lead to X

Our initial thought was actually to port over DirectFB, a Linux library for interacting directly with the frame buffer. In fact we went so far as to port DirectFB to Minoca. Things fell apart a bit when we went looking for applications built on top of DirectFB. There aren’t so many of those. Wayland/Weston looks super cool and new, but it also appeared to be pretty Linux-specific, so it didn’t seem like the ideal choice to start with. No, everything graphical seems to compile against X. The ancient terrifying medusa that is X. It was on the very bottom of my mental list of possible options, but it was becoming clear that it really was the\_only\_option.

X is not just one thing that you download and compile. It’s composed of over a hundred different packages. As developers of a new OS, we generally feel it’s a pretty good day if we’ve added one or two new packages. The idea of adding over 100 new packages even if they all ported perfectly seems daunting. And though we’ve worked hard to build a POSIX compatible C library, life has a way of not going that smoothly.

### Into the Abyss

There’s really no way to check and see if you’re going to get stuck on a missing OS feature in package number 67 of 140, you just have to start building and hope the obstacles are surmountable. The chapter on X in the[Linux From Scratch](http://www.linuxfromscratch.org/blfs/view/svn/x/installing.html)book is a precious map in an otherwise endless labyrinth. I have no idea how anyone built the X server before that book. Most of it isn’t super Linux-specific, with some light editing they could call it “Any OS From Scratch”.

It also helps that nearly everything is autoconfed. Not that I don’t struggle with autoconf and especially libtool, but I’d say autoconf and I have an “understanding” with each other. It’s the devil I know, at least.

The first batch of 25 or so packages contain mostly headers. A warmup round to get your fingers loose, I suppose. Then comes another batch of 30 or so library packages. To my surprise these seem to go by pretty smoothly, and even cross compile!

I hit my biggest obstacle with Mesa, the 3D graphics library responsible for libraries like libGL. Mesa was one of the few non-Xorg packages in the quest for the X server, and required some monkeying to get right. Supplying the right configure parameters for a non-Linux software-only pipeline that the X server was happy with took some trial and error. There were also a few OS-specific bits of code that needed the obligatory “and here’s Minoca, too” code snippets. The nastiest[barb](https://bugs.freedesktop.org/show_bug.cgi?id=35268), which I’d only discover later, was their forced use of the “initial-exec” thread-local storage model. I know this was done in the name of performance, but it leaves a bit of a mess for the OS designers, who either have to 1\) accommodate it with a brittle “might work for Mesa but I hope no one else does this” kind of hack, or 2\) force programs using libGL to load it on initial program load, which the X server wouldn’t have ordinarily done. We went for option 2, which leaves you feeling only slightly less dirty.

The remaining packages leading up to running an X server went surprisingly smoothly. My compliments to the Xorg developers. Xterm, a non-Xorg package, required a bit of work. There are some code bases that have a “shove your OS in here with ifdefs” vibe to them, xterm is one of those. It’s usually pretty easy to do, but it never feels very good.

### Minoca I/O

In theory we had a running X server, but given that X couldn’t display video or receive input, there wasn’t much proof. I added Minoca framebuffer support, and wrote an input driver to allow X to gather keyboard and mouse events from the kernel. This also required actually adding mouse support to Minoca, including a USB HID parser. After some false starts, I was presented with this beauty:

Source:　[https://blog.minocacorp.com/minoca-os-0-4-we-love-the-eighties-170a93112db1](http://www.tuicool.com/articles/hit/yyYNjyB)

