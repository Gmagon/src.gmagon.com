---
title: Why I Hate Slack and You Should Too
---

Yeah, that’s right: there’s finally something I feel so negatively about that I’m unsatisfied hating it all by myself; I want_you_to hate it, too. So let’s talk about why Slack is destroying your life, piece by piece, and why you should get rid of it immediately before its trail of destruction widens any further—in other words, while you still have time to stop the deluge of mindless addiction that it’s already staple-gunned to your life.

### 1. It encourages use for both time-sensitive and time-insensitive communication

A Long Thyme Agoe, in the Days Before Slack, I had three different ways of being contacted, and they served three very different purposes, with radically different interrupt priorities. I had emails, which could wait; I had phone calls, which couldn’t; and I had the company IRC server, which was usually where I went to waste time by sharing links to things that either made me get_very_angry or made me laugh hysterically.In this system, the important, time-sensitive thing can interrupt me, and everything else can’t. That’s great for productivity and great for my sanity, and the people were happy and things were good.

Slack totally just trashed everything. It’s email and phone calls and cat pictures, all rolled into one. So_sometimes_Slack notifications are totally not time-sensitive_\(`@here`Hey I need coloring books for my niece, any suggestions? also she’s afraid of animals clowns food people and dinosaurs and also allergic to paper kthxbye!\)_, and_sometimes_they require an immediate action_\(`@here`Dr. Poison just showed up and tl;dr maybe run for it idk?\)_—and until I’ve read the message, I have_absolutely no idea whether it deserves my immediate attention_. That order’s backwards and it makes me feel bad because it_is_bad.

This is actually a whole thing in psychology: if you give a mouse food every time they push a lever, they’ll eventually only push it when they’re hungry, but if you only give them food_sometimes_when they push a lever, then the “reward uncertainty” will actually cause them to push the lever_more often_.And hey! Here we are, all checking Slack 23,598 times a minute for each notification, because who knows, maybe_this_one matters. It’s all the pain of Vegas with none of the reward and somehow we’re_still_hooked.

So unlike before, now I get interrupted constantly, and I_have_to break my flow to figure out whether getting interrupted was worthwhile, and for some reason this is supposed to_enhance business productivity_.

Right. Sure. You go on being you, Slack.

### 2. It cannot be sanely ignored

_“Okay, pea-brain,”_you mutter,_“so just turn off Slack notifications when you need to focus for awhile, and catch up later.”_

I once thought as you did, but part of the reason you end up addicted to Slack is that catching up on what you’ve missed feels very similar to when you were back in college and were a day before the final and suddenly realized that your plan of not highlighting the book or taking notes all semester may’ve been a Bad Idea™. About the only way Slack bothers grouping information is by room—and as anyone who’s been trapped in a heavily-used Slack system can tell you, the room names and descriptions are at best weak guidelines, so you can’t even necessarily prioritize what to catch up on even at_that_gross level of granularity.Nope: your only option is going to be to read_the entire backlog, from start to finish_, or else just accept that, at some distant point three months from now, you’re going to look like a complete idiot when you’re the only one didn’t know that all employee blood was now going to be collected for occult purposes.

Granted, this isn’t Slack’s fault_per se_, at least insofar as_every_chat system has this problem, but Slack’s attempt to become your One True Source of Everything, from scheduling to reminders to SharePoint replacement to company directory, means that a_huge_amount of information that previously would’ve been in emails ends up in Slack, and_only_in Slack. And that’s a very deliberate decision by Slack to make themselves utterly indispensable, so I feel very comfy screaming at them until I go hoarse.

### 3. It cannot be sanely organized

Okay fine, so you read through the whole backlog from your vacation, which took you barely even 70 hours, and have extracted the six actual to-do items from it, one of which involves something about pentagrams and goats that you’ll decipher later. Great. Mazel tov. Phase one complete.

Now what? Slack has no meaningful way to organize those six messages. There aren’t folders. There isn’t a meaningful “do later” pile. \(There’s`/remind`, to be fair, but, as noted previously, that just generates more notifications, which we’re trying to avoid. Theoretically.\) So you’re left with…what, exactly? Right-clicking on each individual message at the end of the chain, copying the link, and pasting that into some external to-do app? Which, of course, when you click back on the link, will require you to re-read at least_some_amount of unstructured backlog, including a bunch of unrelated garbage about reconfiguring CARP on the edge servers and something about epoll and multithreading and a panda birth video that just happens to be there, just to remind yourself what everyone said?

Welcome to hell. Population: all Slack users.

### 4. It’s proprietary and encourages lock-in

In an ideal world, I could circumvent a lot of these issues in any number of ways. For example, I’m still active in open-source sometimes, and the open-source equivalent of Slack is \(usually\) still IRC. But IRC, being a well-documentedolder system, has_tons_of different tools to extract data from it. If I want to be nerdy, I can yank individual messages from[ERC](https://www.emacswiki.org/emacs/ERC)straight into[org mode](http://orgmode.org/), or write custom scripts for[WeeChat](https://weechat.org/), or use any of literally dozens of clients written in Ruby and Python and Io and Java and C\# and thousands of other programming languages plus also JavaScript and do really bespoke things. And even if I don’t, the plethora of macOS and Windows clients means that an off-the-shelf or trivially customizable AppleScript or WSH solution is never far away.

But Slack is Slack, and Slack is Electron, and Electron is Chrome—Chrome surrounded by an unscriptable posterior that eats up 100 MB of RAM per channel, plus an extra 250 MB for each Giphy.And while I can_almost_script my way out of this hell, I really can’t. Not as a mortal end-user, anyway. To the extent I_can_do anything, I need to write directly against the[Slack API](https://api.slack.com/), rather than using something commonplace like XMPP or IRC, so goodbye portability. And even if I’m willing and able to write against the proprietary API, a lot of the more interesting things you can do require being an organization admin, and require being enabled globally for the entire instance. So goodbye, personalized custom integration points, and hello, one-size-fits-zero webhooks. This is my life now.

### 5. Its version of Markdown is just broken

I’m going to use up an entire heading purely to say that making`*foo*`be**bold**and`_foo_`be_italic_is covered in Leviticus 64:128 and explicitly punishable by stoning until death.

### 6. It encourages use for both business and personal applications

All this would be merely infuriating and drive me into a blind murderous rage if it were just something I dealt with at work, but_oh no,_now the_fun_groups I interact with are turning to Slack! That’s right: the same application and environment that makes a full-blown Dementor-style kiss with my attention span for work can now corner me in a back-alley when I just want to shoot the breeze with friends.

I glance at the Slack icon. I have nine unread messages. Neat. Are they from work? I should probably actually go read those and see which ones require I do something. Are they all the ex-employees of that one company I used to work for? It’s probably a bunch of political screaming about stochastically sentient Cheetos that somehow won the presidency, and I’m honestly a bit tired of reading about that at this point.But at any rate, I can’t know until I take my phone out and read the notification—and sometimes_even then_I can’t, since of course some of the people I talk to are on multiple Slack instances and have a habit of saying things like “`@bmp`did you look at this it’s really concerning?” which requires I actually load up the freaking client and find the instance and the message and finally learn to my utter horror that I shall never be given up, let down, or run around/deserted.

### Give up and yield unto~~Cthulhu~~Slack, destroyer of focus

Stop using Slack. I hate it; you also should hate it. It’s distracting. It murders productivity. It destroys old tools. It exploits psychological needs in such a way that it kills your soul and hangs it up to dry over a lava pit, where the clothesline catches fire and your soul falls into the fire and somehow you’re not dead, just a zombie, forever, reading zombie notifications on your zombie iPhone and wondering whether “`@here`brains?” is a lunch invite or an insult until you read the backlog. Friends do not let friends use Slack. I have been utterly convincing and you should listen to me in my capacity as low-grade Internet celebrity and do what I say because mindlessly obeying authority is the right thing to do.

But realistically? We’re all still using Slack, because it’s there, and we have to, and it’s the best option according to our collective judgment, which I do have point out may empirically be lacking at this point. So if we_are_stuck in Slack, then maybe, just maybe, we could start trying to restore Slack to a place where it’s genuinely for ephemeral ideas. Where it’s indeed the place for_ad hoc_conversations, but not a canonical store for their conclusions and action items. Where I_don’t_have to read the backlog when I come back from vacation, because anything actionable will at worst have been duplicated as an email or a Trello card or what have you. Where I can disable Slack notifications because I can know, with certainty, that any activity can wait until I’m back at my computer and actually_want_to spend time chatting on Slack.

In the meantime I’ll be right back because either the data center just exploded or someone posted a picture of a goat fainting and The Notification God must be placated.



Source: [https://bitquabit.com/post/i-hate-slack-and-you-should-too/](http://www.tuicool.com/articles/hit/IvUb6nq)

