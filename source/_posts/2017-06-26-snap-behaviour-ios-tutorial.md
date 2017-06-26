---
title: Snap Behaviour iOS Tutorial
---

As part of UIKit Dynamics you can add Snap Behavior to a view, which allows it  to be “snapped” to a specific location. The view will move to its new position as if it is pulled by a spring. In this tutorial we will let the user click on the screen to "snap" an image into place. This tutorial is made with Xcode 8.3.3 and built for iOS 10.3.

Open Xcode and create a new Single View Application.

![](http://img2.tuicool.com/q6zmueM.png!web)

For product name, use**IOS10SnapBehaviourTutorial**and then fill out the Organization Name and Organization Identifier with your customary values. Enter Swift as Language and make sure only iPhone is selected in Devices.

![](http://img2.tuicool.com/NzQvArq.png!web)

Go the**Storyboard**and drag an Image View to the main view, Go to the Size Inspector and set the size to 100 by 100 points.

![](http://img1.tuicool.com/zuAJziF.png!web)

We need a image to insert in our Image View. Downloadthisimage, unpack it and add it to the project. 

![](http://img2.tuicool.com/euYBfir.png!web)

Select the Image View, go to the Attributes Inspector and add the apple.jpg file to Image field.

![](http://img2.tuicool.com/Y3iuqyM.png!web)

The Storyboard should now look like this.

![](http://img0.tuicool.com/vmQjI3q.png!web)

Open the Assistant Editor and make sure the ViewController.swift file is visible. Ctrl + drag from the Image View to the ViewController class and create the following Outlet.

![](http://img1.tuicool.com/MfuIj2z.png!web)

Go to the**ViewController.swift**file and add the following properties

```
var
animator
:UIDynamicAnimator
!

var
snapBehaviour
:UISnapBehavior
!
```

The animator property provides physics-related capabilities for its item and the snapBehaviour property will be applied to the Image View later on. Next, change the**viewDidLoad**method to

```
override
func
viewDidLoad
()
 {
    
super
.viewDidLoad()
        
    
// Create the Tap Gesture Recognizer
let
 tapGesture = 
UITapGestureRecognizer
(target: 
self
, action: #selector(userHasTapped))
    
self
.view.addGestureRecognizer(tapGesture)
        
    
// Create the Dynamic Animator

    animator = 
UIDynamicAnimator
(referenceView: 
self
.view)
}
```

A Tap Gesture Recognizer is created, which will call the userHasTapped method when the user taps on the screen. The Dynamic Animator is created with the main view as its reference view. Next, implement the**userHasTapped**method

```
func
userHasTapped
(tap:UITapGestureRecognizer)
 {
    
let
 touchPoint = tap.location(
in
: 
self
.view)
    
if
 snapBehaviour != 
nil
 {
        animator.removeBehavior(snapBehaviour)
    }
        
    snapBehaviour = 
UISnapBehavior
(item: imageView, snapTo: touchPoint)
    snapBehaviour.damping = 
0.3

    animator.addBehavior(snapBehaviour)
}
```

First the point is captured where the user has touched the screen. There can be only one Snap Behaviour instance active so we check if there is already a behaviour active. If so, we will remove this behaviour. Next the Snap Behaviour is initialized with the**item:snapToPoint**initializer. The item is our Image View and the point to snap to is the user's touch input. The damping property is the amount of oscillation the item has of the end of the snap animation. Finally, the Snap Behaviour is added to the Dynamic Animator.

Build and Runthe project, click anywhere on the screen to "snap" the image to its new location.

![](http://img2.tuicool.com/mIvmY33.png!web)

You can download the source code of the**IOS10SnapBehaviourTutorial**at the ioscreator repository on[Github](https://github.com/ioscreator/ioscreator)

Source: [https://www.ioscreator.com/tutorials/snap-behaviour-ios-tutorial-ios10](http://www.tuicool.com/articles/hit/QJfqM33)

