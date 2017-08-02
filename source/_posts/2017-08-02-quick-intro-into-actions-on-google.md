---
title: Quick Intro Into Actions on Google
---

Google Home will finally be available in Germany on August, 8th and in France this week. I’m not aware of more announcements for other countries, but I hope and assume that availability will increase to many more countries as soon as possible.1\)

For me, though, getting my AIY kit was the day, I started getting interested in

[developing with Actions on Google](https://developers.google.com/actions/)

.

![](http://img0.tuicool.com/yyQj637.png!web)

Google’s AIY kit

### Different types of Interfaces

Conversational interfaces is a very broad term. It covers all kind of chats whether voice is used or not up to pure voice interfaces like those used in Google Home.

Actions on Google supports text based interfaces – and depending on the capabilities of the devices – a limited set of visual feedback and touchable actions. I will cover those differences and how to detect which capabilities the device in question has, in later posts. On a mobile the text can be entered either by keyboard or by voice. With Google Home it obviously can only be entered by speaking to the device.

BTW: You can expect the assistant to appear in other devices as well. Be it IoT devices, cars or anything else where a voice interface can be useful. As you have seen in the first picture of this post, Google’s AIY kit itself uses Actions on Google \(or can be made to use it\). How to achieve this is also the topic of an upcoming post.

### Two SDKs for The Google Assistant

When it comes to the Google Assistant, there are two very different offerings by Google:

* The Assistant SDK and
* Actions on Google

#### Assistant SDK

With the[Assistant SDK](https://developers.google.com/assistant/sdk/)you can enable devices to embed the Google Assistant. This means that it allows you to add the Google Assistant to a device made by you. It also allows you to change the way the Assistant is triggered on your device – for example you can use a button press instead of the “OK, Google” phrase.

The SDK is[gRPC](https://grpc.io/)based, which is a protocol buffer based message exchange protocol. It has tons of bindings for a plethora of languages. As a sample \(and for practical use as well\) complete Python bindings for certain linux based architectures already exist.

If you are creating devices and want to integrate the Assistant into those, than the Assistant SDK is the SDK of your choice. The AIY kit, shown in the picture above, is running the Assistant SDK on a Raspberry Pi. I will get into this SDK in a follow-up post.

#### Actions on Google

With[Actions on Google](https://developers.google.com/actions/)your can create apps for the Google Assistant. The remainder of this post is all about this option.

### Two options to use Actions on Google

When developing apps for the Google Assistant, there too exist two options:

* Use the Actions SDK directly
* Use a service on top of the Actions SDK

Google gives you a recommendation as to when to use which option on its[“Build an app in 30 minutes”](https://developers.google.com/actions/building-your-apps)guide.2\)

#### Using the Actions SDK

The Actions SDK allows you to directly access the recognized user text and to deal with it in your backend. It is suited for either very simple projects with clear commands or if you are sufficiently proficient in natural language processing.

#### Using api.ai or other services on top of the Actions SDK

Most often using a service is the better option. It’s not that the Actions SDK itself is particularly complex. The problem lies more in how to detect what the user intends with his response and how to parse the text to get relevant data. This is where those services shine. You enter some sample responses by the user and the services then not only understands these sentences but many, many more that resemble those sentences but use different wording, a different word order or a combination of both. And they extract the data you need in an easily accessible format. Consider understanding dates – which is not even the most complex example. You have to understand “next week”, a specific date given, abbreviations, omissions and many more. That’s the real value of these services.

One such service is[api.ai](https://api.ai/)which was bought by Google last fall. As such it’s only natural that this service supports Actions on Google quite nicely. In addition to this you can use api.ai also for other platforms like Alexa, Cortana, Facebook Messenger and many more. I will cover api.ai thoroughly in future posts.

You are not limited to api.ai, though. One contender is[converse.ai](http://www.converse.ai/index.html)which I haven’t had the opportunity to test, yet. The visual design of converse.ai’s conversation flow has some appeal but whether it’s practical and overall as good as api.ai, I cannot tell. But hopefully I will be able to evaluate it while continuing with my Actions on Google posts.

### Let’s put things into perspective

Even though conversational interfaces seem to be all the rage lately, they are not really new.

Actually they are quite old.[Eliza](https://en.wikipedia.org/wiki/ELIZA)was programmed by Joseph Weizenbaum in the sixties and created quite a stir back then. You can[try it out](http://www.masswerk.at/elizabot/eliza.html)on dozens on websites for yourself.

My first experience was the fictional interface shown in the film Wargames, 1983:3\)You can see the part where this screenshot is taken from on[YouTube](https://www.youtube.com/watch?v=KXzNo0vR_dU). Okay, those were the eighties, so it might feel strange to most of you ��

![](http://img0.tuicool.com/VZr6jmz.png!web)

A screenshot of a Wargames scene \(1983\)

And of course there was Clippy in the late nineties, the worst assistant ever:

![](http://img0.tuicool.com/rqAvum7.png!web)

Microsoft’s Clippy

So if they are not new, why then_are_they all the rage? Well, luckily we have progressed from there on and nowadays we have all kind of chatbots integrated into messengers and other communication tools, we have website assistants that pop up if we ponder for a while on a particular page and we have true voice only interfaces like Amazon’s Alexa and Google Home.

And those are powered by a much better understanding of human language, of the intents of the user and how to find and combine important entities of the user’s spoken text.

The Google assistant works for voice only devices \(like Google Home\) or with some visual add ons on phones or other devices with a touchscreen.

### Wrap up

This was a very quick rundown of the Actions on Google options. In coming posts I am going to show you the base concepts like actions, intents and fulfillment, how to make use of api.ai, what tools and libraries Google provides, how to connect to your home devices, what permissions are needed for within the Assistant and how to make use of the Assistant from within Android Things.

And in the meantime I’m going to talk about this stuff on upcoming devfests ��

Stay tuned!



Source: [http://www.grokkingandroid.com/actions-on-google-quick-intro/](http://www.tuicool.com/articles/hit/uuea2i2)

