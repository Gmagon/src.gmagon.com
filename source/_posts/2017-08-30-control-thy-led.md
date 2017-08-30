---
title: Control Thy LED
---


![](http://img2.tuicool.com/6JRjye2.jpg!web)

In aprevious article, I discussed LEDs in general and their properties. In this write-up, I want to give some examples of driving LEDs and comparing a few of the most commonly used methods. There is no “one size fits all” but I will try and generalize as much as possible. The idea is to be able to effectively control the brightness of the LED and prolong their life while doing it. An efficient driver can make all the difference if you plan to deploy them for the long-haul. Let’s take a look at the problem and then discuss the solutions.

## The Problem of LED brightness control

Most newbies will be interested in making an LED glow without blowing it up. A little further down the line, it comes down to brightness control and then mixing of colors to produce any shade from the color picker. In any case, it is essential to have a clear understanding of the end application. A lighting application such as a work bench light will seldom require a romantic mood light control. On the contrary, a disco light will require fluctuating intensities of various colored LEDs.

So how is brightness perceived? Logically speaking, when you have two LEDs lamps of 100 lumens each, the result should be double the brightness. In reality, human eyes are logarithmically sensitive to intensity change which means that doubling the intensity will be perceived as a small change.

Perception of light intensity follows Stevens’ Power Law with an exponent that depends upon the amount of your field of view occupied by the light. For a 5 degree spot the exponent is about 0.33 but for a point source, it is about 0.5. This means that for a 5-degree spot the source needs to increase by a factor of 8 to seem twice as bright and a point source, needs to increase by a[factor of 4 to seem twice as bright](http://www.candlepowerforums.com/vb/showthread.php?189362-Do-lumens-add-up).

![](http://img1.tuicool.com/YJRfmma.png!web)Let us start with a simple 1 W SMD LED like the one available from[Adafruit](https://www.adafruit.com/product/518). This one is rated at 90 Lumens and comes with an aluminum PCB as a heat sink. Here is a quick look at some of the parameters of for the LED.

The datasheet has some pretty important information starting with forward current\(continuous\) and peak forward current. The values are 350 mA and 500 mA respectively and should not be exceeded.

![](http://img2.tuicool.com/VjuUryI.png!web)

Two more important pieces of information are used which are represented as graphs. The first is the forward current and voltage graph which shows that a voltage of around 1.8 V is enough to forward bias the LED. The current rises ohmically after that and at around 3 V, it is reported to draw around 200 mA. The second curve is the relative LI vs forward current which shows that the current controls the amount of light output \(the straight line stretching up to the “4” mark\).

Given that the LED follows Ohm’s Law, the current should be directly proportional to the voltage and hence we can vary the voltage to control the brightness. Well, there is just one small hiccup that the curve of the forward current is so steep that a small increment in voltage will have a larger change in voltage. The brightness will be different if you connect a coin cell as opposed to two alkaline batteries. Both have a 3 V potential difference but the amount of current supplied by either is different and consequently, the brightness is different. Rather than control the voltage, it’s better to control the current passing through the LED directly.

## The Simple Approach

The easiest thing to do is add a potentiometer in series with the LED. Simple! Essentially when you vary the resistance, Ohm’s Law kicks in and voila! Variable resistance equals variable current equals variable brightness.

Here is a simulation of an LED with a variable resistor varying from 100 ohms to 1 kilohm. The only problem is that if the resistance of the LED changes or the voltage fluctuates, the result may be devastating. This is essentially an open-loop control and there is no feedback from the circuit to the user other than varying brightness.

Of course, there is also the issue of efficiency since the there will be power dissipated by the potentiometer as well.

## Current Control

Next easiest is to create a constant current circuit. There are a number of ways to create a simple constant current source and I highly recommend going through the book, “Art of Electronics” for a detailed explanation of the same. Unsurprisingly there is a[Wikipedia article](https://en.wikipedia.org/wiki/Current_source)on the subject as well.

You could use a classic LM317 variable voltage regulator to provide a[small constant current](http://theparanoidtroll.com/2011/01/05/constant-current-sourceload-lm317/). It is not very efficient since there is there is a lot of heat dissipated at the adjustment resistor at higher currents.

![](http://img0.tuicool.com/BnQF7v3.png!web)The better method is to use a closed-loop circuit that provides analog feedback to inhibit excessive currents and compensate for variations in the load. The circuit shown is a simple current limiter and is recommended since it offers a higher efficiency than other transistor circuits.

It works to limit the current through R\_sense such that the drop across it is no more than 0.6 V. If that happens, Q2 switches ON and Q1 will be switched OFF which limits the current through R\_load which in our case will be an LED. Adjusting R\_sense using Ohm’s Law we can adjust the maximum current thought our LED.

I personally prefer the above circuit with Q1 replaced with a MOSFET however in cases where we want to control the brightness digitally the next method would be a much better fit.

## The Digital Method

The next circuit involves the use of a set of pulses to switch ON and OFF the current through the LED. It’s like flicking the power switch quickly enough that it seems like the light is dimmed. Commonly known as PWM or Pulse Width Modulation, a series of pulses with variable duty cycles or ON and OFF times can be employed for the task.

Under this topic, there are two parts to be discussed. The first is the switching source which can be a simple oscillator or a microcontroller. The second is the switch itself which will be the driving stage of this design. Let us take a look at both in brief.

### The PWM source

For generating the pulses, the humble 555 is a good choice. The circuit shows a simple PWM circuit with T1 being the switching element.![](http://img1.tuicool.com/nMVRvan.png!web)

For generating the pulses, the humble 555 is a good choice the circuit below shows a simple PWM circuit with T1 being the switching element.

At this point, we have a number of options and questions to be answered.

1. What is the correct frequency for the PWM?

2. How do I know the amount of current being supplied and

3. How does all this affect the brightness?

The frequency of the PWM effects the flicker perceived. A simple example is when recording digital video if you use NTSC in a 60 Hz lighting environment, your camera will pick up a lot of flicker and switching to PAL will help a lot. For PAL it is 50 Hz so try it out right now with your web cam and see the effect.

The idea is that higher switching frequencies are better but you cannot go arbitrarily high. Remember, all LEDs have a turn-on time which is required for it to switch on and start glowing. If you switch too fast, the LED just won’t turn ON. Another consequence is that the frequency has an effect on the efficiency of the switching element and we will touch on that in a moment. Right now we need to figure out the best frequency for our LED. Scroll back up and check out the last entry in the data sheet snippet.

It says 1 KHz which is what the manufacturer recommends and in most cases this information will be provided in the data sheet itself. If not then anything above 500 Hz should be usable. Check out this[link](https://www.digikey.com/en/articles/techzone/2016/oct/how-to-dim-an-led-without-compromising-light-quality)for an application on dimming LEDs.

Since this technique allows for a digital control over the current, ergo the brightness, the next step would be to figure out a way to control the brightness. Remember, the LI is directly proportional to the current but perceived brightness is logarithmic. We need to translate the linear stepping input into a logarithmic current variation.

When using microcontrollers or even FPGAs, the answer is very simple – loookup tables! Have a list of PWM duty cycles that correspond to a sequence of perceived brightness values. A great example I have to mention is[here](https://electronics.stackexchange.com/questions/1983/correcting-for-non-linear-brightness-in-leds-when-using-pwm), where the designer uses an FPGA to create a log LUT to generate a linear PLI from user inputs. The same lookup table can be used with an Arduino and I strongly encourage you to try.

Personal Note: When LEDs appeared initially, one of the problems that we faced was that the LED drivers that came with the lamps would malfunction. I initially designed a small circuit to limit the current along with a thermistor to shut down the LED if the switching element overheated. Eventually, dedicated solutions started coming up which we will take a look at in a proceeding sections.

### Let’s Switch: MOSFET vs BJT

The second item on the menu is the actual switching element. You can use a BJT or a FET or a MOSFET depending upon your budget and state of mind. BJTs are simpler creatures and require very few additional components. A 2N2222 can safely deal with 800 mA of current which is good for many applications.

MOSFETS, on the other hand, are more demanding in terms of components and require a little bit of care to deploy. In exchange, they offer a far less ON resistance of the order of milliohms and a higher efficiency. Let’s take a look at both.

### The BJT LED Driver

![](http://img0.tuicool.com/Rr2IziE.png!web)Here’s the simplest BJT LED Driver circuit. It consists of a transistor connected in common emitter configuration. The transistor gets switched on when the input switch is closed which allows for current to flow from the LED to the ground terminal. The resistance is calculated as

r0 = \(Va+Vce\) / Ic where Va is early voltage.

This is not constant and varies with the operating point of the transistor and under saturation condition is of the order of a few ohms. The power dissipation is insignificant for a few milliamps but quickly becomes a problem for larger current draws.

![](http://img0.tuicool.com/MfYniuJ.png!web)

I refer you to a video post by \[Dave Jones\] of the EEVBlog where he[uses a BD136 and a 555 to vary the brightness of LEDs on a piece of equipment](https://www.youtube.com/watch?v=OXsu29K_Ap4). This works for loads with lower wattages however if you are looking to drive larger LEDs then expect to add some pretty hefty heatsinks.

### MOSFETs are an LED’s Best Friend

A MOSFET has a very low ON resistance of the order of a few milliohms which means that in such a state, it will dissipate very small amounts of heat as per P = I2R.

Since these are voltage driven devices and have very high input impedances, we can safely parallel together a bunch of them. Unfortunately, these are also susceptible to false turn-on events hence for switching applications, circuits must be carefully designed. A more detailed explanation is available[here](http://www.electronicdesign.com/power/mosfet-design-basics-you-need-know-part-1)for the interested however for this writing, we will continue with a general case.

#### Designing a Lamp

I recently bought two no-brand LED panels from a local hardware shop. The seller told me that I should connect them to a 12 V source and they will work. When I chained them together and connected them to a bench power supply, I found that at 12 volts, they can draw up to 2.7 amps! The brightness is frightening at close range and I need to control their brightness.

![](http://img2.tuicool.com/Z7Vz6f2.png!web)The next step is figuring out the MOSFET that will be the best fit. Considering overshoots while switching, I would like to go for a 20 V or even a 30 V Drain-Source voltage device to be on the safe side. As for the current, if I intend to pass around 5 amps of peak currents, a Res\(ON\) of 0.1 ohms would mean 2.5 watts! In such a case my heatsink cost would greatly affect my final product. Instead, I would like something with a fraction of the ON resistance- like 0.01 ohms or less, especially for SMD devices.

Next, I intend to switch the MOSFET with either a 555 or an Arduino. This translates to 5 V Vgs and so Logic Level MOSFETs are preferred; though I will be driving the LEDs with a 12 volt supply hence I could use a transistor or dedicated MOSFET driver. Without it, the effective resistance would be higher but it is worth a try none the less.

I am also tempted to look at the PH2520U and the now obsolete MTP3055VL which is a Logic Level MOSFET. The MTP3055VL has a relatively high ON resistance and can be turned on with 5.0 Volts at the expense of 0.18 Ohms and a lot of power dissipated.

![](http://img1.tuicool.com/BneMBvj.gif)The IRF530, IRF540, IRFZ44N, and AO3400A are all good choices since I have a couple of them in stock. Using an IRFZ44N, I made a simple LED driver and used an Arduino Uno directly. Remember the Arduino pins go up to 5V and I used the fade example that generates PWM out of the box. The frequency of the PWM signal is 490 Hz which is pretty decent.

The result is an effective dimming of the panel. However taking a closer look at the waveform, we see that the output has a significant rise time with a single LED Panel.

![](http://img0.tuicool.com/vQBZriu.png!web)

This is due to the capacitive parasitics as well as a weak current drive and can be remedied by adding a transistor driver stage. This[TI application report](http://www.ti.com/lit/ml/slua618/slua618.pdf)\(PDF\) documents gate driver circuits pretty well with reference to a non-inverting bipolar totem-pole driver which has been[studied in detail](http://joost.damad.be/2012/09/dimming-12v-led-strip-with-mosfet-and.html)by \[Joost Yervante Damad\]. Since our switching frequency is in the lower range, these switching losses are insignificant. If we were to switch in the kHz range or MHz range, these parasitics would quickly be the death of our prototype.

In my case, I proceeded with no driving stage but then modified the code for 75% duty cycle and measured the current draw with a varying value of PWM. Turns out it sucks up a little short of 1 A of peak current. The MOSFET did not heat to the extent where it would require a heatsink, so the circuit is usable as is for this LED panel as well. I can proceed to make a PCB for my little lamp, however, there is one more option I would like to take a look at.

## LEDDrivers

![](http://img2.tuicool.com/3uM7biA.jpg!web)Dedicated LED driver chips enable you to control LEDs effectively without having to think about all the parameters. A good example is the TPS92512 which allows for control of high brightness LEDs using PWM which is internally controlled. Current control is implemented internally and external signals including PWM as well as analog signals can be used to control the brightness linearly. No need for lookup tables.

I wired up a test board with the same LED panel such that the brightness is controlled using the IADJ pin. A simple preset was used to vary the voltage between 0.8 and 1.8 volts at the desired pin. The output is a clean and efficient varying voltage which is filtered by an output stage cap.

The PWM frequency is around 580 kHz when probed between the inductor. I could not see any oscillations at the output LED pins though which means the filter stage does the job effectively. I created a DIY version of the PCB in[Autodesk Eagle](https://github.com/inderpreet/TPS92512_Eagle)\(GitHub\) which you can download to make your own.

There is a little OSHPark purple in there and I hope to solder it up myself. Looking at the size of the pins it should be a fun exercise. Let me know if you make one yourself.

## Conclusion

So how do you drive an LED? The answer lies in your application area. For small LED current draws, BJTs are simpler and the least expensive. For medium current draws, MOSFETs are a better fit and if you want solutions that offer great out-of-the-box experiences, dedicated driver chips are the way to go. As for me, I have a lamp to finish which will use the middle road since it worked out in my tests. If I ever come to the point where I see flicker in my videos, then the TPS92512 solution will come in pretty handy. I am sure you have a solution of your own and the best way to share it would be a project on Hackaday.io. Go ahead, make a little lamp with light as white as snow and share with us your story.


Source:  http://hackaday.com/2017/08/29/control-thy-led/
