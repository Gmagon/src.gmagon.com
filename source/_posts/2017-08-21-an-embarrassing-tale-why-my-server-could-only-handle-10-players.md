---
title: 'An Embarrassing Tale: Why my server could only handle 10 players'
ogImage: http://img0.tuicool.com/YzeQF3m.png!web
---

What might be even more embarrassing is that at one point I had convinced myself that 10 players per server was normal.

It all started with an idea at the beginning of the summer. I was standing in my room trying to think of an io game to make \(I decided if I were to make a game, I constrained myself to making an io game for maximum viral potential — that’s a thing, I swear\). So, I began analyzing what made certain io games \(agar.io, slither.io, etc.\) addictive. I was finding comparisons and 1similarities between such games as seen in the picture below.

![](http://img2.tuicool.com/MfMNjeJ.png!web)

“Would Joey play it?” -

&gt;

 Joey is my little brother in middle school. Writing this question on the board forced me to always make a decision with the end users \(users of the Joey type\) in mind. Smart huh.

Finally, after a little more brainstorming, I landed on[knckout.io](http://knckout.io/). It’s the name of the game. Try to stay on the map, and knock others off. I loved it. Simple controls, clear objective, and a beautiful game mechanic.

After laying out how I wanted the game to look and feel, I got to work. I would come home from my summer internship everyday, workout, then code. I first got the player to move how I wanted. Then I handled the boosting. Then the collisions, etc. Finally the game was all done and ready to be tested out by the public. Or so I thought…

Last weekend \(about a week ago\), I was all amped and ready to show the world what I made. So I took to the interwebs and found a small subreddit called ‘playmygame.’ I wrote up a short summary and[posted](https://www.reddit.com/r/playmygame/comments/6tr4o2/knckoutio/)it \(p.s. in the post’s comments you can clearly see I was stressing about the ability of my server\). I waited patiently, then HUZZAH! A player had joined. We were going back and forth, at each other in the game. All the meanwhile, I was stressing and worried about what this player was thinking. After this player lost all his/her lives and was booted from the match we were in, I waited to see if he/she would come back. And the player did! But even better: the player set his/her name to “ilikethisgame.” My eyes grew wide and I had a rush of adrenaline! I was the happiest boy in the world. Soon other players joined and some left comments on the reddit post: more players said they had enjoyed the game! I was ecstatic. Then I checked on how my server was holding up \(on 8/15\)…

![](http://img2.tuicool.com/Ef6Njij.png!web)

From a 1 GB, 1 vCPU Digital Ocean NYC server running Ubuntu NodeJS 6.9.5 on 14.04

It felt like someone knocked the wind out of me. Is this real? This has to be fake, I thought to myself. Just two games and the server is having a hard time processing them. I started thinking about where I went wrong in my code. I thought collision detection, for sure, has to be the bottleneck. But, I was already using quadtrees to help narrow down the number of collision detection passes. I had to do some dirty work, so I spun up a new Digital Ocean server to use as my development server. I then, temporarily disabled collision detection completely and saw the problem was still there.

Okay, if collision detection was not the problem, then what else could it be? I thought about how much information I was sending from the server to each client every second. I have this broadcast function that sends out the state of the game every 22 ms to each client. In this function, I was unnecessarily filtering out the given client’s local player in an ‘allPlayers’ property, just to put the local player in its own property. So, not only was I putting a for loop \(the filtering\) in another for loop \(the broadcast for each client\); I was customizing the data to be sent out by this broadcast function for each client. This customization is not necessary. I should just be able to send out the state of the game, to everyone, with no customization. Everyone should get the same data \(and the data should not be tailored to a specific client\). This has to be where the CPU is being eaten up. So I optimized this function, pushed it up to the dev server, and checked the CPU graph. No fix.

With my ignorance, I began to convince myself that ~10–20 players per 1 core server was good. Now, how do I come to such a conclusion? Well, my extreme confidence in my technical abilities was clearly blinding me from reality. I stumbled onto a[post](https://news.ycombinator.com/item?id=13266692)where the creator of agar.io said his 1 core server can handle about 190 players. I quickly snapped out of it.

The next culprit I had lined up was: socket.io. I was using socket.io to manage the real-time communication between the client and the server. I had heard before that socket.io was not as lightweight as other alternatives. Back in the day, if you wanted to send a message asynchronously, you had to implement some sort of hack: long polling or flash sockets. This was because not all web browsers supported websockets. However, most browsers have native support now. But, in order for socket.io to establish a connection, it first does so by using one of the available hacks mentioned and then upgrading the connection if the client supports a better way. Even though websockets is already widely supported. This approach comes at the expense of cpu and memory. But not as much as I had thought…

I hopped online and naively typed “socket io cpu problem” into Google. The first couple results were entitled “[node.js — How to debug Node + Socket.io CPU Issues — Server Fault](https://serverfault.com/questions/498707/how-to-debug-node-socket-io-cpu-issues)” and “[node.js — Socket.io node server using high cpu — Stack Overflow](https://stackoverflow.com/questions/8687434/socket-io-node-server-using-high-cpu?rq=1).” My eyes lit up. I was reassured that this was the culprit to my problem. However, I clicked on the former article and the author mentions he’s dealing with ~1500 concurrent socket connections. I’m no math major but 20 players is significantly less than 1500 players. Just for the heck of it, I switched my server-side node app to use[tiny websockets](https://github.com/uNetworking/uWebSockets)and switched the client-side node app to use native websocket support right inside the browser. I pushed the changes up to the dev server, and checked the CPU graph. No fix.

My morale was at an all time low. I began to cringe every time I had to check the darn cpu graph. I thought I was never going to get that blue line to stop running away from me. This was the only time I ever felt completely incapable of handling some technical task. But then it happened…

I was sitting in front of the cpu graph wallowing in my misery when I noticed something. It didn’t matter how many full games were running or how close together they were all started. The cpu was increasing steadily at a constant rate. I had never stayed around long enough to observe this. Memory leak!

I scanned my code, line by line, looking for the bug \(which I should have done at the very beginning\). There it was.

In my game, an event is an object that captures info about a death, a boost, a collision, etc… So an event is created every time one of those things happens. I have this loop that goes through each event and updates it. Its called every 16 ms. After an event fulfills its duty, it is supposed to be deleted. Keywords: “supposed to”

Bingo. I had memory piling up as well as an increasing amount of unnecessary for-loop passes. I inserted a line of code and voila!

![](http://img0.tuicool.com/YzeQF3m.png)

well i’ll be

Huge sigh of relief.

My next task is to see just how many games \(4 players per game\) one server can smoothly support now \(I know its at least 12 games, but I have not tried more yet\). Now that I know the number of events makes a huge impact to CPU… what will happen in production when all players are firing off boosting, collision, and death events every second? My tests have not accounted for that. Also, after this post goes viral, and my game follows suit, I will need to quickly scale the number of servers available. I will make that the topic of a future post along with: “How knckout.io grew to millions of players.” Follow me here for updates. :\)



Source: [https://medium.com/@jasonchitla/an-embarrassing-tale-why-my-server-could-only-handle-10-players-3b83b6fa8136](http://www.tuicool.com/articles/hit/VZzqMz3)

