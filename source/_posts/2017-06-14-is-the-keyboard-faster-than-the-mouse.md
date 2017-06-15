---
title: Is the keyboard faster than the mouse?
---

**Is the keyboard faster than the mouse?**

Which is faster, keyboard or mouse? A large number of programmers believe that the keyboard is faster for all \(programming-related\) tasks. However, there are a few widely cited webpages that claim that “studies” show that using the mouse is faster than using the keyboard for everything and that people who think that using the keyboard is faster are just deluding themselves. This might sound extreme, but, just for example, one page says that the author has “never seen \[the keyboard\] outperform the mouse”.

But it can’t be the case that the mouse is faster for everything – almost no one is faster at clicking on an on-screen keyboard with a mouse than typing at a physical keyboard. Conversely, there are tasks for which mice are much better suited than keyboards \(e.g., aiming in FPS games\). For someone without an agenda, the question shouldn’t be, which is faster at all tasks, but which tasks are faster with a keyboard, which are faster with a mouse, and which are faster when both are used?

To start, let’s look at the cited studies to see where the mouse is really faster. Most references on the web, when followed all the way back, point to the AskTog, a site by[Bruce Tognazzini](https://en.wikipedia.org/wiki/Bruce_Tognazzini), who describes himself as a “recognized leader in human/computer interaction design”.

[The most cited AskTog page on the topic claims that they’ve spent $50M of R&D and done all kinds of studies](http://www.asktog.com/TOI/toi06KeyboardVMouse1.html); the page claims that, among other things, the $50M in R&D showed “Test subjects consistently report that keyboarding is faster than mousing” and “The stopwatch consistently proves mousing is faster than keyboarding. ”. The claim is that this both proves that the mouse is faster than the keyboard, and explains why programmers think the keyboard is faster than the mouse even though it’s slower. However, the result unreproducible because “Tog” doesn’t not only doesn’t cite the details of the experiments, Tog doesn’t even describe the experiments and just makes a blanket claim.

The[second widely cited AskTog page](http://www.asktog.com/TOI/toi22KeyboardVMouse2.html)is in response to a response to the previous page, and it simply repeats that the first page showed that keyboard shortcuts are slower. While there’s a lot of sarcasm, like “Perhaps we have all been misled these years. Perhaps the independent studies that show over and over again that Macintosh users are more productive, can learn quicker, buy more software packages, etc., etc., etc., are somehow all flawed. Perhaps….” no actual results are cited, as before. There is, however, a psuedo-scientific explanation of why the mouse is faster than the keyboard:

Command Keys Aren’t Faster. As you know from my August column, it takes just as long to decide upon a command key as it does to access the mouse. The difference is that the command-key decision is a high-level cognitive function of which there is no long-term memory generated. Therefore, subjectively, keys seem faster when in fact they usually take just as long to use.

Since mouse acquisition is a low-level cognitive function, the user need not abandon cognitive process on the primary task during the acquisition period. Therefore, the mouse acquirer achieves greater productivity.

One question this raises is, why should typing on the keyboard be any different from using command keys? There certainly are people who aren’t fluent at touch typing who have to think about which key they’re going to press when they type. Those people are very slow typists, perhaps even slower than someone who’s quick at using the mouse to type via an on screen keyboard. But there are also people who are fluent with the keyboard and can type without consciously thinking about which keys they’re going to press. The implicit claim here is that it’s not possible to be fluent with command keys in the same way it’s possible to be fluent with the keyboard for typing. It’s possible that’s true, but I find the claim to be highly implausible, both in principle, and from having observed people who certainly seem to be fluent with command keys, and the claim has no supporting evidence.

[The third widely cited AskTog page cites a single experiment](http://www.asktog.com/SunWorldColumns/S02KeyboardVMouse3.html), where the author typed a paragraph and then had to replace every “e” with a “\|”, either using cursor keys or the mouse. The author found that the average time for using cursor keys was 99.43 seconds and the average time for the mouse was 50.22 seconds. No information about the length of the paragraph or the number of “e”s was given. The third page was in response to a user who cited specific editing examples where they found that they were faster with a keyboard than with a mouse.

My experience with benchmarking is that the vast majority of microbenchmarks have wrong or misleading results because they’re difficult to set up properly, and even when set up properly, understanding how the microbenchmark results relate to real-world world results requires a deep understanding of the domain. As a result, I’m deeply skeptical of broad claims that come from microbenchmarks unless the author has a demonstrated, deep, understanding of benchmarking their particular domain, and even then I’ll ask why they believe their result generalizes. The opinion that microbenchmarks are very difficult to interpret properly is[widely shared among people who understand benchmarking](https://twitter.com/shipilev/status/709982588673388544).

The`e -> |`replacement task described is not only a microbenchmark, it’s a bizarrely artificial microbenchmark.

Based on the times given in the result, the task was either for very naive users, or disallowed any kind of search and replace functionality. This particular AskTog column is in response to a programmer who mentioned editing tasks, so the microbenchmark is meaningless unless that programmer is trapped in an experiment where they’re not allowed to use their editor’s basic functionality. Moreover, the replacement task itself is unrealistic – how often do people replace`e`with`|`?

I timed this task without the bizarre no-search-and-replace restriction removed and got the following results:

* Keyboard shortcut: 1.26s
* M-x, “replace-string” \(instead of using mapped keyboard shortcut\): 2.8s
* Navigate to search and replace with mouse: 5.39s

The first result was from using a keyboard shortcut. The second result is something I might do if I were in someone else’s emacs setup, which has different keyboard shortcuts mapped; emacs lets you run a command by hitting “M-x” and typing the entire name of the command. That’s much slower than using a keyboard shortcut directly, but still faster than using the mouse \(at least for me, here\) Does this mean that keyboards are great and mice are terrible? No, the result is nearly totally meaningless because I spend almost none of my time doing single-character search-and-replace, making the speed of single-character search-and-replace irrelevant.

Also, since I’m used to using the keyboard, the mouse speed here is probably unusually slow. That’s doubly true here because my normal editor setup \(`emacs -nw`\) doesn’t allow for mouse usage, so I ended up using an unfamiliar editor,`TextEdit`, for the mouse test. I did each task once in order to avoid “practicing” the exact task, which could unrealistically make the keyboard-shortcut version nearly instantaneous because it’s easy to hit a practiced sequence of keys very quickly. However, this meant that I was using an unfamiliar mouse in an unfamiliar set of menus for the mouse. Furthermore, like many people who’ve played FPS games in the distant past, I’m used to having “[mouse acceleration](https://www.google.com/search?q=mouse+acceleration)” turned off, but the Mac has this on by default and I didn’t go through the rigmarole necessary to disable mouse acceleration. Additionally, recording program I used \(quicktime\) made the entire machine laggy, which probably affects mousing speed more than keyboard speed, and the menu setup for the program I happened to use forced me to navigate through two levels of menus.

That being said, despite not being used to the mouse, if I want to find a microbenchmark where I’m faster with the mouse than with the keyboard, that’s easy: let me try selecting a block of text that’s on the screen but not near my cursor:

* Keyboard: 1.8s
* Mouse: 0.7s

I tend to do selection of blocks in emacs by searching for something at the start of the block, setting a mark, and then searching for something at the end of the mark. I typically type three characters to make sure that I get a unique chunk of text \(and I’ll type more if it’s text where I don’t think three characters will cut it\). This makes the selection task somewhat slower than the replacement task because the replacement task used single characters and this task used multiple characters.

The mouse is so much better suited for selecting a block of text that even with an unfamiliar mouse setup where I end up having to make a correction instead of being able to do the selection in one motion, the mouse is over twice as fast. But, if I wanted select something that was off screen and the selection was so large that it wouldn’t fit on one screen, the keyboard time wouldn’t change and the mouse time would get much slower, making the keyboard faster.

In addition to doing the measurements, I also \(informally\) polled people to ask if they thought the keyboard or the mouse would be faster for specific tasks. Both search-and-replace and select-text are tasks where the result was obvious to most people. But not all tasks are obvious; scrolling was one where people didn’t have strong opinions one way or another. Let’s look at scrolling, which is a task both the keyboard and the mouse are well suited for. To have something concrete, let’s look at scrolling down 4 pages:

* Keyboard: 0.49s
* Mouse: 0.57s

While there’s some difference, and I suspect that if I repeated the experiment enough times I could get a statistically significant result, but the difference is small enough that the difference isn’t of practical significance.

Contra Tog’s result, which was that everyone believes the keyboard was faster even though the mouse is faster, I find that people are pretty good at estimating what’s which device is faster for which tasks and also at estimate when both devices will give a similar result. One possible reason is that I’m polling programmers, and in particular, programmers at[RC](https://www.recurse.com/scout/click?t=b504af89e87b77920c9b60b2a1f6d5e8), who are probably a different population than whoever Tog might’ve studied in his studies. He was in a group that was looking at how to design the UI for a general purpose computer in the 80s, where it would have been actually been unreasonable to focus on studying people, many of whom grew up using computers, and then chose a career where you use computers all day. The equivalent population would’ve had to start using computers in the 60s or even earlier, but even if they had, input devices were quite different \(the ball mouse wasn’t invented until 1972, and it certainly wasn’t in wide use the moment it was invented\). There’s nothing wrong with studying populations who aren’t relatively expert at using computer input devices, but there is something wrong with generalizing those results to people who are relatively expert.

Unlike claims by either keyboard or mouse advocates, when I do experiments myself, the results are mixed. Some tasks are substantially faster if I use the keyboard and some are substantially faster if I use the mouse. Moreover, most of the results are easily predictable \(when the results are similar, the prediction is that it would be hard to predict\). If we look at the most widely cited, authoritative, results on the web, we find that they make very strong claims that the mouse is much faster than the keyboard but back up the claim with nothing but a single, bogus, experiment. It’s possible that some of the vaunted $50M in R&D went into valid experiments, but those experiments, if they exist, aren’t cited.

I spent some time reviewing the literature on the subject, but couldn’t find anything conclusive. Rather than do a point-by-point summary of each study \([like I did here for here for another controversial topic](https://danluu.com/empirical-pl/)\), I’ll mention the high-level issues that make the studies irrelevant to me. All studies I could find had at least one of the issues listed below; if you have a link to a study that isn’t irrelevant for one of the following reasons, I’d love to hear about it!

1. Age of study: it’s unclear how a study on interacting with computers from the mid-80s transfers to how people interact with computers today. Even ignoring differences in editing programs, there are large differences in the interface. Mice are more precise and a decent modern optical mouse can be moved as fast as a human can move it without the tracking becoming erratic, something that isn’t true of any mouse I’ve tried from the 80s and was only true of high quality mice from the 90s when the balls were recently cleaned and the mouse was on a decent quality mousepad. Keyboards haven’t improved as much, but even so, I can type substantially faster a modern, low-travel, keyboard than on any keyboard I’ve tried from the 80s.
2. Narrow microbenchmarking: not all of these are as irrelevant as the
   `e -`
   `>`
   ` |`
   without search and replace task, but even in the case of tasks that aren’t obviously irrelevant, it’s not clear what the impact of the result is on actual work I might do.
3. Not keyboard vs. mouse: a tiny fraction of published studies are on keyboard vs. mouse interaction. When a study is on device interaction, it’s often about some new kind of device or a new interaction model.
4. Vague description: a lot of studies will say something like they found a 7.8% improvement, with results being significant with p 
   &lt;
    0.005, without providing enough information to tell if the results are actually significant or merely statistically significant \(recall that the practically insignificant scrolling result was a 0.08s difference, which could also be reported as a 16.3% improvement\).
5. Unskilled users: in one, typical, paper, they note that it can take users as long as two seconds to move the mouse from one side of the screen to a scrollbar on the other side of the screen. While there’s something to be said for doing studies on unskilled users in order to figure out what sorts of interfaces are easiest for users who have the hardest time, a study on users who take 2 seconds to get their mouse onto the scrollbar doesn’t appear to be relevant to my user experience. When I timed this for myself, it took 0.21s to get to the scrollbar from the other side of the screen and scroll a short distance, despite using an unfamiliar mouse with different sensitivity than I’m used to and running a recording program which made mousing more difficult than usual.
6. Seemingly unreasonable results: some studies claim to show large improvements in overall productivity when switching from type of device to another \(e.g., a 20% total productivity gain from switching types of mice\).

#### Conclusion

It’s entirely possible that the mysterious studies Tog’s org spent $50M on prove that the mouse is faster than the keyboard for all tasks other than raw text input, but there doesn’t appear to be enough information to tell what the actual studies were. There are many public studies on user input, but I couldn’t find any that are relevant to whether or not I should use the mouse more or less at the margin.

When I look at various tasks myself, the results are mixed, and they’re mixed in the way that most programmers I polled predicted. This result is so boring that it wouldn’t be worth mentioning if not for the large groups of people who believe that either the keyboard is always faster than the mouse or vice versa.

Please let me know if there are relevant studies on this topic that I should read! I’m not familiar with the relevant fields, so it’s possible that I’m searching with the wrong keywords and reading the wrong papers.

Thanks to Leah Hanson for comments/corrections on this post and to Annie Cherkaev, Chris Ball, Stefan Lesser, and David Isaac Lee for related discussion.

  


