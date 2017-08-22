---
title: A Students Helped Design A Rocket Avionics System
---

![](http://img1.tuicool.com/emmYN3j.jpg!web)

Cambridge postgraduate student \[Adam Greig\] helped design a rocket avionics system consisting of a series of disc-shaped PCBs arranged in a stack. There’s a lot that went into the system and you can get a good look at it all through[the flickr album](https://flic.kr/s/aHskAPxbXx).

Built with the help of[Cambridge University Spaceflight](http://www.cusf.co.uk/), the Martlet is a 3-staging sounding rocket that lifts to 15km/50K feet on Cesaroni Pro98 engines. \[Adam\]’s control system uses several Arm Cortex M4s on various boards rather than having just one brain controlling everything.

Each disc is a module that plays a specific role in the system. There are a couple of power supply boards sporting twin LTC2975 able to supply custom power to a dozen different circuits. The power system has a master control board also sporting an M4. There’s an IMU board with the guidance system — accelerometer, magnetometer, gyroscope, and barometer, all monitored by an algorithm that computes the rocket’s position and attitude in-flight. There’s a radio board with a GPS receiver and an ISM band radio transceiver for telemetry, as well as a datalogger with 10 thermocouple measurement channels. Engines are controlled by the pyro board which controls firing currents on four different channels. The vertical spacers also serve to transmit power and data to neighboring boards.

If you’re interested in learning more, check out the project’s code and schematics on \[Adam\]’s[GitHub repository](https://github.com/cuspaceflight/m3-avionics).

\[[Adam](https://adamgreig.com/)\] is no stranger to these pages, with hisNerf Vulcan turret published a few years back, as well as hisballoon tracking rigpublished more recently. Photos are CC-SA and can be found in[\[Adam\]’s Flickr feed](https://www.flickr.com/photos/randomskk/36480971721/).



Source: [http://hackaday.com/2017/08/21/open-source-modular-rocket-avionics-pac](http://www.tuicool.com/articles/hit/IfMRrqf)

