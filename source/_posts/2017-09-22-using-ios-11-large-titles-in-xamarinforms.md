---
title: Using iOS 11 Large Titles in Xamarin.Forms 
---

One of the new features in iOS 11 that catches your eye is the new large titles. With iOS 11 just released, I’m sure you want to incorporate the latest features into your own Xamarin apps. In this short post I will show you how.

## Large Titles

In iOS 11, you will notice that the stock apps will suddenly show you a large title that crawls up to the bottom whenever you scroll up. You can see it in action in the below screenshots, showing the Message app in iOS 11.

![](http://img0.tuicool.com/BR7ZJzj.png!web)

iOS 11 Large Title in action

You could argue about whether or not you like it, but Apple has decided, so we’re probably doing to have to like it for the years to come. Personally, I had to see it a couple of times, but now I like it!

## Using Them Yourself

Apple chose not to enable it by default for all navigation pages, so you will have to enable it yourself. I took a few minutes to find out how, and of course I will share it with you! It’s actually very easy. We have to create a custom renderer in the iOS project, which renders the NavigationPage. Or, if you want to use it for just one type, create your own inheritance. You can see the code below.

As you can see, all you have to do is set the PrefersLargeTitles property of your NavigationBar to true. Don’t forget to add the ExportRenderer tag on your class.

When you do, you will end up with something like this:

![](http://img2.tuicool.com/AjaqyuV.gif)

iOS 11 Large Title sample

The example code for this project can be found here:[https://github.com/jfversluis/LargeTitleSample](https://github.com/jfversluis/LargeTitleSample)if you need a working app.

I hope you liked this post! Please be sure to come back for more, and while you are at it, check out my[Gur.Codes\(\);](https://gur.codes/)vlog channel as well.


Source: https://blog.verslu.is/xamarin/xamarin-forms-xamarin/large-titles-xamarin-forms/