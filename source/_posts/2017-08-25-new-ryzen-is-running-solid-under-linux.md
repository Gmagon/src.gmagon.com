---
title: New Ryzen Is Running Solid Under Linux
---

As a quick update to the[AMD Linux "Performance Marginality Problem"](http://www.phoronix.com/scan.php?page=news_item&px=Ryzen-Segv-Response)affecting some early Ryzen processors under heavy load, today I received a new Ryzen 7 processor and indeed it's been running strong now for the past few hours under demanding load and has yet to hit the compiler segumentation fault bug.

![](http://img1.tuicool.com/QjYNjyq.jpg!web)

As a reminder about the issue, this performance marginality problem is exclusive to certain workloads such as running many Linux compilation tasks in parallel. Compiling most software you should be fine unless really hammering the system hardware. Under select conditions, the compiler may then produce a segmentation fault. Under normal Linux desktop workloads, gaming, etc, all Ryzen processors should work just fine. AMD has confirmed this issue doesn't affect EPYC or Threadripper processors, which we'll be testing soon, and for those Linux users affected by the problem they have been handling an RMA process via[AMD Customer Care](http://support.amd.com/en-us/contact/email-form).

![](http://img0.tuicool.com/amuMzya.jpg!web)

Today I received a replacement Ryzen 7 1800X along with the AMD Threadripper platform that will finally be tested under Linux on Phoronix in the days ahead. While as excited as I am for running the Threadripper 1950X with some fun Linux workloads across its 16 cores / 32 threads, I first popped in the Ryzen 7 1800X into the system previously exhibiting the compiler segmentation fault problem.

![](http://img0.tuicool.com/amu2uuM.jpg!web)

I've now been running this system all afternoon/evening with[the kill-ryzen script](https://github.com/suaefar/ryzen-test/blob/master/kill-ryzen.sh)and have not encountered any compiler segmentation faults or other problems for that matter. The same motherboard, cooling, BIOS, Linux installation, etc, were maintained the same as the previously affected configuration. Considering how easy it was to reproduce on the previous CPU, I feel pretty confident now this issue indeed is no more and just isolated to the CPU.

![](http://img0.tuicool.com/An67Jf7.jpg!web)

AMD has not provided an official public explanation of the fundamental problem, but from those inour forums and elsewhere, it appears to affect Ryzen CPUs manufactured prior to week 25. This Ryzen 7 1800X was from "week 30" where as my original Ryzen 7 1800X review sample was from "week 5" as well as the Ryzen 7 1700. TheRyzen 5 1400 that I bought via retail channels in June was manufactured in week 14. The Ryzen 3 1300X review sample was from week 20 and the Ryzen 3 1200 from week 25.

![](http://img0.tuicool.com/Ybemiuu.jpg!web)

Week 25 is the middle of June. The week number is shown on the processors in the second line as "UA 1705" where the 17 is representing the year and the next two digits showing the week, in this case 2017 week 5. I am unaware of any way that the date can be queried short of looking at the heat spreader.

I will continue running this Ryzen 7 1800X processor overnight but so far things are running solid under the enduring load thus far. With that, I am now very happy with Ryzen and still running the Ryzen on my main Fedora Workstation production system, even with a pre-week-25 model it's still fine for all of my day-to-day workloads; my only remaining critique of Ryzen outstanding is in regards to having Ryzen thermal monitoring support under Linux with no hwmon/thermal driver yet being available to read CPU temperatures. Stay tuned for AMD Ryzen Threadripper 1950X benchmarks on Phoronix in the next few days; Linux tests on AMD EPYC to follow after.



Source: [http://www.phoronix.com/scan.php?page=article&item=new-ryzen-fixed&num=1](http://www.tuicool.com/articles/hit/3aqEBfY)

