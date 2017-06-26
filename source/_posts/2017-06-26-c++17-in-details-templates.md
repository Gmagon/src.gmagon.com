---
title: 'C++17 in details: Templates'
---

![](http://img1.tuicool.com/raeeu2i.png!web)

For C++17 everyone wanted to have concepts, and as you know, we didn't get them. But does it mean C++17 doesn’t improve templates/template meta-programming? Far from that! In my opinion, we get excellent features.

Read more for details.

## Intro

Do you work a lot with templates and meta-programming?

With C++17 we get a few nice improvements: some are quite small, but also there are notable features as well! All in all, the additions should significantly improve writing template code.

Today I wrote about:

* Template argument deduction for class templates
* `template`
  `<`
  `auto`
  `>`
* Fold expressions
* `constexpr if`
* Plus some smaller, detailed improvements/fixes

BTW: if you’re really brave you can still use concepts! They are merged into GCC so you can play with them even before they are finally published.

## The Series

This post is the third one in the series about C++17 features details.

The plan for the series

1. [Fixes and deprecation](http://www.bfilipek.com/2017/05/cpp17-details-fixes-deprecation.html)
2. [Language clarification](http://www.bfilipek.com/2017/06/cpp17-details-clarifications.html)
3. Templates \(
   **today**
   \)
4. Attributes \(soon\)
5. Simplification \(soon + 1\)
6. Library changes 1 \(soon + 2\)
7. Library changes 2 \(soon + 3\)

## Documents & Links

Just to recall:

First of all, if you want to dig into the standard on your own, you can read the latest draft here:

[N4659, 2017-03-21,Working Draft, Standard for Programming Language C++](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4659.pdf)- the link also appears on the[isocpp.org](https://isocpp.org/).

WG21 P0636r0:[Changes between C++14 and C++17](https://isocpp.org/files/papers/p0636r0.html)

Compiler support:[C++ compiler support](http://en.cppreference.com/w/cpp/compiler_support)

Moreover, I’ve prepared a list of concise descriptions of all of the C++17 language features:

[Download a free copy of my C++17 Cheat Sheet!](http://eepurl.com/cyycFz)

It’s a one-page reference card, PDF.

There’s also a talk from Bryce Lelbach:[C++Now 2017: C++17 Features](https://www.youtube.com/watch?v=LvwXJjRQfHk)

And have a look at my master C++17 features post:C++17 Features

## Template argument deduction for class templates

I have good and bad news for you :\)

Do you often use`make<T>`functions to construct a templated object \(like`std::make_pair`\)?

With C++17 you can forget about \(most of\) them and just use a regular constructor :\)

That also means that a lot of your code - those`make<T>`functions can now be removed.

The reason?

C++17 filled a gap in the deduction rules for templates. Now the template deduction can happen for standard class templates and not just for functions.

For instance, the following code is \(and was\) legal:

```
void
f
(
std
::pair
<
int
, 
char
>
)
;


// call:

f(
std
::make_pair(
42
, 
'z'
));
```

Because`std::make_pair`is a template function \(so we can perform template deduction\).

But the following wasn’t \(before C++17\)

```
void
f
(
std
::pair
<
int
, 
char
>
)
;


// call:

f(
std
::pair(
42
, 
'z'
));
```

Looks the same, right? This was not OK because`std::pair`is a template class, and template classes could not apply type deduction in their initialization.

But now we can do that so that the above code will compile under C++17 conformant compiler.

What about creating local variables like tuples or pairs?

```
std
::pair
<
int
, 
double
>
 p(
10
, 
0.0
);

// same as
std
::
pair 
p
(
10
, 
0.0
)
; 
// deduced automatically!
```

Try in Compiler Explorer:[example, GCC 7.1](https://godbolt.org/g/z62jwK).

This can substantially reduce complex constructions like

```
std:
:lock_guard
<
std
:
:shared_timed_mutex
, 
        
std:
:shared_lock
<
std
:
:shared_timed_mutex
>
>
 lck(mut
_
, r1);
```

Can now become:

```
std
::
lock_guard 
lck
(mut_, r1)
;
```

Note, that partial deduction cannot happen, you have to specify all the template parameters or none:

```
std
::
tuple 
t
(
1
, 
2
, 
3
)
;              
// OK: deduction
std
::tuple
<
int
,
int
,
int
>
 t(
1
, 
2
, 
3
); 
// OK: all arguments are provided
std
::tuple
<
int
>
 t(
1
, 
2
, 
3
);         
// Error: partial deduction
```

Also if you’re adventurous you can create your custom class template deduction guides: see here for more information: recent post: Arne Mertz:[Modern C++ Features - Class Template Argument Deduction](https://arne-mertz.de/2017/06/class-template-argument-deduction/#User-defined_deduction_guides).

BTW: why not all`make`functions can be removed? For example, consider`make_unique`or`make_shared`are they only for ‘syntactic sugar’ ? I’ll leave this as an open question for now.

More details in

* [P0091R3](http://wg21.link/p0091r3)
* Simon Brand:
  [Template argument deduction for class template constructors](https://blog.tartanllama.xyz/c++/2017/01/11/deduction-for-class-templates/)
* [Class template deduction\(since C++17\) - cppreference](http://en.cppreference.com/w/cpp/language/class_template_deduction)
  .

MSVC**not yet**, GCC: 7.0, Clang:**not yet**.

## Declaring non-type template parameters with auto

This is another part of the strategy to use`auto`everywhere. With C++11 and C++14 you can use it to automatically deduce variables or even return types, plus there are also generic lambdas. Now you can also use it for deducing non-type template parameters.

For example:

```
template
<
auto
 value
>
void
f
()
{ }

f
<
10
>
();               
// deduces int
```

This is useful, as you don’t have to have a separate parameter for the type of non-type parameter. Like:

```
template
<
typename
 Type, Type value
>
constexpr
 Type TConstant = value;
                
// ^^^^                        ^^^^  
constexpr
auto
const
 MySuperConst = TConstant
<
int
, 
100
>
;
```

with C++17 it’s a bit simpler:

```
template
<
auto
 value
>
constexpr
auto
 TConstant = value;
                             
// ^^^^
constexpr
auto
const
 MySuperConst = TConstant 
<
100
>
;
```

So no need to write`Type`explicitly.

As one of the advanced uses a lot of papers/blogs/talks point to an example of Heterogeneous compile time list:

```
template
<
auto
 ... vs
>
struct
 HeterogenousValueList {};

using
 MyList = HeterogenousValueList
<
'a'
, 
100
, 
'b'
>
;
```

Before C++17 it was not possible to declare such list directly, some wrapper class would have to be provided first.

More details in

* [P0127R2 - Declaring non-type template parameters with auto](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0127r2.html)
* [P0127R1 - Declaring non-type template arguments with auto](http://open-std.org/JTC1/SC22/WG21/docs/papers/2016/p0127r1.html)
  - motivation, examples, discussion.
* [c++ - Advantages of auto in template parameters in C++17 - Stack Overflow](https://stackoverflow.com/questions/38026884/advantages-of-auto-in-template-parameters-in-c17)
* [Trip report: Summer ISO C++ standards meeting \(Oulu\) \| Sutter’s Mill](https://herbsutter.com/2016/06/30/trip-report-summer-iso-c-standards-meeting-oulu/)

MSVC**not yet**, GCC: 7.0, Clang: 4.0.

## Fold expressions

With C++11 we got variadic templates which is a great feature, especially if you want to work with a variable number of input parameters to a function. For example, previously \(pre C++11\) you had to write several different versions of a function \(like one for one parameter, another for two parameters, another for three params… \).

Still, variadic templates required some additional code when you wanted to implement ‘recursive’ functions like`sum`,`all`. You had to specify rules for the recursion:

For example:

```
auto
SumCpp11
()
{
    
return
0
;
}


template
<
typename
 T1, 
typename
... T
>
auto
SumCpp11
(T1 s, T... ts)
{
    
return
 s + SumCpp11(ts...);
}
```

And with C++17 we can write much simpler code:

```
template
<
typename
 ...Args
>
auto
sum
(Args ...args)
{ 
    
return
 (args + ... + 
0
); 
}


// or even:
template
<
typename
 ...Args
>
auto
sum2
(Args ...args)
{ 
    
return
 (args + ...);
}
```

Fold expressions over a[parameter pack](http://en.cppreference.com/w/cpp/language/parameter_pack).

| Expression | Expansion |
| :--- | :--- |
| \(… op pack\) | \(\(pack1 op pack2\) op …\) op packN |
| \(init op … op pack\) | \(\(\(init op pack1\) op pack2\) op …\) op packN |
| \(pack op …\) | pack1 op \(… op \(packN-1 op packN\)\) |
| \(pack op … op init\) | pack1 op \(… op \(packN-1 op \(packN op init\)\)\) |

Also by default we get the following values for empty parameter packs:

| Operator | default value |
| :--- | :--- |
| + | 0 |
| \* | 1 |
| & | -1 |
| \| | 0 |
| && | true |
| \|\| | false |
| , | void\(\) |

Here’s quite nice implementation of a`printf`using folds:

```
template
<
typename
 ...Args
>
void
FoldPrint
(Args
&
&
... args)
{
    (
cout
<
<
 ... 
<
<
 forward
<
Args
>
(args)) 
<
<
'\n'
;
}
```

Or a fold over a comma operator:

```
template
<
typename
 T, 
typename
... Args
>
void
push_back_vec
(
std
::
vector
<
T
>
&
 v, Args
&
&
... args)
{
    (v.push_back(args), ...);
}
```

In general, fold expression allows writing cleaner, shorter and probably easier to read code.

More details in:

* [N4295](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4295.html)
  and
  [N4295](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4295.html)
* “Using fold expressions to simplify variadic function templates” in
  [Modern C++ Programming Cookbook](http://amzn.to/2t62io9)
  .
* [Simon Brand: Exploding tuples with fold expressions](https://tartanllama.github.io/c++/2016/11/10/exploding-tuples-fold-expressions/)
* [Baptiste Wicht: C++17 Fold Expressions](http://baptiste-wicht.com/posts/2015/05/cpp17-fold-expressions.html)
* [Fold Expressions - ModernesCpp.com](http://www.modernescpp.com/index.php/fold-expressions)

MSVC**not yet**, GCC: 6.0, Clang: 3.6 \(N4295\)/3.9 \(N4295\).

## `constexpr if`

This is a big one!

The static-if for C++!

The feature allows you to discard branches of an if statement at compile-time based on a constant expression condition.

```
if
 constexpr(cond)
     statement1; 
//
 Discarded 
if
 cond is 
false
else

     statement2; 
//
 Discarded 
if
 cond is 
true
```

For example:

```
template
<
typename
 T
>
auto
get_value
(T t)
{
    
if
constexpr
(
std
::is_pointer_v
<
T
>
)
return
 *t
;
    
else
return
 t;
}
```

This removes a lot of the necessity for tag dispatching and SFINAE and even for`#ifdefs`.

I’d like to return to this feature when we are discussing features of C++17 that simplify the language. I hope to come back with more examples of`constexpr if`.

More details in:

* [P0292R2](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0292r2.html)
* Simon Brand:
  [Simplifying templates and \#ifdefs with if constexpr](https://blog.tartanllama.xyz/c++/2016/12/12/if-constexpr/)

MSVC**not yet**, GCC: 7.0, Clang: 3.9.

## Other

In C++17 there are also other language features related to templates. In this post, I wanted to focus on biggest enhancements, so I’ll just mention the other briefly:

* Allow`typename`in a template template parameters:[N4051](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4051.html).

  * Allows you to use
    `typename`
    instead of
    `class`
    when declaring a template template parameter. Normal type parameters can use them interchangeably, but template template parameters were restricted to
    `class`
    .

* DR: Matching of template template-arguments excludes compatible templates:[P0522R0](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0522r0.html).

  * Improves matching of template template arguments. Resolves
    [Core issue CWG 150](http://open-std.org/JTC1/SC22/WG21/docs/papers/2015/n4457.html#150)
    .

* Allow constant evaluation for all non-type template arguments:[N4268](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4268.html)

  * Remove syntactic restrictions for pointers, references, and pointers to members that appear as non-type template parameters:

* `constexpr`lambdas:[P0170R1](http://wg21.link/p0170r1)

  * Lambda expressions may now be constant expressions.

## Summary

Is C++17 improving templates and meta-programming? Definitely!

We have really solid features like template deduction for class templates,`template<auto>`plus some detailed features that fix some of the problems.

Still, for me, the most powerful features, that might have a significant impact on the code is`constexpr if`and folds. They greatly clean up the code and make it more readable.

What are your favorite parts regarding templates?

Next time we’ll address attributes like`[[fallthrough]]`or`[[nodiscard]]`, and I’d like to recall other, already existing attributes. Stay tuned!

Once again, remember to grab my[**C++17 Language Ref Card**](http://eepurl.com/cyycFz).



Source: [http://www.bfilipek.com/2017/06/cpp17-details-templates.html](http://www.tuicool.com/articles/hit/rauARne)

