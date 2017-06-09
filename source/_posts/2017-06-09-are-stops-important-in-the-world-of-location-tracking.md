---
title: Are stops important in the world of location tracking?
---

# Are stops important in the world of location tracking?

We had trips on our mind when we first built HyperTrack. We assumed that developers would start tracking a user when they expected the user to be on their way to get some place and stop when they had reached. The assumption failed. Obvious in hindsight, developers expected us to tell them \(and not the other way around\) when the user was on the way and when they had stopped. All they wanted to do was switch us on or off, and hand over control to HyperTrack to automatically figure out trips and stops in the life of the user. They would keep HyperTrack on through the day, through the week, or just switch it on and leave it on forever. HyperTrack was expected to notify developers about the start and end of these trips and stops, besides other useful events along the way. This led to a re-architecture of our stack that we rolled out with HyperTrack v3 in March.

All you need to do now is plug in SDK into your app and call our startTracking method, say when the user logs in. That’s it. You would now get all the trips and stops that your user makes, arranged in a_**placeline**_. For every stop your user makes, you would get to know the place and duration of the stop.

![](http://img0.tuicool.com/IvUrUzr.png!web)

User placeline with trips & stops

## Why are Stops important?

When building a real time location tracking stack, it is important to distinguish between trips and stops for multiple reasons.

### **Battery Efficiency**

![](http://img2.tuicool.com/ZRRfay7.png!web)Distinguishing between trips and stops has helped us significantly reduce the battery used by our SDK. Our SDK hibernates when the user stops and spares the receiver and transmitter until the user is moving or on their way again. An average user is on the move for 5-6 hours or less than 25% of the day. That trims down battery usage by a straight 75%.

### **Location accuracy**

Distinguishing between trips and stops helps filter out noise in the location data. An average user is indoor when at a stop, say inside a building. Fused location points received from the device go haywire due to flaky GPS connectivity and strong WiFi connectivity. The Operating System prefers WiFi locations over GPS due to higher confidence. However, high confidence locations from multiple WiFi networks creates a different type of noise in the data. See the image below for locations received during an hour long stop at 100 Bush St. in San Francisco.

Now imagine using these high confidence location points to compute mileage of distance traveled by the user! Detecting a stop using activity data is an effective way to eliminate this noise.

![](http://img2.tuicool.com/iI3UVrM.png!web)

Raw location points at a stop

## How do we automatically detect stops?

Activity sensors in smartphones help detect stops in conjunction with location sensors. The smartphone Operating Systems provide raw sensor data from the accelerometer and gyroscope, as well as fused activity/motion data through their own algorithms in the chipset or system software. Similarly, the OS provides raw location data from GPS, WiFi and cellular network sensors, as well as fused location data through APIs such as Visit in iOS and Geofence in Android. Making these two data sets work in tandem helps us interpret stops automatically and reliably. A more in-depth analysis coming up in a separate post.

## How do our customers use stops?

Here are a few unique stories of how of our customers use Stops that are automatically detected by HyperTrack.

### **Measuring stop durations**

A service aggregator who uses HyperTrack for location tracking provides services like beauty, auto mechanic, home cleaning, plumbing, and handyman delivered at users’ homes. One of their biggest problems is to know whether these service professionals visited the expected place at the expected time. If so, how much time did they spend at the consumer’s location. Professional services are often billed by time and resolving disputes between the consumer and service professional often comes down to figuring out the actual time spent on site. The aggregator plugged in the HyperTrack SDK and created a stopover_**action**_ for each service visit. You create an_**action**_ in HyperTrack for an action that the user performs in the app and that you want to track. The operations team can now seethe actual time spent by the service professional at that stop.

![](http://img0.tuicool.com/MjYjMvI.png!web)

Stops in context of an action

### **Profiling frequently visited places**

A travel app wanted to provide local recommendations to her users. Right after she plugged the SDK in the app, HyperTrack started generating a heatmap of places where users were spending most time. This data of most frequented places became the core data set for local recommendations in the app.

![](http://img2.tuicool.com/2yaiUzJ.png!web)

Places heatmap

### **Getting geofence alerts for places of interest**

A fleet of real estate agents wanted to get alerted when an agent visited one of the tens of thousands of properties in the company database. They wanted to make sure that these alerts were sent only when the agent stopped at a property, rather than personal visits and other locations. The default geofencing features provided by the OS severely limit the number of locations you may register for geofencing visits \(e.g.,[100 geofences/device on Android](https://developer.android.com/training/location/geofencing.html)\).

This customer used HyperTrack to get alerts for visits. They [received webhook events](https://docs.hypertrack.com/events/webhook.html)when the agent visited a property and then used to to send a mobile notifications to their agents.

![](http://img2.tuicool.com/JBzq6nM.png!web)

Notifications powered via geofence alerts

### **Getting delay alerts with unexpected stops**

A customer who had builtorder tracking with HyperTrack now wanted to get an alert when an order was getting delayed by over 10 mins. In the alert, they wanted to know the reason for delay. Turned out that many delays were related to unexpected stops by the rider. They set up [real-time Slack alerts](https://docs.hypertrack.com/events/slack.html) sent to the respective fleet channels when the rider made an unexpected stop.

![](http://img0.tuicool.com/fIJrYfj.png!web)

Unexpected stops on your Slack channel

These are just a few stories of how developers have used stops to build better location-based services for business efficiency and product experience. We discover new stories every day as more developers start using HyperTrack in their apps. We are excited to see how you use stops in  your product. Do ping us at[help@hypertrack.io](mailto:help@hypertrack.io) and we would love to feature your story on our blog!

In case you haven’t started yet, visit[www.hypertrack.com](http://www.hypertrack.com/)now to plug in the SDK into your app. It takes just a few minutes to start building your location features.

