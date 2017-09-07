---
title: Introduction to Actor Model
---

![](https://user-images.githubusercontent.com/4419992/30080803-588cc15a-925b-11e7-942b-e701fb928a27.jpg)The Actor Model was proposed in the 70’s by Carl Hewitt as a conceptual model to deal with concurrent computation. There are a good amount of[implementations](https://monades.roperzh.com/get-to-know-the-actor-model/actor-implementations)out there in the wild, from complete programming languages to libraries and frameworks; the most popular ones being[Erlang](https://www.erlang.org/)/[Elixir](https://elixir-lang.org/)and[Akka](http://akka.io/). Every implementation has its own particularities, but the foundational concepts remain the same.

In this post, you’ll be building a JavaScript library that implements the Actor Model, and while most of the implementations mentioned above are more robust, the purpose of this post is to explore the foundations of the model and think about possible use cases.

## Background 

In the Actor Model, an actor is the foundation on which you build the structure of your application, it has**internal state**invisible to the outer world and interacts with other actors through**asynchronous messages**.

If this sounds to you a lot like Object-Oriented Programming \(OOP\), you are right. The Actor Model can be thought as OOP with special treatment to messages: they are_delivered_asynchronously and_executed_synchronously by the receiver.

Every actor is identified with a**unique address**by which you send messages to it. When a message is processed, it is matched against the current**behavior**of the actor; which is nothing more than a function that defines the actions to be taken in reaction to the message. In response to a message, an actor may:

* Create more actors.
* Send messages to other actors.
* Designate internal state to handle the next message.

## Implementation 

With the base concepts in mind, may be a good idea to take a peek to how the library will be used:

import Actor from "actor-model";

// Define a behavior to handle messages
const counter = {
// Define the initial state of the actor
init() {
return { count: 0 };
},

// Define methods to be invoked in response
// to messages

incrementBy(state, { number }) {
let count = state.count + number;
return { count };
},

logTotal(state) {
console.log(state.count);
}
};

// Initialize an actor with the `counter` behavior
const address = Actor.start(counter);

// Log the initial state
Actor.send(address, ["logTotal"]); // => { count: 0 }

// Increment the counter by 2
Actor.send(address, ["incrementBy", { number: 2 }]);

// Log the current state
Actor.send(address, ["logTotal"]); // => { count: 2 }

## Messaging system 

As previously mentioned, messages are sent asynchronously but once they arrive at destination are queued and processed synchronously.

This mechanism can be thought of as a FIFO \(First In First Out\) queue, which turns out to be how the JavaScript[event loop](https://monades.roperzh.com/get-to-know-the-actor-model/node-event-loop)works. The library takes advantage of this by making the event loop the chore of the messaging system.

This post uses the node.js[event system](https://nodejs.org/api/events.html), because the API is less verbose than the Web APIs, as a refresher, this gist of code shows how`events`work:

```
import EventEmitter from "events";

const mailbox = new EventEmitter();

// Binding listeners to custom events
mailbox.on("channel-name", message => {
console.log(message);
});

// Firing custom events: the second argument
// is sent to the callback function
mailbox.emit("channel-name", "hello!");
```

> E.O. Wilson famously said that “one ant is no ant”, right? well, one actor is no actor, they come in systems! — Carl Hewitt

The first thing to define is the`start`function. This function is in charge of creating a new actor and returning an address to which other actors send messages to.

To generate this unique address the library takes advantage of the[`Symbol()`](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Symbol)function, which returns a unique value every time is invoked. For now, the first implementation of`start`just returns an address:

```
const Actor = {
start() {
return Symbol();
}
};

const address = Actor.start();
console.log(address); //=> Symbol()
```

## Messaging 

While the behind of scenes of the[messaging system](https://monades.roperzh.com/get-to-know-the-actor-model/#messaging-system)is handled by the event loop, the library still needs to provide a clear way to send messages to a specific actor address.

A convenient method do this is to use the actor address \(`Symbol`primitive\) as the event name:

```
const mailbox = new EventEmitter();

const Actor = {
start() {
const address = Symbol();

// Use the address as the event name
mailbox.on(address, function() {});

return address;
}
};
```

The actor is now equipped to receive messages, but the system lacks of a standard way to send messages, and this is where the`send`function comes into play. This function receives an actor address, a message, and emits an event using the`events`API.

```
const Actor = {
//...

send(target, message) {
mailbox.emit(target, message);
}
};
```

## Internal state

As messages come, the actor wants to designate internal state to handle the next upcoming message. A possible way to do it is to take advantage of closures: define an initial state when`start`is called, and update it as messages come in the callback function:

const Actor = {
start() {
const address = Symbol();

// Define an initial state
let state = {};

mailbox.on(address, function(message) {
// Do something based on `message` and
// update the state (assuming `newState`
// has been defined somewhere in this
// function)
state = newState;
});

return address;
}

//...
};

## Behavior 

With the base of the system in place, the last step is to provide the ability to define custom behavior to handle messages. In the Actor Model, you do this through behaviors.

For the library, a behavior is an object which exposes methods. For convenience sake, this behavior must follow certain rules:

* To set an initial state, the behavior must implement a function called
`init`
which returns the initial state.
* To define the state in which the following message is handled, the method invoked must return a value that is used as the next state.
* When an actor sends a message to another actor, it must provide a “tuple” containing the name of the method that needs to be executed and optional data.
* When invoked, every method in the behavior receives a
`state`
param which represents the current state and an optional second parameter containing data.

In terms of code, this translates to:

```
const Actor = {
start(behavior) {
const address = Symbol();
// Set the initial state, if the behavior defines an init function invoke
// it, otherwhise set the state to an empty object.
let state = typeof behavior.init === "function" ? behavior.init() : {};

// Desconstruct the data provided by the caller
mailbox.on(address, function([method, message]) {
// Call the required method on the behavior, if the method returns
// a value, use it to define the next state.
state = behavior[method](state, message) || state;
});

return address;
}
//...
};
```

## Putting it all together 

The first final version of the library looks like this:

```
import EventEmitter from "events";

const mailbox = new EventEmitter();

const Actor = {
start(behavior) {
const address = Symbol();
let state = typeof behavior.init === "function" ? behavior.init() : {};

mailbox.on(address, function([method, message]) {
state = behavior[method](state, message) || state;
});

return address;
},

send(target, message) {
mailbox.emit(target, message);
}
};

export default Actor;
```

It provides the most basic functionality required to play with the Actor Model. While I wouldn’t suggest anybody build a real application with it, hopefully works as a good intro to how the model works.

Nothing is perfect, and among the many potential issues with this implementation, I’d like to highlight:

* An actor system may contain a potentially infinite amount of actors, therefore they must be as lightweight as possible. Knowing this, a closure doesn’t seem the [most performant](https://monades.roperzh.com/get-to-know-the-actor-model/closures-performance) way to keep state.
* It’s easy to screw up immutability in JavaScript, the actor internal state can be modified externally if users of the library are not extremely careful.

And that’s it for this post! as always, feel free to reach me with any questions/critique/concerns! I’m[@roperzh](https://monades.roperzh.com/get-to-know-the-actor-model/twitter) on Twitter and my [email](https://monades.roperzh.com/get-to-know-the-actor-model/email) is always open.

Source: https://monades.roperzh.com/get-to-know-the-actor-model/





