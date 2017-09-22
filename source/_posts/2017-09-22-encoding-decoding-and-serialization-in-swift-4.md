---
title: Encoding, Decoding and Serialization in Swift 4 
---

![](http://img2.tuicool.com/QFnUzyV.png!web)
This is an abridged chapter from our best-selling book Swift Apprentice, which has been completely updated for Swift 4 and includes several new chapters. This tutorial is presented as part of ouriOS 11 Launch Party — enjoy!

There are several scenarios where you’ll need to save data to a file or to send it over the network. In this tutorial, you’ll learn how to achieve these tasks by converting your instances to another representation, like a string or a stream of bytes. This process is known as_encoding_, also known as_serialization_.

The reverse process of turning the data into an instance is called_decoding_, or_deserialization_.

Imagine you have an instance you want to write to a file. The instance itself cannot be written as-is to the file, so you need to encode it into another representation, like as a stream of bytes:

![](http://img0.tuicool.com/3MbYzar.png!web)

Once the data is encoded and saved to a file, you can turn it back into an instance whenever you want by using a decoder:

![](http://img2.tuicool.com/eYbIVjZ.png!web)

## Encodable and Decodable Protocols

The`Encodable`protocol is used by types that can be encoded to another representation. It declares a single method:

```
func encode(to: Encoder) throws
```

…which the compiler generates for you if all the stored properties of that type conform to`Encodable`as well. You’ll learn more about this later on in the tutorial.

TheDecodableprotocol is used by types that can be decoded. It declares just a single initializer:

```
init(from decoder: Decoder) throws
```

You will know when and how to implement these methods by the end of this tutorial.

## What is Codable?

`Codable`is a protocol that a type can conform to, to declare that it can be encoded and decoded. It’s basically an alias for the`Encodable`and`Decodable`protocols.

```
typealias Codable = Encodable & Decodable
```

## Automatic Encoding and Decoding

There are many types in Swift which are codable out of the box:`Int`,`String`,`Date`,`Array`and many other types from the Standard Library and the Foundation framework. If you want your type to be codable, the simplest way to do it is by conforming to`Codable`and making sure all its stored properties are also codable.

For example, let’s say you own a toy factory and you have this struct to store employee data:

```
struct Employee {
var name: String
var id: Int
}
```

All you need to do to be able to encode and decode this type is to conform to the`Codable`protocol, like so:

```
struct Employee: Codable {
var name: String
var id: Int
}
```

Wow, that was easy! You were able to do it because both`name`\(`String`\) and`id`\(`Int`\) are codable.

This works well when you’re only using types that are already`Codable`. But what if your type includes other custom types as properties? For example, looking at your`Employee`struct, assume that it also has a`favoriteToy`property:

```
struct Employee: Codable {
var name: String
var id: Int
var favoriteToy: Toy
}

struct Toy: Codable {
var name: String
}
```

By making sure`Toy`also conforms to`Codable`, you maintain the overall conformance to`Codable`for`Employee`as well.

All collections types, like`Array`and`Dictionary`are also codable if they contain codable types.

## Encoding and Decoding Custom Types

There are several representations you can encode to or decode from, such as XML or a Property List. In this section, you’ll learn how to encode to and decode from JSON, by using Swift’s`JSONEncoder`and`JSONDecoder`classes.

JSON stands for JavaScript Object Notation, and is one of the most popular ways to serialize data. It’s easily readable by humans and easy for computers to parse and generate.

For example, if you were to encode an instance of type`Employee`to JSON, it might look something like this:

```
{ "name": "John Appleseed", "id": 7 }
```

You can easily understand how the`Employee`instance looked like before it was serialized into JSON.

### JSONEncoder and JSONDecoder

Once you have a codable type, you can use`JSONEncoder`to convert your type to`Data`which can be either written to a file or sent over the network. Assume you have this employee instance:

```
let toy1 = Toy(name: "Teddy Bear");
let employee1 = Employee(name: "John Appleseed", id: 7, favoriteToy: toy1)
```

John’s birthday is coming up and you want to give him his favorite toy as a gift. You need to send over this data to the Gifts department. Before you can do that, you need to encode it like this:

```
let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)
```

You’ll notice that you need to use`try`because`encode(_:)`might fail and throw an error.

If you try to print`jsonData`like this:

```
print(jsonData)
```

You’ll see that Xcode omits the data and only provides the number of bytes in`jsonData`. This is fine, because`jsonData`contains an unreadable representation of`employee1`. If you would like to create a readable version of this JSON as a string, you can use`String`’s initializer:

```
let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString)
// {"name":"John Appleseed","id":7,"favoriteToy":{"name":"Teddy Bear"}}
```

Now you can send`jsonData`or`jsonString`over to the gifts department using their special gift API.

If you want to decode the JSON data back into an instance, you need to use`JSONDecoder`:

```
let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from: jsonData)
```

Note that you need to tell the decoder what type to decode the JSON to, because the compiler can’t figure this out on its own.

## Renaming Properties With CodingKeys

It turns out that the gifts department API requires that the employee ID appear as`employeeId`instead of`id`. Luckily, Swift provides a solution to this kind of problem.

### CodingKey Protocol, CodingKeys Enum

The`CodingKeys`enum, which conforms to`CodingKey`protocol, lets you rename specific properties in case the serialized format doesn’t match the requirements of the API.

Add the nested enumeration`CodingKeys`like this:

```
struct Employee: Codable {
var name: String
var id: Int
var favoriteToy: Toy

enum CodingKeys: String, CodingKey {
case id = "employeeId"
case name
case favoriteToy
}
}
```

There are several things to note here:

1. `CodingKeys`
is a nested enumeration in your type.
2. It has to conform to
`CodingKey`
.
3. You also need
`String`
as the raw type, since the keys are always strings.
4. You have to include all properties in the enumeration, even if you don’t plan to rename them.
5. By default, this enumeration is created by the compiler, but when you need to rename a key you need to implement it yourself.

Now if you print the JSON, you’ll see that the stored property`id`key has changed to`employeeId`:

```
{ "employeeId": 7, "name": "John Appleseed", "favoriteToy": {"name":"Teddy Bear"}}
```

## Manual Encoding and Decoding

You try to send the data over to the gifts department, and again the data gets rejected. This time they claim that the information of the gift you want to send to the employee should not be inside a nested type, but rather as a property called`gift`. So the JSON should actually look like this:

```
{ "employeeId": 7, "name": "John Appleseed", "gift": "Teddy Bear" }
```

In this case you can’t use`CodingKeys`, since you need to alter the structure of the JSON and not just rename properties. You need to write your own encoding and decoding logic.

### The encode Function

As mentioned earlier in the tutorial,`Codable`is actually just a typealias for the`Encodable`and`Decodable`protocols. You need to implement`encode(to: Encoder)`and describe how to encode each property.

It might sound complicated, but it’s pretty simple. First, update`CodingKeys`to use the key`gift`instead of`favoriteToy`:

```
enum CodingKeys: String, CodingKey {
case id = "employeeId"
case name
case gift
}
```

Then, you need to remove`Employee`’s conformance to`Codable`and then add this extension:

```
extension Employee: Encodable {
func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: CodingKeys.self)
try container.encode(name, forKey: .name)
try container.encode(id, forKey: .id)
try container.encode(favoriteToy.name, forKey: .gift)
}
}
```

First you get back the`container`of the encoder. This is a view into the storage of the encoder that you can access with keys. Note how you choose which properties to encode for which keys. Importantly, you flatten`favoriteToy.name`down to the`.gift`key.

If you stop now, you should get an error that says:

```
'Employee' does not conform to expected type 'Decodable'
```

This is because you removed the conformance to`Codable`and only added conformance to`Encodable`. For now you can comment out the code that decodes`jsonString`to`employee2`.

If you print`jsonString`once more, this is what you’ll get:

```
{"name":"John Appleseed","gift":"Teddy Bear","employeeId":7}
```

Success!

### The decode Function

Once the data arrives at the gifts department, they need to be able to convert this JSON back to an instance in their system. For this they’ll need a decoder.

Add the following code to your playground to make`Employee`conform to`Decodable`\(and thus also`Codable`\):

```
extension Employee: Decodable {
init(from decoder: Decoder) throws {
let values = try decoder.container(keyedBy: CodingKeys.self)
name = try values.decode(String.self, forKey: .name)
id = try values.decode(Int.self, forKey: .id)
let gift = try values.decode(String.self, forKey: .gift)
favoriteToy = Toy(name: gift)
}
}
```

Here you’re pretty much doing the opposite of what you did in the`encode`method using the decoder’s keyed storage container.

## Key Points

* You need to encode \(or _serialize_\) an instance before you can save it to a file or send it over the web.
* Your type should conform to the`Codable`protocol to make it codable. If all properties are codable, then the type is automatically codable as well.
* JSON is the most common encoding in modern applications and web services, and you can use`JSONEncoder`and`JSONDecoder`to encode and decode your types to and from JSON.

## Where to Go From Here?

You can download[the final package from this tutorial here](https://koenig-media.raywenderlich.com/uploads/2017/09/22-codable-serialization.playground.zip).

![](http://img2.tuicool.com/QNjaya3.png!web)If you enjoyed what you learned in this tutorial, why not check out[the complete Swift Apprentice book](https://store.raywenderlich.com/products/swift-apprentice), available on our store?

Here’s a taste of what’s in the book:

* _Section I: Swift Basics_
: The first section of the book starts at the very beginning of the computing environment: first, how computers work, and then, how Swift’s playgrounds feature works. With those logistics out of the way, you’ll take a tour of the fundamentals of the Swift language and learn the basics of managing data, structuring your code, performing simple operations and calculations, working with types.
* _Section II: Collection Types_
: Stored data is a core component of any app, whether it’s a list of friends in your social networking app or a set of unlockable characters in your hit game. In this section, you’ll learn how to store collections of data in Swift.
* _Section III: Building Your Own Types_
: Swift comes with basic building blocks, but its real power is in the custom things you can build to model parts of your app. Swift has no idea about playable characters and monsters and power-ups, for example — these are things you need to build yourself! You’ll learn how to do that in this section.
* _Section IV: Advanced Topics_
: The final section of the book covers more advanced topics in Swift. You’ll learn about specific things, such as how to handle problems that come up as your code runs, as well as about more general things such as memory management, which will help you understand some of Swift’s behind-the-scenes mechanisms.

By the end of this book, you’ll have some great hands-on experience with all of the best features of the Swift 4 programming language.

And to help sweeten the deal, the digital edition of the book is on sale for_$49.99_! But don’t wait — this sale price is[only available for a limited time](https://store.raywenderlich.com/products/swift-apprentice).

Speaking of sweet deals, be sure to check out the great prizes we’re giving away this year with theiOS 11 Launch Party, including over_$9,000_in giveaways!

To enter, simply retweet this post using the \#ios11launchparty hashtag by using the button below:

We hope you enjoy this update to one of our most-loved books. Stay tuned for more book releases and updates coming soon!


Source:  https://www.raywenderlich.com/172145/encoding-decoding-and-serialization-in-swift-4
