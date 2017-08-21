---
title: Learn where you can and can’t use trailing commas in JavaScript
---

## Learn where you can and can’t use trailing commas in JavaScript

![](http://img1.tuicool.com/ZnuYRv2.jpg!web)

trail…

Certain trailing commas have been legal in JavaScript since the origin of the language. Others are brand new. Below, you’ll learn about them all!

### What is a trailing comma and Why is it useful?

If you had a list of chores, you might separate them with commas:

```
dishes, vacuum, tidy
```

A trailing comma is simply a comma that comes after the last item in our list. It’s not required, but in some instances in JS we’re allowed to put it there:

```
dishes, vacuum, tidy
,
```

There are a number of reasons why you may want to include a trailing comma. Think about a scenario where you have to programmatically add elements to an array:

* Without
  _trailing commas_
  , most values can be added to the array as
  `value + ','`
  however you then need to add in special logic to ensure that last item added to the array doesn’t include a comma after it.
* With
  _trailing commas_
  , all items can be added to the array as the
  `value + ','`
  .

### Arrays

Since the beginning of JavaScript, trailing commas are legal when creating arrays:

```
// both are the same:
```

```
let
 arr = [ 
1
, 
2
 ];


let
 arr = [ 
1
, 
2
,
 ];
```

```
arr
.length
; 
// 2
```

### Objects

Trailing commas are also legal in Objects:

```
// both are the same:
```

```
let
 obj = { 
  a: 
95
, 
  b: 
23

};
```

```
let
 obj = { 
  a: 
95
, 
  b: 
23
,
};
```

### Parameter Definitions & Function Calls

Starting with ES 2017, trailing commas are also allowed in parameter definitions and function calls:

```
// both are the same:
```

```
function
f
(a,b)
 {}

function
f
(a,b,)
 {}
```

```
// both are the same:
```

```
f
(
1
,
2
);


f
(
1
,
2
,
);
```

However, if the function parameter definition or function call**only**contains a comma, a syntax error will be thrown:

```
function
f
(,)
{}
;
// SyntaxError: missing formal parameter
```

```
f
(,);


// SyntaxError: expected expression, got ','
```

### Rest Parameters

If you’re unfamiliar with rest parameters, you canread my article here.

When using rest parameters, trailing commas are not allowed and will throw a`SyntaxError`:

```
function
f
(...a,)
{}
;
// SyntaxError: parameter after rest parameter
```

```
let
 [a, ...b,] = [
1
, 
2
, 
3
, 
4
, 
5
];

// SyntaxError: rest element may not have a trailing comma
```

### JSON

Trailing commas are not allowed in JSON. Attempting to parse JSON with trailing commas will throw a SyntaxError:

```
JSON
.parse
(
'["a", "b",]'
);

// SyntaxError JSON.parse: unexpected character
```

### Want to learn more JavaScript?

Check out[**JavaScript: Understanding the Weird Parts**](https://codeburst.io/javascript-understanding-the-weird-parts-d1d0e7061ebf)

### Closing Notes

Thanks for reading. I’m doing a whole series on JavaScript ES 2017. Please consider[entering your email here](https://docs.google.com/forms/d/e/1FAIpQLSeQYYmBCBfJF9MXFmRJ7hnwyXvMwyCtHC5wxVDh5Cq--VT6Fg/viewform)if you’d like to be added to my once-weekly email list.

If advanced JavaScript tutorials like this interest you and you want to learn more, check out[**JavaScript: Understanding the Weird Parts.**](https://codeburst.io/javascript-understanding-the-weird-parts-d1d0e7061ebf)

If this post was helpful, please click the clap :clap:button below a few times to show your support! ⬇⬇



Source: [https://codeburst.io/learn-javascript-es-2017-trailing-commas-4534891f3f90?](http://www.tuicool.com/articles/hit/MRz6F3i)

