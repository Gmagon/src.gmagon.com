---
title: 'Alexa and Siri are vulnerable to ''silent,'' nefarious commands'
---

![](https://cdn.macrumors.com/article-new/2017/03/siri-alexa-fight.jpg)The relatively simple technique is called DolphinAttack. Researchers first translated human voice commands into ultrasonic frequencies \(over 20,000 hz\). They then simply played them back from a regular smartphone equipped with an amplifier, ultrasonic transducer and battery -- less than $3 worth of parts.

What makes the attack scary is the fact that it works on just about anything:Siri,Google Assistant, Samsung S Voice andAlexa, on devices like smartphones, iPads, MacBook and Nexus 7s, Amazon Echo and even an Audi Q3 -- 16 devices and seven system in total. What's worse, "the inaudible voice commands can be correctly interpreted by the SR \(speech recognition\) systems on all the tested hardware." Suffice to say, it works even if the attacker has no device access and the owner has taken the necessary security precautions.
![](http://img2.tuicool.com/NrMvAzq.jpg)

The group successfully tested commands like "Call 123-456-7890," "open Dolphinattack.com" and "Open the back door," leaving owners vulnerable to data, or worse, real life attacks. It was even able to change the navigation on an Audi Q3.

There's one bit of good news: At this point, the device has a range of five or six feet, so it's of limited use unless researchers can increase the power. However, if you're in a public place with your phone unlocked and Siri or Google Assistant enabled, an nearby attacker could possibly gain access to it.

Device makers could stop this simply by programming it to ignore commands at 20 KHz or other frequencies that humans can't possibly speak in. However, the team found that every major AI assistant-enabled device currently accepts such commands without missing a beat. As to why the microphones even work at such frequencies \(up to 42,000 Hz\), filtering them out might lower a system's "comprehension score," an industrial designer told[_Fast Co_](https://www.fastcodesign.com/90139019/a-simple-design-flaw-makes-it-astoundingly-easy-to-hack-siri-and-alexa). Some devices, like the Chromecast, also use it for[ultrasonic device pairing](https://www.engadget.com/2014/06/27/chromecast-ultrasonic-pairing/).

For now, the researchers recommend that device makers either modify microphones so that they don't accept signals above 20 Khz, or simply cancel any voice commands at inaudible frequencies. In the meantime, if you have a dog and he starts acting weird for no reason, we wouldn't blame you for getting paranoid.
Source: http://www.tuicool.com/articles/bUj2euI

Source: https://www.engadget.com/2017/09/06/alexa-and-siri-are-vulnerable-to-silent-nefarious-commands/

