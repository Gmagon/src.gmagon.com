---
title: >-
  Creepy spyware has infected Macs for years, and we're only just realizing it
  now
---

![](http://img2.tuicool.com/eiyy2m3.jpg!web)

Your Mac is not safe. Well, at least not as safe as you think it is.

That's the big takeaway following the detailed investigation of a particularly insidious strain of Apple-focused malware that has potentially been around for up to a decade — all the while broadcasting video and audio from victims' computers back to an unknown attacker.

SEE ALSO:[Remotely hacking ships shouldn't be this easy, and yet ...](http://mashable.com/2017/07/18/hacking-boats-is-fun-and-easy/)

The malware, dubbed Fruitfly, was first reported on in January by[_Malwarebytes_](https://blog.malwarebytes.com/threat-analysis/2017/01/new-mac-backdoor-using-antiquated-code/). However, it was Synack Chief Security Researcher[Patrick Wardle](https://twitter.com/patrickwardle)who blew the lid off Fruitfly's true nature on July 21. 

"\[A\] hacker built this to spy on users for probably perverse reasons."

In a conversation with_Mashable_, Wardle explained that he was sent the malicious software by a friend earlier this year, and that he found it interesting enough to investigate. That investigation led to some unexpected places. 

Wardle discovered that the malware directed infected computers to contact a command and control server for instructions — known as "tasking" — but that the primary server was offline. As such, he realized the computers would look for specific backup domains for their directions. It just so happened that "one or two" of those domains were available for registration.

So he registered one, and created a server that could talk to the malware. What he found, well, is pretty damn creepy.

First, Fruitfly gave him both the infected computers' IP addresses — which can be used to determine their locations — and the computers' names. With most Macs, the computer name is just the owner's name.

So, for starters, Wardle was sitting on the names and locations of many of the victims. But that's not all. The malware gave him the power to remotely switch on webcams and microphones, take control of mice, change files, and would even notify him if the computer was in use by its owner.

Wrote C&C server to analyze:apple:-virus for[@BlackHatEvents](https://twitter.com/BlackHatEvents)/[@defcon](https://twitter.com/defcon)talk. Took over a C&C addr & 100s ��:computer: \(90% in :us:\): 'hi, task us':cop:now involved:scream:[pic.twitter.com/DxS1y8KYZB](https://t.co/DxS1y8KYZB)

— patrick wardle \(@patrickwardle\)[July 21, 2017](https://twitter.com/patrickwardle/status/888322447191097344)

"Usually you see that in government or nation-state software," Wardle, who used to work for the NSA, observed.

But the victims weren't nation-state actors — they were regular people. Strangely, however, the system didn't seem designed for financial gain as is more typical of malware infecting the devices of everyday folks. Instead, it appeared to have a completely different objective.

"\[A\] hacker built this to spy on users for probably perverse reasons," explained Wardle, emphasizing that it was "designed to performance surveillance."

Approximately 90 percent of the infected computers are located in the U.S., with Wardle identifying around 400 compromised devices. He cautioned that those are just the infected systems he found, and that the total could be in the low thousands. Why so low? He speculated two reasons: To keep things manageable for the aforementioned creep, and to avoid detection.

Speaking of detection, how did this thing go undiscovered for so long? Well, according to Wardle, a lot of that has to do with Macs.

"Mac security software is not that good," he notedbefore elaborating that while Macs are good at detecting known threats, they are not that good at identifying new threats. Which, well, is a not-so-gentle reminder that even Mac users should get webcam covers. What's more, Wardle added that Macs are actually easier to hack than recent versions of Windows — a statement which is sure to not win him any love in the Apple community. 

Wardle contacted law enforcement with his findings, and he says the entire Fruitfly malware net appears to be shut down at this time. And while that is good news for the 400 victims he identified, the findings suggest that a host of Mac-focused malware may already be out there under all of our noses. All someone needs to do is look for it.



Source: [http://mashable.com/2017/07/24/mac-malware-fruitfly-beware/](http://www.tuicool.com/articles/hit/Vruimib)

