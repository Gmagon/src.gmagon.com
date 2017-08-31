---
title: Zork Deep Reading
---

This past weekend a screenshot went around Twitter \(my part of Twitter at least!\)

![](http://img0.tuicool.com/biUJ3qF.jpg!web)

```
weight = num_items * Max_held_mult;
if( weight <= random(100) ) ?label8;
print "You're holding too many things already!";
new_line;
rfalse;
.label8;
move noun to player;
```

\(--[@icculus](https://twitter.com/icculus/status/901568322021593088), Aug 26\)

The clear reading of this code \(as the screenshot says\) is that the inventory limit in Zork 1 is random, not a fixed number of items. Each item you pick up makes it_more likely_that you'll hit a "holding too many things" error. But since it's a random chance, you can just try again -- it might work next time.

This was passed around in a commentary cloud of "This game was unfair," "games in the 80s were terrible," and so on. \(See[this NeoGAF thread](http://www.neogaf.com/forum/showthread.php?t=1424158), for example.\)

This is fascinating! I played Zork, as I played all the Infocom games, and I didn't remember this inventory detail. It felt_dimly familiar_when I was reminded of it, though.

Research time!

## Is it true?

That's the first question, of course. Let's try it.

```
>i
You are carrying:
A rope
A nasty knife
A brass lantern (providing light)
A clove of garlic
A lunch
A brown sack
A glass bottle
The glass bottle contains:
A quantity of water
A jewel-encrusted egg
A leaflet

>get sword
You're holding too many things already!

>get sword
Taken.
```

It's true! It's true!

Here I'm playing Zork 1, revision 88, serial number 840726. This is by far the most common version you'll find today, because it was the version included on the_Lost Treasures of Infocom_CD. You can play it today on[iOS](https://itunes.apple.com/us/app/lost-treasures-of-infocom/id577626745?mt=8)\(at least until iOS11 hits\) or on[GOG](https://www.gog.com/game/the_zork_anthology). Or I'm pretty sure you can find it with a web search.

## But is it evil?

Well, that's a more complicated question.

If you look at the[Twitter thread](https://twitter.com/icculus/status/901568322021593088), you'll see that the code snippet is taken from[this source code listing](http://web.archive.org/web/20041022074235if_/http://netmagi.net:80/~agarvin/zork1.txt)\(wayback link from 2004\). Let's look at a larger chunk of this file:

```
if( parent(noun) in player ) ?label4;
weight = QueryWeight(noun);
if( (weight + QueryWeight(player)) <= Load_max ) ?label4;
if( ~~vb ) ?label5;
print "Your load is too heavy";
if( Load_max >= Load_allowed ) ?label6;
print ", especially in light of your condition.";
jump label7;
.label6;
print ".";
.label7;
new_line;
.label5;
return 2;
.label4;
if( Verb ~= ##Take ) ?label8;
num_items = CCount(player);
if( num_items <= Maximum_held ) ?label8;
weight = num_items * Max_held_mult;
if( weight <= random(100) ) ?label8;
print "You're holding too many things already!";
new_line;
rfalse;
.label8;
move noun to player;
```

Here it becomes apparent that there are_two_independent limit tests when you pick up an object. First it checks the sum of your weight and the weight of what you're picking up. This is a_constant_test: the sum must be less than`Load_max`\(100 pounds\), or it displays the error "Your load is too heavy." \(If you're wounded, the weight limit decreases.\)

Then it checks the number of items you're holding. This is the randomized test, but there's a safety zone: anything up to`Maximum_held`\(7 items\) is safe. In fact, if you're carrying 7 items, the next TAKE command is safe. Beyond eight items, the chance of failure is`num_items * Max_held_mult`\(N\*8\) as a percentage.

So this is already less evil than it looked at first. You can carry up to 100 pounds and eight items, but the item limit is soft -- you get some wiggle room on that.

More trivia:

* Object weights range from 2 \(the leaflet, matchbook, etc\) to 55 \(the gold coffin\).
* Weight is figured recursively -- objects in a container still count towards the weight limit.
* Object count is
_not_
recursive, so you can work around the "too many things" error with careful sack-management.
* Worn clothing is counted as weight 1. But there is no clothing in Zork 1, so this doesn't help you much!
* The original MIT Zork/Dungeon game, the predecessor to Zork 1/2/3, did not have the item count check \(randomized or otherwise\). It only checked total weight.

## So is Zork 1 evil?

Of course it's evil! There's a_thief_who can_walk into the room and kill you!_Or steal vital equipment from you and hide it in an inaccessible room! Your lamp dies after 385 turns! Evil, sheesh.

But that's not a complete answer.

Remember that we are looking at the dawn of computing gaming history. The very idea that_a videogame should be fair_, or even_winnable_, was hazy. It was perfectly normal for a game to just get harder and harder until it killed you. \(Think Pac-Man, Asteroids, etc.\)

The adventure genre has always presented itself as "solvable", but of course that is itself a subjective standard. Through the 1980s, we took for granted that solving a game took repeated attempts -- death after death, retry after retry, mistake after mistake -- learning \(hopefully\) a little each time. Today we say "[masocore](https://www.giantbomb.com/masocore/3015-1165/)"; back then it was just the way games were. The thief was an annoyance. "Unfair" sequencing, like being able to accidentally destroy or lose a crucial object, wasn't even worth a blink.

\(Jason Dyer has been going through the[adventure games of the 1970s](https://bluerenga.wordpress.com/all-the-adventures/); there's also the[Digital Antiquarian](http://www.filfre.net/sitemap/). Those blog series give an excellent introduction to just how arbitrary, buggy, and poorly tested a lot of those early games were. Remember, Infocom's canon stood out for being_much better than the rest_. Honest.\)

The soft item count limit, taken as a game mechanic, wasn't unreasonable. In particular, you can't say it was a trivial annoyance whose only purpose was to make the player retype a command. Wasting a turn is a_meaningful_penalty in Zork. Your lamp is slowly dying; the thief is out there wandering. If you run into that "too many items" error, you've failed at inventory management. You should have paid more attention and put something in your sack first.

Was inventory management a good game design idea? Well, no. I thought it was annoying and tedious then; Istill think so today. But it was part of the Zork ethos, and the item limit was part of the inventory system.

## Are we really looking at the Zork 1 source code?

Excellent question! Always question hot takes you see on Twitter. The answer is "yes, sort of."

The[Zork file](http://web.archive.org/web/20041022074235if_/http://netmagi.net:80/~agarvin/zork1.txt)we've been discussing is_not_the source code that Lebling and Blank wrote at Infocom circa 1980. Rather, it is a disassembly of the Z-machine game file that Infocom sold. \(And which can be found on the_Lost Treasures_CD, etc.\)

The[Z-machine format](http://inform-fiction.org/zmachine/standards/z1point1/index.html)was never published by Infocom, but it was reverse-engineered around 1990 and is now well understood. You can find tools which disassemble the Infocom game files \(and Inform game files, for that matter\). I use`txd`, found in the[ztools](http://ifarchive.org/indexes/if-archiveXinfocomXtoolsXztools.html)package.

Run`txd`on the Zork 1 file, and you'll see... raw Z-machine assembly code. The`txd`output for the function we've been discussing looks like:

```
L0003: GET_PARENT G76 -> -(SP)
JIN (SP)+,G6f [TRUE] L0007
CALL R0241 (G76) -> L03
CALL R0241 (G6f) -> -(SP)
ADD L03,(SP)+ -> -(SP)
JG (SP)+,G85 [FALSE] L0007
JZ L00 [TRUE] L0006
PRINT "Your load is too heavy"
JL G85,G86 [FALSE] L0004
PRINT ", especially in light of your condition."
JUMP L0005
L0004: PRINT "."
L0005: NEW_LINE
L0006: RET #02
L0007: JE G78,#5d [FALSE] L0008
CALL R0240 (G6f) -> L01
JG L01,G3b [FALSE] L0008
MUL L01,G3a -> L03
RANDOM #64 -> -(SP)
JG L03,(SP)+ [FALSE] L0008
PRINT "You're holding too many things already!"
NEW_LINE
RFALSE
L0008: INSERT_OBJ G76,G6f
```

If you compare this to the code above, you can see they behave the same. But the game file is_compiled_code. All the symbols -- the variable and function names -- have been stripped out.

So where did that original file, with its nice labels, come from? If you go back to the twitter thread, you'll see:

Holy crap, you pulled that literal code from my horrible, horrible decompiler output from the early 2000s!

\(--[@allengarvin](https://twitter.com/allengarvin/status/901855235257364480), Aug 27\)

Allen Garvin started with that raw disassembly. Then he laboriously figured out what each line did, and gave every function and variable an appropriate label. \(Not, of course, the same labels that the Infocom authors used!\)

As Allen's tweet implies, we've been looking at a crude, early attempt. He has a[much cleaner Zork 1 source file](http://plover.net/~agarvin/zork1.txt)posted today:

```
if (parent(noun) notin player) {
weight = QueryWeight(noun);
if (weight + QueryWeight(player) > Load_max) {
if (vb) {
print "Your load is too heavy";
if (Load_max < Load_allowed) {
print ", especially in light of your condition.";
} else {
print ".";
}
new_line;
}
return A_FAILURE;
}
}
if (action == ##Take) {
num_items = CCount(player);
if (num_items > Maximum_held) {
weight = num_items * Max_held_mult;
if (weight > random(100)) {
print "You're holding too many things already!";
new_line;
rfalse;
}
}
}
move noun to player;
```

It does exactly the same thing, but it's much more readable, right? It's also recompilable Inform 6 source code.

## What about the Zork 2 stuff?

In the swirling tweet-gyre, Jason Scott \(noted[Infocom historian](http://getlamp.com/)!\) wrote:

The main thing is, I am coming to the conclusion that what this really is Zork II's FUMBLE spell effects on you.

\(-- @[textfiles](https://twitter.com/textfiles/status/902244042615992324), Aug 28\)

\(FUMBLE is one of the curses that the Wizard of Frobozz casts on you. But the Wizard doesn't show up until Zork 2.\)

Jason points out that the Infocom games re-used parser code all the time. It was a big chunk, essentially a library, and the Infocom authors copied and pasted it from one game to the next. \(Remember that detail about clothing?\) In fact, if you look a little farther down the original Zork 1 file, you'll see:

```
.label8;
move noun to player;
give noun visited;
Zork2_deletion();
ScoreObj(noun);
rtrue;
```

In fact the whole Zork 1 parser is studded with`Zork2_deletion()`calls. But, on the other hand, we've seen that the randomizer_really does_take effect in Zork 1. So Jason is right about re-used code, but wrong about the FUMBLE curse theory. \(Sorry!\)

So what's going here?

First of all, remember that`Zork2_deletion`is a label that Allen Garvin added. The compiled game file just has a do-nothing call to an empty function.

Why did Allen use that label? If you look at a disassembly of Zork 2, there's a very similar routine, but it has some extra code that can print the message "When you touch the \[noun\] it immediately disappears!" This has to do with the FANTASIZE curse, which makes you hallucinate fake objects.

It's pretty clear that both games \(and probably Zork 3\) were compiled with a common parser library. But the library was rigged a lot of special curse conditions which were only compiled in when building Zork 2. \(`#ifdef`code, we'd say today.\)

The randomized item limit was_not_one of these curses. It really did apply in both games.

Most of Infocom's games had inventory limits, but the form varied.

* Enchanter: Weight and item limit, just as in Zork 1.
* Zork 3: Weight and item limit, with a twist: "Oh, no. The \[obj1\] slips from your arms while taking the \[obj2\] and both tumble to the ground."
* Lurking Horror: Weight and item limit, but not randomized.

And so on.

\(Yes, I keep all the Infocom game files in disassembled form, to answer questions just like this. But no, I'm not going to go through and catalog the inventory limits in every single one.\)

## Conclusions

This post has gotten really long and I haven't figured out a conclusion for it. \(Yes, you say, like so many other blog posts...\) Well, try this:

Detail matters. And comparing different versions of the same file can be surprisingly interesting.



Source: http://blog.zarfhome.com/2017/08/your-load-is-too-heavy-zork-deep-reading.html