---
title: The different types of scope in JavaScript
---

Scope is an important, yet ambiguous concept in JavaScript. Used correctly, it allows you to leverage good design patterns and helps you avoid bad side effects. In this article, we will dissect the different types of scope in JavaScript and how they work deep down in order to write better code.

The simple definition of scope is_where_the compiler looks for variables and functions when it needs them. Sounds too easy to be true? Let's see what it's all about.![](https://developer.telerik.com/wp-content/uploads/2017/08/scope_js_header.jpg)

## JavaScript Interpreter {#toc_1}

Before explaining what scope is, we need to talk about the JavaScript interpreter and how it affects the different scopes. When you execute your JavaScript code, the interpreter goes through the code twice.

The first run through the code – also referred to as the compile run – is what affects scope the most. The interpreter looks through the code for variable and function declarations, and moves those to the top of the_current scope_. It's important to note that_only declarations_are moved and that assignments are left as-is for the second run – also known as the execution run.

To better understand this, let's use this simple snippet of code:

```
'use strict'

var foo = 'foo';
var wow = 'wow';

function bar (wow) {
  var pow = 'pow';
  console.log(foo); // 'foo'
  console.log(wow); // 'zoom'
}

bar('zoom');
console.log(pow); // ReferenceError: pow is not defined
```

The above code will look like this after the compile run:

```
'use strict'
// Variables are hoisted at the top of the current scope
var foo;
var wow;

// Function declarations are hoisted as-is at the top of the current scope
function bar (wow) {
  var pow;
  pow = 'pow';
  console.log(foo);
  console.log(wow);
}

foo = 'foo';
wow = 'wow';

bar('zoom');
console.log(pow); // ReferenceError: pow is not defined
```

The most important thing to understand here is that declarations are hoisted to the top of their_current scope_. This will be crucial in understanding scope in JavaScript, as we'll explain later in this article.

For instance, the variable`pow`was declared in the function`bar`because this is its scope, instead of being declared in the parent scope.

The function`bar`‘s parameter`wow`is also declared in the function scope. In fact, all function parameters are_implicitly_declared within the function scope, and this is why`console.log(wow)`on line 9 outputs`zoom`instead of`wow`.

## Lexical Scope {#toc_2}

Now that we've covered how the JavaScript interpreter works and made a brief introduction to hoisting, we can dig deeper into what scope is. Let's start with the lexical scope, which means compile-time scope. In other words,**the decision for what the scope is was actually made during compilation time**. For the purpose of this article, we'll ignore exceptions to this rule that occur specifically if the code uses`eval`or`with`, because we should not be using those in any case.

The interpreter's second run is where the variable assignments are made and functions are executed. In the sample code above, this is where`bar()`is executed on line 12. The interpreter needs to find the declaration of`bar`before executing it, and it does so by first looking in its current scope. At that point, the current scope is the_global scope_. Thanks to the first run, we know that`bar`is declared at the top of the file so the interpreter can find it and execute it.

If we look at line 8`console.log(foo);`, the interpreter needs to find the declaration of`foo`before executing this line. The first thing it does, again, is look in its current scope which is the function`bar`'s scope this time – not the_global scope_. Is`foo`declared in this function's scope? No. Then, it'll go up a level to its parent scope and look for the declaration there. The function's parent scope is the_global scope_. Is`foo`declared in the_global scope_? Yes, so the interpreter can execute it.

> To summarize, the lexical scope means that the scope was determined after the first run, and when the interpreter needs to find a variable or function declaration, it'll first look in its current scope but will keep going up to the parent scope as long as it doesn't find the declaration it needs. The highest level it can go up to is the_global scope_.

If it doesn't find the declaration in the_global scope_, it'll throw a`ReferenceError`error.

Also, since the interpreter always looks for a declaration in the current scope before looking in the parent scopes, the lexical scope introduces the concept of variable shadowing in JavaScript. This means that a variable`foo`declared in the current_function scope_will_shadow_– or hide – a variable with the same name in the parent scope. Let's look at the following code to better understand what shadowing is:

```
'use strict'

var foo = 'foo';

function bar () {
  var foo = 'bar';
  console.log(foo);
}

bar();
```

The output of the code above is_bar_instead of_foo_because the variable declaration of`foo`on line 6 shadows the variable declaration of`foo`on line 3.

Shadowing is a design pattern that can be useful if we want to mask certain variables and prevent them from being accessed in specific scopes. That said, I personally tend to avoid using it unless absolutely necessary because I believe that using the same variable names creates more confusion among teams and can sometimes cause developers to assume the variable has a different value than what it really has.

### FUNCTION SCOPE {#toc_3}

As we saw in the lexical scope, the interpreter declares a variable in its current scope, which means that a variable declared in a function is declared in the_function scope_. This scope is limited to the function itself and its children – other functions declared within this function.

Variables declared in a function scope cannot be accessed from the outside. This is a very powerful pattern to leverage when you want to create private properties and only have access to them from within a_function scope_, as we can see in the following code:

```
'use strict'

function convert (amount) {
   var _conversionRate = 2; // Only accessible in this function scope
   return amount * _conversionRate;
}

console.log(convert(5));
console.log(_conversionRate); // ReferenceError: _conversionRate is not defined
```

### BLOCK SCOPE {#toc_4}

A_block scope_is similar to a_function scope_, but is limited to a_block_instead of a function.

As of ES3, a_catch_clause in_try / catch_statements has a_block scope_, which means that it has its own scope. It's important to note that the_try_clause does not have a_block scope_, only the_catch_clause does. Let's look at a code snippet to better understand this:

```
'use strict'

try {
  var foo = 'foo';
  console.log(bar);
}
catch (err) {
  console.log('In catch block');
  console.log(err);
}

console.log(foo);
console.log(err);
```

The previous code will throw an error on line 5 when we try to access`bar`, which will cause the interpreter to go into the_catch_clause. This will declare an`err`variable in its scope, which will not be accessible from the outside. In fact, an error will be thrown when we try to log the value of`err`on the last line:`console.log(err);`. The exact output of this code is:

```
In catch block
ReferenceError: bar is not defined
    (...Error stack here...)
foo
ReferenceError: err is not defined
    (...Error stack here...)
```

> Notice how`foo`is accessible outside the_try / catch_but`err`is not.

As of ES6,`let`and`const`variables are attached implicitly to the current_block scope_instead of the_function scope_. This means that these variables are limited to the block they were declared in, whether it's an`if`block, a`for`block, or a function. Here's an example to better demonstrate this:

    'use strict'

    let condition = true;

    function bar () {
      if (condition) {
        var firstName = 'John'; // Accessible in the whole function
        let lastName = 'Doe'; // Accessible in the `if` only
        const fullName = firstName + ' ' + lastName; // Accessible in the `if` only
      }

      console.log(firstName); // John
      console.log(lastName); // ReferenceError
      console.log(fullName); // ReferenceError
    }

    bar();

`let`and`const`variables allow us to use the_principle of least disclosure_, which means that a variable should only be accessible in the smallest scope possible. Before ES6, developers often used to do this stylistically by declaring`var`s in IIFEs, but now we can functionally enforce this in ES6 through`let`and`const`. Some of the main benefits of this principle is to avoid bad access to variables and therefore reduce the possibility of bugs, and also to allow the garbage collector to clean these unused variables once we're out of the_block scope_.

### IIFE {#toc_5}

An Immediately Invoked Function Expression \(IIFE\) is a very popular JavaScript pattern that allows a function to create a new_block scope_. IIFEs are simply_function expressions_that we invoke as soon as the interpreter runs through the function. Here's an example of an IIFE:

```
'use strict'

var foo = 'foo';

(function bar () {
  console.log('in function bar');
})()

console.log(foo);
```

This code will output`in function bar`before`foo`because the function`bar`is immediately executed, without having to explicitly call it through`bar()`. The reasons for this are:

* The opening bracket`(`before the keyword`function` which makes it a _function expression _instead of a _function declaration_.
* The brackets`()`at the end, which execute the _function expression _immediately.

As we saw earlier, this allows to hide variables from outer scopes, to limit their access, and to not pollute the outer scopes with unneeded variables.

IIFEs are also very useful if you are running asynchronous operations and want to conserve the state of your variables in the IIFE's scope. Here's an example of what this means:

```
'use strict'

for (var i = 0; i < 5; i++) {
  setTimeout(function () {
    console.log('index: ' + i);
  }, 1000);
}
```

Despite our first assumption that this will output`0, 1, 2, 3, 4`, the actual result of this`for`loop that runs an asynchronous operation \(`setTimeout`\) is:

```
index: 5
index: 5
index: 5
index: 5
index: 5
```

The reason for this is that by the time the 1000 milliseconds expire, the`for`loop has completed and the value of`i`is actually 5.

Instead, if we want to output the values`0, 1, 2, 3, 4`, we need to use IIFEs to conserve the scope we want, as follow:

```
'use strict'

for (var i = 0; i < 5; i++) {
  (function logIndex(index) {
    setTimeout(function () {
      console.log('index: ' + index);
    }, 1000);
  })(i)
}
```

In this sample, we are passing the value of`i`to the IIFE, which will have its own scope and will not be affected by the`for`loop anymore. The output of this code is:

```
index: 0
index: 1
index: 2
index: 3
index: 4
```

## Conclusion {#toc_6}

There is a lot more we can discuss about scope in JavaScript, but I feel like this is a solid introduction to what scope is, the different types of scope, and how to use some design patterns to take advantage of this.

In the next article, I would like to cover what_context_and_this_are in JavaScript, what_explicit or hard bindings_are, and what the`new`keyword represents.

I hope this helped clarify what scope is, and if you have any questions or comments, do not hesitate to respond via the comments.

_If you're interested in better learning what JavaScript is and how it works at its core, you can follow along on _[_my blog_](https://designingforscale.com/)_._

Source:[https://developer.telerik.com/topics/web-development/understanding-scope-in-javascript/](https://developer.telerik.com/topics/web-development/understanding-scope-in-javascript/)





