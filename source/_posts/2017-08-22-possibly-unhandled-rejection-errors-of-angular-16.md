---
title: ' Possibly Unhandled Rejection Errors of Angular 1.6'
---

If you’ve updated to AngularJS 1.6.x, kudos! There’s not much that’s needed to get an app running with 1.5 to work with 1.6.

But, a very common error that starts appearing in people’s consoles after this upgrade is the dreaded**”Possibly unhandled rejection”**error.

Did you see this and wonder_what does this mean?_And more importantly, how the hell do you get rid of it? Worse, if you just follow the[highest voted answer on StackOverflow](https://stackoverflow.com/a/41993170/573)you probably hide bugs and won’t be aware of it. Read on for the full gist.

![](http://img0.tuicool.com/Vnm6ry7.png!web)

## What does this error mean?

Essentially, this error is printed to the console whenever a promise in your app is rejected \(resolved with a failure\), and there’s no`.catch()`block to handle that failure.

AngularJS added this to nudge developers to always handle possible errors. This is much like always adding an`else`to every`if`to make sure you handle error cases, etc. After all, every unhandled rejection might be an error that you forgot to account for, a bug waiting to happen.

A very common reason for it to come up in apps is things like modals being dismissed or “canceled”, and since the app has nothing to do in those scenarios the rejected promise goes unhandled.

## Getting rid of it – the icky way

The Stack Overflow answer I linked to above basically shows you how to disable this new behavior introduced in 1.6:

```
app.config(
function
($qProvider)
{
    $qProvider.errorOnUnhandledRejections(
false
);
});

```

You might be tempted to just reach for this quick fix, but be aware that it doesn’t 100% resemble that behavior in 1.5.

### The catch

Say that you make a simple typo, like we all do like 20 times a day. For example, you’re handling a response from`$http`that looks like this:`{value: "stuff"}`.

Now, spot the typo:

```
$http.get(
'/stuff'
).
then
(
function
(result)
 {
  handleResult(result.valye)
});

```

Of course, I mistyped`value`as`valye`. This code in version 1.5.x would result in an error in your console. So would it in 1.6,_unless you turn off unhandled rejection errors_. If you do it, this error would be swallowed, and you’ll be spending lots and lots of time debugging stuff.

That’s why I recommend solving this the right way, even though it might take more typing, unless you really really have no other choice.

## Getting rid of it – the right way

Well, the trick to not having unhandled rejection errors is… well…_handling_them.

You should, after every every promise with a`.then()`block have a`.catch()`block \(and no,`.finally()`blocks don’t help here\):

```
$http.get(
'/stuff'
).then(
function
(result)
{
  
// ... stuff here

}).
catch
(
function
()
{
  
// handle errors

});

```

And what about cases where you absolutely don’t care about errors? The convention I’d have to recommend is explicitly handling errors in a way that says you’re aware of possible errors and don’t care:

```
$http.get(
'/stuff'
).then(
function
(result)
{
  
// ... stuff here

}).
catch
(angular.noop); 
// 
<
-- look here!
```

We’re passing as a handler the`angular.noop`function, which a function that does… nothing. It’s the equivalent of`function() {}`. This saves you some typing, and whenever I see`noop`as opposed to an empty function, I know it was left there by intention, and not that someone forgot what they were doing half way through a commit.

Yeah, this is some more typing, but it’s all in favor of making more robust and bug-free apps. And I recommend setting up a shortcut in your favorite editor to add this \(e.g. my TextExpander is set up to write`.catch(angular.noop)`whenever I type`;noop`\).

Happy erring!

## “Maintaining AngularJS feels like Cobol ��…”

You want to do AngularJS_the right way_.

Yet every blog post you see makes it look like your codebase is obsolete. Components? Lifecycle hooks? Controllers are dead?

It would be great to work on a modern codebase again, but who has weeks for a rewrite?

Well, you can get your app back in shape, without pushing back all your deadlines! Imagine, upgrading smoothly along your regular tasks, no longer deep in legacy.

Subscribe and get my free email course with steps for upgrading your AngularJS app to the latest 1.6 safely and without a rewrite.



Source: [http://www.codelord.net/2017/08/20/angular-1-dot-6-s-possibly-unhandled-](http://www.tuicool.com/articles/hit/aA73Yjv)
