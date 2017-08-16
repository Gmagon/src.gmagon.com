---
title: Power outage hits the island of Taiwan. Here’s what we learned.
---

At approximately 4:50pm local time \(8:50am UTC\) August 15, a major unexpected power outage hit the island of Taiwan with a significant amount of its power generation facilities going down.

## Blackout!

Most of the island was hit with power outages, shortages and rolling blackouts, with street lights not functioning, nor power in many of Taipei’s shopping malls, and much other infrastructure.

Blackouts of this scale are very rare. Usually, during an outage of this scale, it would be expected that Internet traffic would greatly drop, as houses and businesses lose power and are unable to connect to the Internet. I’ve experienced this in the past, working at consumer ISPs. As households and businesses lose power, so do their modems or routers which connect them to the Internet.

However, during yesterday's outage, something different happened. I'd like to share some insights from yesterday's outage.

![](http://img0.tuicool.com/fuuU3aQ.jpg!web)

Photo: Taipei 101 Dark during the Blackout -

Source:[David Chang/EPA](https://www.upi.com/Top_News/World-News/2017/08/15/Taiwans-economic-minister-resigns-amid-nationwide-blackout/9031502816439/)

## Even when the power is out, the Internet still operates

Most Telecom and Data Center facilities are built with redundancy in mind and have backup power generation. Our Data Center partner,[Chief](http://www.chief.com.tw/), was able to switch to backup power generation without any service interruption, allowing our service to operate without interruption.

The lack of interruption was also reflected by many users still accessing the Internet. From our statistics, the number of requests didn’t drop, as illustrated by the graph following. At the beginning of the power outage, there was actually a spike in requests, as more people likely look on the Internet as to more details of what's happening. The graph below shows a timeline of requests per second, seen in our Taipei data center, with a red line marking the beginning of the power outage.

![](http://img1.tuicool.com/nIZJZ3Z.jpg!web)

Breaking down traffic between Mobile and Desktop clients, approximately 10% of clients shifted from Desktop to Mobile devices at the beginning of the outage. The graph also shows a spike daily around lunch time, as many clients shift to their mobile phones during lunch.

![](http://img1.tuicool.com/j6vmYrI.jpg!web)

The shift to to mobile devices did however cause a drop in bandwidth used, by approximately 25%. The following graph showing our bandwidth usage to HiNet, the largest ISP, demonstrates this sharp drop.

![](http://img2.tuicool.com/BBRbmiF.jpg!web)

Power was fully restored around 21:40pm, \(13:40 UTC\), however many users were able to regain access during power-rationing and Internet usage grew to reach its usual night-time peaks.

This power outage taught us that Internet usage does not necessarily decrease during a power outage in 2017. Number of requests can actually increase, but bandwidth usage drops, reflecting a shift to usage of mobile devices.

Whilst the entire city lived in darkness, the Internet shined bright!



Source: [https://blog.cloudflare.com/power-outage-taiwan/](http://www.tuicool.com/articles/hit/Fjiaumr)

