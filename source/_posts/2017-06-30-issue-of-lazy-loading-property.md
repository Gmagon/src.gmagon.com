---
title: Issue of lazy loading property
---

I’ve got some`readonly`properties in my .h file. And when I tried to lazy loading them as usual like this.

```
// MyView.h
@property
 (
nonatomic
, 
strong
, 
readonly
) 
UIImageView
 *imageView;


// MyView.m

- (
UIImageView
 *)imageView
{
    
if
 (!_imageView)
    {
        _imageView = [
UIImageView
 new];
        _imageView.translatesAutoresizingMaskIntoConstraints = 
NO
;
        _imageView.backgroundColor = [
UIColor
 clearColor];
        _imageView.contentMode = 
UIViewContentModeScaleAspectFit
;
        _imageView.userInteractionEnabled = 
NO
;
        _imageView.accessibilityIdentifier = 
@"empty set image view"
;

        _imageView.image = _defaultImage;

        [_contentView addSubview:_imageView];
    }
    
return
 _imageView;
}

```

Then…bang! It threw out errors in bulk, yelling “Use of undeclared identifier ‘\_imageView’”. What the hell have I done!

Luckily, I found some explainations[here](http://stackoverflow.com/a/13670924/1594792). It says:

Newer Xcode versions can create a @synthesize statement automatically and use the underscore prefix for instance variables. In this case however,since the property is read-only and you provide a getter method, Xcode does not synthesize the property automatically.

So, I have to @synthesize the property on my own, and now it’s quiet and cute again. :P

#### — Update: 2017-05-30 —

I happened to recall this issue when clearing up the whole system of Objective-C. Let’s dig deeper about this issue and find if there’s a diamond in it. :P

This issue has references of two points:`@property`and`@synthesize`. Let’s dig more details one by one.

* `@property`
  : I’d love to reference this paragraph of
  [Ry’s Objective-C Tutorial](http://rypress.com/tutorials/objective-c/properties)
  to show the goal of @property in Objective-C.

An object’s properties let other objects inspect or change its state. But, in a well-designed object-oriented program, it’s not possible to directly access the internal state of an object. Instead, accessor methods \(getters and setters\) are used as an abstraction for interacting with the object’s underlying data.

![](http://img0.tuicool.com/7raeeq3.png!web)

The goal of the @property directive is to make it easy to create and configure properties by automatically generating these accessor methods. It allows you to specify the behavior of a public property on a semantic level, and it takes care of the implementation details for you.

* `@synthesize`
  : First of all, this feature is called
  **autosynthesis**
  of properties and it’s an
  [Objective-C language extension supported by clang](http://clang.llvm.org/docs/LanguageExtensions.html#objective-c-autosynthesis-of-properties)
  , which is the default compiler used by Xcode.

Thanks to autosynthesis you don’t need to explicitly synthesize the property as it will be automatically synthesized by the compiler as`@synthesize propertyName = _propertyName`.

While, there’re some exceptions here:

* Readwrite property with custom getter and setter;
* Readonly property with custom getter;
* @dynamic \(which is opposited to
  `@synthesize`
  \);
* Properites declared in a @protocol;
* Properties declared in a category;
* Overriden properties.

![](http://img1.tuicool.com/QNryQrn.png!web)

In this condition, property`name`is set to be`readwrite`\(as it is by default\) with custom getter and setter. At this time, compiler believes that you want to take full control over`@property`manually, and then forbids autosynthesis for you.

We’ve already been used to not defining ivars on our own, once you have to use ivar, while autosynthesis is invalid, you’ll have to use`@synthesize`to compound ivars\(i.e. let out the comment for line 24 in the image above\).

Here’s a little sample.

```
@interface
Car
:
NSObject
@property
 (
strong
, 
readwrite
) 
NSString
 *name;

@end
@implementation
Car
@end
@interface
Tesla
:
Car
@property
 (
strong
, 
readwrite
) 
NSString
 *name;


@end
@implementation
Tesla
@synthesize
 name;

- (
void
)printVar
{
	
super
.name = 
@"Car"
;
	
NSLog
(
@"Tesla: Hello %@, ivar: %@，super: %@"
, 
self
.name, 
self
-
>
name, 
super
.name);
}


@end
```

Output in console:

```
2017-06-30
16
:02
:03.946
BlockSample
[86278:38771956]
Tesla
: 
Hello
Tesla
, 
ivar
: 
Tesla
，
super
: 
Car
```

It’s also fine to get subclass’s ivar`name`simply by`name`.



Source: [http://www.calios.gq/2017/05/30/Issue-of-lazy-loading-property/](http://www.tuicool.com/articles/hit/mQJbiaj)

