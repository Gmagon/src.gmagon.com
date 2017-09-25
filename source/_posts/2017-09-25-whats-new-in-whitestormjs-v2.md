---
title: What’s new in Whitestorm.js V2
---

# The power of modules

In this post, we will look into some new features**whs**offers along with some practical examples, one to build a simple sphere, then a more advanced one to build a geometry with texture.

#### What is WhitestormJS

[**whs**](https://www.npmjs.com/package/whs)is a component based JavaScript framework for building animated_3D graphics_with support for physics in the web browser. It uses[**WebGL**](https://get.webgl.org/)and[**three.js**](http://threejs.org/)under the hood, and is entirely open source.

#### Why use whs

* Speed up development.
* Structure your code with components and modules.
* Easily apply physics with collision detection, soft and rigid body dynamics.

Works great for teams, it enforces patterns and structure to large and complex projects. Your code is more readable and maintainable.

The framework also makes it simpler to get started with a project. The boiler plate having to write is kept at minimum, you get to see results in no time.

Here is how to create a scene, a sphere with some material applied to it, some light and even an orbit control to navigate. You can see the source code and result in the codepen below:

[http://codepen.io/sasha240100/pen/JELBGX](http://codepen.io/sasha240100/pen/JELBGX)

#### State of whs

The focus is now entirely on v2. Although_still_beta, the API is pretty stable. We brought in new features and modules. The framework continues to leverages[three.js](http://three.js/)and offers a much simpler 3D development toolset.

#### Component oriented

If you are new to the WhitestormJS framework — start[here](https://whsjs.readme.io/docs). This second version is focused on integrations. It introduces a completely new API that lets you extend your components via modules.

#### Modules

Ever wanted to add 3d sound to your scene with multiple directional audio sources? How about Physics, glowing effects, autoresize, and support for[socket.io](http://socket.io/)? Modules to the rescue!

Modules are awesome. Modules can do anything you can do with a plains_THREE.Mesh_, but much keeping your code more**cleaner**and**flexible**.

#### But what’s a module exactly?

Simply put, a module is an extension of your components, or app.

![](http://img2.tuicool.com/QNvmyuJ.jpg!web)

Pic 1. This work space is neat, many parts of it are made of the same element set. A chair is made of simple wood, with other materials over it.

#### DRY

Don’t Repeat Yourself. We all know this right? Capabilities gets applied to components using modules. WhitestormJS is offering a growing number of modules written by the community and core developers.

#### Flexible

You can always remove, change \(fork\) and extend certain modules specificities to fit your needs. They are configured by default to cover most common use cases.

#### Easy to use

Modules are applied to existing components with just a few lines of code

![](http://img0.tuicool.com/fQRRNvz.png!web)

Pic 2. AudioModule used in WHS.Sphere

#### How Modules work

The module system is following a unique philosophy. Its strength is in making your modules work**together**.

![](http://img2.tuicool.com/Ebme22J.jpg!web)

Pic 4. Separation of concern and coordination accomplishes great things.

Let’s say you have a_sound_and a_physics_module you wish apply to a component . Bodies dynamics and audio don’t generally impact each other, no worries there… But let’s take another case with the App’s_rendering_and_camera_module. This leads to a two way dependency:

* Rendering a scene needs to take into consideration the camera’s attributes such as its position, angle, focal length, etc.
* Camera movements alters the rendering projection.

Let’s talk a bit about how the module system works, diving into how it manages modules applied to components.

The module manager handles all the modules references, acting as a bridge to modules applied to your components.

#### Module lifecycle

![](http://img2.tuicool.com/jU7bYrv.png!web)

Pic 4. Graph

Let’s go through the life cycle of a Module when applied to a**SphereComponent**.

1. **Applying the module to a Sphere**
. The code below shows how a
**Module,**
here doing texturing
**,**
is initiated and passed as
_**modules property**_
of the component. Line 9. and 10.

![](http://img0.tuicool.com/MNrIBrr.png!web)

Pic 5. Example

2.**Modules are applied to the component.**At this stagewe can’t access the Sphere attributes, it isn’t built yet. But we can add_methods_, share_dependencies_with other modules, or apply other changes like a_transform_on its Mesh.

Modules in the array are executed one after another._That’s why order matters._

3._**manager\(manager\)**_is executed. This function provides access to the_**manager**_object. The module can communicate with**other modules**that exist in the app context.

4._**integrate\(self\)**_is then executed. In this function,_**this**_within the function scope represents the component’s instance. The module instance is exposed by the_**self**_argument.

5._**build\(\)**is then invoked_, the component generates the_THREE.Mesh_instance.

![](http://img2.tuicool.com/qqm6f2A.png!web)

Pic. 6: build\(\) method inside WHS.Sphere class

6._**bridge \(material\)**_is executed. This is where our module accesses the_geometry_of the component and applies texture\(s\) to its material.

The code below shows the bridge logic of our**TextureModule**which gets applied to our component. Fulfilling its role of applying its own texture\(s\) to the material.

![](http://img2.tuicool.com/iE7neqF.png!web)

Pic 7. Fragment of code from TextureModule

The bridge returns the material.

7._**bridge \(mesh\)**_is executed. The module can access the component’s_mesh_object. \(see_Pic. 6_\).

8. Component executes the_wrap\(\)_method. This is when all transforms params are applied to the Mesh.

Let’s see how the**Texture Module**applied the texture looks like on a_**WHS.Box,**_also addeda few point lights.

![](http://img0.tuicool.com/yeiAza3.png!web)

Example that uses TextureModule.

[https://whs-dev.surge.sh/examples/?lights/point](https://whs-dev.surge.sh/examples/?lights/point)

The key thing to remember, is that modules are re-usable throughout the project, can be exported and shared across teams. Plenty of useful modules to accomplish common effects such as the texturing we applied in this example are already available to use. Writing your own module involved following the steps shown in the_Life Cycle of a module_.

I hope this walkthrough of the inner parts of**WhitestormJS**was helpful to you! Hit the :green\_heart: and share this if you enjoyed the article - :blush: - It will motivate us to write more.

You can join us on[**Discord**](https://discordapp.com/invite/frNetGE), say hi, ask anything about**whs**,**three.js**or 3d in general.


Source:  https://medium.com/whitestormjs-framework/whats-new-in-whitestorm-js-v2-c81c1f3ab960