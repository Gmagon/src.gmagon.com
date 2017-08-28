---
title: seven things I have learned about writing software
---

![](https://tctechcrunch2011.files.wordpress.com/2017/08/the-graduate.jpg?w=738)

It’s happening. Bit by bit, little by little, I’m morphing from an engineer into some kind of…manager. Oh, don’t get me wrong, I still write code every day; but I find myself spending more and more time in analysis and discussion, in meetings and calls, making higher-level decisions, trying to organize teams, and worrying about strategy rather than tactics.

Of course this is no bad thing. Higher-level decisions tend to have far more impact than the nitty-gritty of individual classes and functions. Making a team more productive has much higher leverage than just making myself more productive. But I like to think I’ve learned a few lessons from my years of writing code. I hope they’ll mostly translate to managerdom. And I hope you’ll pardon the implicit arrogance of sharing them with you:

**1. There are no rules; there are only koans**

Let me give you an example: DRY, aka “Don’t Repeat Yourself.” It is so well understood as a fundamental rule of software that it often justifies decisions by itself; “I did X because DRY.” It makes sense, doesn’t it? If you have two or more pieces of code which do the same thing, you are being wasteful, and furthermore, if you need to change one of them, you probably need to change the other, and you might forget, and when they get out of sync you’ll get a weird bug, and… and… and it’sobviousthat you don’t repeat yourself.

And yet. After some years of applying that rule one begins to wonder about its universal applicability. Suppose you have two methods which contain the same block of code, so you pull that block out into a separate function. All too often, those methods then begin to evolve in divergent ways … so you find yourself adding more arguments to that function, and perhaps more flags to its results … and the coder who comes along next has the cognitive overhead of that separate function, with all its caller-specific arguments and results … and you realize that if youhadlet yourself repeat yourself, and had let those two blocks naturally grow into separate things, your resulting code would have been vastly simpler and more intuitive.

Does this mean DRY is bad? Of course not! DRY is correct. …Usually. …Under the appropriate circumstances. …Well, maybe. My personal rule of thumb is: “repeating yourself once is OK, more than once is not OK … but that depends on the context.” Becauseeverythingdepends on the context. The purpose of DRY is not to DRY. If that is what you believe, grasshopper, you still have much to learn. The purpose of DRY is to make youthinkabout DRY. There are no rules; there are only koans.

\(Let me reiterate: I’m talking aboutsoftware. Hardware rules, in my experience, tend to actually be yes-we-mean-it rules. That’s pretty much why I got out of electrical engineering and into software.\)

Consider two of my favorite “laws” of computer science. First: “There is no problem in computer science that cannot be solved by adding another layer of abstraction!” Is this true? Well, no, not literally. Is this frequently phenomenologically true? Well, actually, yeah. Does this mean abstraction is therightway to solve any problem? No it does not. It’s a koan. Brood on it.

And my all-time favorite: “The first law of optimization: don’t do it. The second law of optimization \(For Exports Only\): don’t do ityet.” This of course is explicitly a koan, snarkily referring itself to a law. Is it time to make your code run faster? No. Is it time to make your code run faster? Notyet. What does this mean? It means consider the time, the complexity, the cognitive overhead, the tangible results, the overall goals, the meaning of life, the purpose of human existence. It means: meditate on it, grasshopper. But not for too long. We have work to do.

**2. Earn trust by trusting**

This doesn’t just apply to managers, although itespeciallyapplies to managers, as trust is really the only thing of value that you have; if your fairness, your judgement, your understanding, your good faith, etc., are not trusted, then the rest of your organization will treat you as damage and route around you. Whereas if you’re a capable but untrustworthy developer, you might still have some value, although it’ll be much undercut by the effort spent riding herd on every decision you make.

The larger point is, though: a team needs to trust one another. When Natascia says, “I’ll take care of that ticket,” you have to trust that she will. When you say, “Peter can cut the build before the deadline,” you have to trust that this is true. When someone says, “Listen, I have a crazy idea,” they have to trust that they will be taken seriously and treated with respect, even if the idea is kinda crazy.

How do you build and earn trust? The answer is simplicity itself: you trust. You trust the person who says they can learn this new library and get it integrated by Monday. You trust the person who says they need to leave early and miss tomorrow’s[standup](https://techcrunch.com/2016/08/06/stand-up-against-the-stand-up/)because of a family thing. You trust the person who wants to take a week’s vacation a month before the hard deadline because they feel like they’re beginning to burn out. You trust the junior developer who says they’d like to take a crack at the hard problem.

You won’t always be right. Sometimes people do in fact operate in bad faith, and you need to unveil those people and let them go as soon as possible. And sometimes you will trust people who will try in good faith to succeed… and they will fail. But — counterintuitively — this is usually a win, in the long run. Because those people will remember your trust, and they will do everything they can to pay it back with interest.

**3. Simplicity is much more important than elegance**

I mean, I get it. I love tight, elegant code too. And I love flexible frameworks with so many levels of abstraction that they’re ready to handle, out of the box, whatever change request might be thrown at them. I like using bit vectors and bit shifts and slightly abstruse data structures and that quirky little language feature that isn’t widely known but issouseful under these particular circumstances.

But you’re not writing this code for yourself. Not even if it’s “just a prototype.” \(I’ve lost track of how many of my “prototypes” have wound up in production under a few layers of paint and polish.\) And you’re not just writing it to solve the current problem. You’re writing it so the next developer who comes along can use it to solve the next problem. If those five lines of code would be understood more readily if they were ten lines of code, you know what, maybe fifteen would be better.

You can try and solve it for them in advance, with a flexible framework full of abstraction! …But maybe prophecy is not your strong suit; maybe your notion of what the next problem is is completely off base. Maybe the best thing is just to make your code dead simple, with a naming convention and a coding style that makes it read almost like English. Maybe instead of adding another class, another file that the next developer has to keep open while trying to follow your flow of control, you should just do things the dumb way, the inelegant way, thesimpleway.

**4. Momentum matters more than most things**

We’ve all seen it happen. One week everyone’s checking in code, the build is visibly taking shape, features are being added every day, test coverage keeps mounting higher and higher, Slack is alive with productive ideas and solutions. And the next week … somehow … things seem to have slowed down. A decision is needed on Issue A, which has knock-on effects on Issues B, C, and D, and while peoplecanwork on D, E, and F, they aren’t part of the logical sequence of development; more assumptions have to be made, the cognitive load is higher, you have to mock out a bunch of things to get any non-mock code written at all. Somebody needs to make that decision.

Or maybe it’s not decision paralysis. Maybe all that progress you made last week was built on a false foundation of quick-hit technical debt, and you need to stop everything and go back and refactor it, and you need to do itnowbecause the longer you wait, the worse things will get. Nobody wants to hear that. But they’ll like hearing that now better than hearing that next month. Go tell them.

Or maybe last week was too much like crunch and now everybody’s just a little burnt out. You know what? Give them a day off. A whole day off. Each. It’ll save you time in the long run, I promise.

It’s hard to define; it’s hard to measure; it’s hard to talk about. But momentum is a very real thing in software development, and its loss is a leading indicator of some kind of root trouble that needs to be addressed. Don’t ignore it, and don’t hope or pretend it will magically come back. Know the warning signs and act soon.

**5. Work with people who complement you, not with people who are like you**

Every time I see something about people hiring for “cultural fit,” I roll my eyes violently. You know what happens to most monocultures? They encounter a pathogen they don’t know how to deal with, and they die.

You don’t want all your developers and your designers and your QA people and your product people and your sales people and your executives to be clones of one another. You really, really don’t. Everyone has strengths and relative weaknesses. Everyone has virtues and flaws. You want to hire people for their chief strengths, and letotherpeople’s strengths counteract their relative weaknesses.

Take me. I write code fast, I communicate well and read and write prose ridiculously fast, I’m conversant in like a dozen programming languages and frameworks at any given moment, I understand things quickly and thoroughly, I have a great breadth of experience; …and I’m a broad generalist without serious, intense, in-depth mastery of any particular field, framework, or language; I’m an architect who really benefits from others tracking all the flesh and polish that need to be added once the skeleton is constructed; and I’m so UX-blind \(“Wait, you mean those fields aren’t aligned already?”\) that it’s something of a running joke among my co-workers.

People like me are hard to find, and super in demand… and a company that consisted of me and nine of my clones would be completely doomed from the get-go. Oh, we’d do a lot of things really well; but it only takes one collective blind spot, one disastrous lacuna, to kill a company. Most people would concede that there are things they can’t do well, that other people probably need to take care of. These are often the same people who look for “cultural fit” and try to hire people just like them. It is to weep, and/or laugh.

**6. Any decision is better than no decision**

Don’t dither. When in doubt, do something. OK, this may not apply to promoting code into production, but it applies to every other aspect of software development. We work in the most hyperaccelerated industry in history. We live in a world of exponential growth. Time is not on your side. Don’t waste it.

This is as true of high-level discussions as of low-level decisions. At the high level, the dicussion “should we implement feature A, or B? Should we do it X way, or Y?” all too often lead to “Let’s think this over… let’s have a call about this next week…” or, most insidiously, “let’s research what other people have done and then talk about it again.” In rare conditions, one of those is the right answer. In most conditions, the right answer is for someone to say, “I’ll decide which one we’ll try by the end of the day, so we can start building it tomorrow.”

Even if A is ultimately the wrong answer, the decision to start building A is probably better than no decision at all. This is counterintuitive. It is also usually true. What isalwaystrue is that a very good way to understand A substantially better is to actually start building it, and that this understanding will likely lead you to a better decision.

If anything this is even more true of low-level decisions. “The spec doesn’t say how we should handle error condition X, or what the error message should be for this.” \(Specifications often seem to be written for an aspirational utopia in which error conditions are as rare as unicorns.\) “I know, I’ll just stick a comment in and go back and ask what they want done in that case!”

This is tempting. No one can accuse you of doing anything wrong, if you do this. But it is the wrong thing to do.  
Better to go ahead and makesomedecision about this yourself, even if it is crude and ugly, then to do nothing and go back and ask about it. Let them iterate on work you’ve already done and lessons you’ve already learned, even if you know it’s not great, rather than making them start from cognitive scratch. They and the project will both be better for it. Be quick to experiment … and quick to change course.

**7. Be humble, but swagger**

You don’t have all the answers. EvenI, and I say this with what must by now be evident reluctance, don’t have all the answers. Heck, I don’t even havemostof ’em, though I feel moderately confident that given sufficient time and effort I could figure most of them out…

…And so could you. We can’t all be Jeff Dean, or Satoshi Nakamoto, or Margaret Hamilton. We work in a field rife with both real geniuses and ersatz self-proclaimed ones, where nobody knows everything and everybody is acutely aware of all the things theydon’tknow.

Fortunately — for the most part — we’re not scientists. Our job is not to make breakthrough discoveries. Our job is to put others’ discoveries into practice; to make things work, hopefully in the service of something that people actually want. Maybe you’ll never invent anything like a Bloom filter or a Merkle tree. But neither will the vast majority of the people you work with, and besides, that’s not the point; the point is touseBloom filters and Merkle trees, and/or the even easier layers of abstraction built atop them, to actually get shit done.

So while it’s wrong to assume that you know more than the person across the table, that their counterintuitive idea is crazy, that their language of choice is terrible — it’s also wrong both to assume that they know more than you, or, even if they do, that that matters. The world is full of smart, knowledgeable people who are for some mysterious reason incapable of actually getting shit done. \(It’s a cheap joke, but what the hell, I’m going to make it: that’s why we have academia.\)

So if you’re a person who gets shit done, don’t be humble when faced with a dizzying array of theoretical knowledge, and/or when faced with a kindred spirit who happens to get even more shit done than you. At the end of the day it’s the developers in the proverbial trenches, building and testing and deploying code, who actually make things happen; and, speaking as someone who finds himself drifting away from those trenches, you have every right to look down just a little bit on those who are not there digging with you, and to greet all those who are as collaborators rather than superiors.

Source: https://techcrunch.com/2017/08/27/one-morning-when-gregor-samsa-woke-from-troubled-reams-he-found-himself-transformed-in-his-bed-into-a-manager/

