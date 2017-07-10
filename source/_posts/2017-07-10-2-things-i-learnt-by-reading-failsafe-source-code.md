---
title: 2 Things I learnt By Reading Failsafe Source code
---

Welcome to the second post ofX-things-I-learnt-reading-Y’s-source-codeseries. This week I decided to read source code of[failsafe](https://github.com/jhalterman/failsafe)library.

Failsafe is a lightweight, zero-dependency library for handling failures. It was designed to be as easy to use as possible, with a concise API for handling everyday use cases and the flexibility to handle everything else.

Let’s suppose you are working with a flaky HTTP service. You can use failsafe to retry the service a configurable number of times by writing code as shown below.

```
RetryPolicy retryPolicy = 
new
 RetryPolicy()
  .retryOn(HttpConnectionException.
class
)
  .withMaxRetries(
3
);
```

```
MyHttpService connection = Failsafe.
with
(retryPolicy)
                               .get
(() -
>
 connect())
;
```

The above will retry 3 times to connect to the http service if HttpConnectionException is thrown.

## 2 Things I learnt

Reading through the source code and referring to Github issues I learnt couple of things to avoid when designing APIs. So, I learnt what not to do rather than what to do ��

1. Don’t use wrong default values: failsafe library does not enforce users to provide values when configuring RetryPolicy or other configuration object. The default value for number of retries is set to  -1, which means retry infinitely. This is not correct as user of the API would want retry call to complete eventually or throw an exception. I think better way to design API is to enforce users to provide values when you are unable to come up with good default values. This would avoid surprises to the user.  APIs should follow
   [Principle of least astonishment](https://en.wikipedia.org/wiki/Principle_of_least_astonishment)
   .
2. Favour immutability: A common thread that I found in many issues is related to shareability of RetryPolicy object. Users want to reuse RetryPolicy object but because it is not immutable they fear thread safety concerns. Library author clarified that library does not change the state of object internally so it is safe to reuse. I think the better way to design such objects is by using a builder pattern. Then, in the build method of builder make an immutable object. This does not confuse users and keep your API consistent.



Source: [http://shekhargulati.com/2017/07/10/2-things-i-learnt-by-reading-failsafe-source-code/](http://www.tuicool.com/articles/hit/Y3mUjaa)

