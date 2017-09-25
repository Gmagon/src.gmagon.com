---
title: Duck Duck Go-Illusion of Privacy 
---

![](http://img1.tuicool.com/3MJ7Zf.jpg!web)


There have been

[several](http://venturebeat.com/2013/06/13/prism-fears-give-private-search-engine-duckduckgo-its-best-week-ever/)

[articles](http://www.nbcnews.com/technology/wary-tracking-users-flock-duckduckgo-6C10321830)

in the press recently about users flocking to DuckDuckGo in the wake of the recent NSA snooping revelations.

If you are in this category this post is meant for you.

If you use DuckDuckGo solely for the myriad of other benefits, such as reducing advertiser tracking, filter boxing, etc. move along nothing to see here.DuckDuckGo will provide you at least that level of “privacy”. 

**Update: **Wow, I didn't expect this blog post to spread so widely.  First of all, let me say to those accusing me of hating on DDG, I am a DDG user.  I think they have a great service.  This post is solely about the misconception that seems to have spread primarily from[The Guardian](http://www.guardian.co.uk/world/2013/jun/19/nsa-fears-duckduckgo-search-engine)article that DDG can somehow protect you from NSA monitoring.

DDG stated, "We literally do not store personally identifiable user data, so if the NSA were to get a hold of all our data, it would not be useful to them since it is all truly anonymous."  I would like to direct readers to[this article](http://news.cnet.com/8301-13578_3-57593538-38/how-the-u.s-forces-net-firms-to-cooperate-on-surveillance/)which basically nullifies whatever protection DDG thinks it can provide, or you the reader think you have.



## Standard Wiretaps

DuckDuckGo can easily be compelled either under the Communications Assistance for Law Enforcement Act \(CALEA\), standard court orders, or by secret orders from the Foreign Intelligence Surveillance Court \(FISA\) to provide tap-on-demand.I don’t think anyone can dispute that.If you are specifically targeted in an investigation, you can bank on the fact that all of your searches and their history “going forward” after the court order will be collected on you and stored.

Google has at least a transparency report detailing the number of non-FISA requests it receives and now a “ballpark” reporting of FISA requests.Users should demand the same of DuckDuckGo.

![](http://img0.tuicool.com/qaIvQr.jpg!web)

**Deep Integration**

DuckDuckGo has made a lot of hay about their privacy, but like many other technology companies they have remained silent about their collaboration, if any, with law enforcement and security agencies.

Why shouldn't they?They are reaping the benefits of an uninformed populace flocking to their service to avoid the NSA dragnet.The privacy they offer is privacy from third-party advertisers and cross-site tracking.



The MarCom departments of big players like[Google, Yahoo!, Microsoft and others are getting good at crafting extremely carefully worded denials](http://abcnews.go.com/Technology/nsa-prism-dissecting-technology-companies-adamant-denial-involvement/story?id=19350095#.Ud-fl_bnrGw)through lies of omission.

DuckDuckGo says:

DuckDuckGo does not store any personal information, e.g. IP addresses or user agents

But what if DuckDuckGo provided a splitter-feed to the NSA?DuckDuckGo can claim without lying that they store no personal information, but that speaks nothing of a collaborating partner storing it.

Can they refuse to collaborate with the NSA if approached?If one looks at the recent reports about Yahoo! and others the answer is “No, you cannot”.[Yahoo! apparently made concerted efforts to resist, sending lawyers into battle, and ultimately \(and silently\) lost the fighting the FISA Court.](http://www.pcworld.com/article/2044080/yahoo-says-release-of-secret-fisa-court-order-will-prove-it-resisted-directives.html)“Silently” because their loss and the ruling that handed it down is also secret.

Assume, nay bank on, the fact that corporations located within the United States can be and are being compelled to participate in programs like PRISM and are legally powerless to refuse.

![](http://img2.tuicool.com/FfYBRv.jpg!web)

## The NSA Can’t Lose

Let’s be realistic, if services start popping up on the internet that shield substantial amounts of communications from the NSA that the NSA thinks is valuable, how long to you think the NSA will allow that to persist before making efforts to abate it?

What can they do?

According to the Washington Post a NSA initiative called “Upstream” siphons off of “communications fiber cables and infrastructure as data flows past” at all the major “choke points” of the internet.So, we can assume that the NSA has access a substantial amount of ingress and egress packets to DuckDuckGo.

However, DuckDuckGo is using SSL encryption.Without DuckDuckGo's private SSL certificate, your search queries \(but not your location\) are invisible.What is a spy agency to do?

What is a SSL certificate key after all?It’s simply a small block of data, often in the form of a file.And it’s a file that must be installed on every webserver or load-balancer in a data-center.If you possess DuckDuckGo’s cert, you can decrypt all traffic to DuckDuckGo.The NSA could get the DuckDuckGo master cert in one of three ways:

1. Be given the cert
2. Physical access to servers or load-balancers
3. Remote access to servers or load-balancers

Let’s eliminate \(1\) for the sake of argument.

**Option 2**

Many smaller internet companies, including DuckDuckGo, do not operate their own data-center, but instead are “hosted” in another provider’s datacenter.In DuckDuckGo’s case, they are[hosted](http://www.radabg.com/url/duckduckgo.com/)by[Verizon Internet Services](http://help.webhosting.verizon.net/).We’ve all learned about the[cozy relationship](http://www.huffingtonpost.com/2013/06/05/nsa-verizon-phone-records_n_3393466.html)between the NSA and Verizon, it is quite imaginable that Verizon would simply give them access to a DuckDuckGo server, or the load-balancer which is likely owned and operated by Verizon and upon which the SSL decryption key is installed.They don’t need continuous access, 30 seconds is all that would be necessary to copy the cert.

**Option 3**

If Google’s servers can be[compromised by a bunch of Chinese hackers](http://www.wired.com/threatlevel/2010/01/operation-aurora/), and if the computers controlling[Iran’s uranium enrichment equipment can be compromised](http://edition.cnn.com/2011/11/08/tech/iran-stuxnet/)without even being connected to the internet, how long would a service like DuckDuckGo \(or Verizon Internet Services\) standup against a concerted effort by the NSA?Verizon Internet Services is almost the better target given that penetrating their infrastructure gives you access to potentially all companies hosted by them.

Again, this is a “get in, and get out quick” type operation.All they need is the key, they’ve already got the data.

### In Summary

This is not an indictment of DuckDuckGo per se.Except in as far as they are taking advantage of the hysteria to their own ends.Every provider needs to be upfront with saying, “If it is indeed true that the NSA is monitoring our ingress/egress traffic, we can make no guarantee of privacy regardless of encryption or other efforts on our part.”

In the larger picture, this is the crux of the problem not just for DuckDuckGo, but the internet as a whole.Until and unless agencies like the NSA are forbidden from conducting dragnet collection and analysis of data, there can be no privacy.  Privacy is merely an illusion at this point.

Source:  http://etherrag.blogspot.com/2013/07/duck-duck-go-illusion-of-privacy.html 
