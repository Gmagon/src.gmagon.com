---
title: Angular 4 News Roundup June
---

WRITTEN BY[GARETH DUNNE @JSDIARIES](https://twitter.com/jsdiaries)

ng-June

June has come and gone and it has brought with it a steady month of Angular 4 news. There is a chance that you could have missed a change to key features or components so I’ve listed some of the main snippets of news that may have passed you by.

Although there isn’t much reading material specifically for**Angular 4**I recommend having a look at**ng-book: The Complete Guide to Angular 4**[here](http://geni.us/LCTQUAa).

Its updated with Angular 4 practices and is one of the few books doing so.

Angular 4.2

The most notable piece of Angular news this month is the release of**Angular 4.2**. This is a small update and will not break your current Angular projects via Semantic Versioning which I covered in a previous posthere.

All changes pertaining to the release are mentioned on the official blog here. So what are main highlights we should take our of this update?

Well, the changes to allow the creation of reusable animations using the`animation()`function enables our animations to become more modular.

I’ve listed a very similar example as the docs here for reference.

```
var fadeAnimation = animation([
  style({ 
opacity:
'{{ start }}'
 }),
  animate(
'{{ time }}'
,
    style({ 
opacity:
'{{ end }}'
))
], { 
params:
 { 
time:
'1000ms'
, 
start:
0
, 
end:
1
 }}); 

```

```
useAnimation
(fadeAnimation, {
  
params
: {
    
time
: 
'2s'
,
    
start
: 
1
,
    
end
: 
0

  }
}) 

```

As you can see we assign our animations to a variable, specify its animation properties and then invoke it using the`useAnimation`function

Typescript 2.4

Typescript has also updated to a new release, bringing with it dynamic import expressions as well as Safer callback parameter checking. There could be few posts written about these changes so I’ll let the official blog post do the talking[here](https://blogs.msdn.microsoft.com/typescript/2017/06/12/announcing-typescript-2-4-rc/).

I’ll just note that the dynamic imports feature in particular is a fantastic addition in this new release. It allows an even deeper layer of lazy loading and enables Webpack to split your bundles even further to only load a particular asset required in a function.

Angular IO

![](http://img0.tuicool.com/Ar6RRbB.png!web)

angularIO

In order to coincide with Angular 4 features and benefits, the official[angular.io](https://angular.io/)website has now been converted to a full scale web application. It is now much faster and has increased its performance significantly.

There is also a satisfying element of practice what you preach and the Angular team have clearly rebuilt the website from the ground up with performance in mind.

It may seems like a minor detail but searching through the documentation has now become a better user experience which I’m sure is appreciated throughout the Angular community especially for those browsing on mobile devices.

These were the main notable Angular events and features this month. The framework is progressively evolving every month and if theres enough newsworthy item in July I’ll be sure to do a similar roundup.

Still looking to upgrade your AngularJS app to Angular 2? Check out this tutorial by Toptal[here](https://www.toptal.com/angular-js/angular-2-upgrading-from-1-5).



Source: [http://jsdiaries.com/2017/07/03/angular-4-news-roundup-june/](http://www.tuicool.com/articles/hit/JNZ3qeb)

