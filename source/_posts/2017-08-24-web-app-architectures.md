---
title: Web App Architectures Overview
---

In the modern world of web app architecture it’s truly _too easy_to become lost in the variety of options available to us. When it comes to building web applications, a few stand out. But the task of deciding which architecture to use is still daunting. We’re all probably familiar with the classic Model View Controller pattern \(MVC\). But then there’s MVVM, MVP, Flux, and a variety of others. _What are the differences?Which is right for me? How do they compare to each other?_These are the questions I’ll try to answer. I will make general recommendations regarding the use of certain architectures, but these cannot be applied to all projects, as every project is unique.

### Model-View-Controller \(MVC\)

Let’s start with the classic MVC pattern. This is easily the most well known architectural pattern, but is sometimes misunderstood. Often times, developers will segment their application into a Model, View, and Controller, and call that good enough. But MVC defines a clear path of communication that can sometimes be overlooked by someone just learning about the architecture. Let’s check out the diagram below.  
![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/mvc-2.jpg)

The part of MVC that is overlooked is the unidirectional interactions that it specifies the modules should have. This means that each module should only interact with a module if there is an error connecting the two in the correct direction. Typically, people will implement this in such a way where there is bidirectional communication, and/or an additional relationship between the controller and view modules \(without going through the user\). I just want to highlight that while the 3 layers are important, we should also pay attention to how they communicate.

#### Is This a Practical Architecture for Modern Web Applications?

**No. **_In my opinion, _MVC is not a good architecture for web applications in it’s most strict form. Model-View-Controller is great. It gave birth to the architecture of user-facing applications. It popularized the concept of modularity in the form of application layers. But the path of communication \(as defined in the diagram\) greatly limits what your application can accomplish. For instance, how do I invoke an action that doesn’t change the model but updates the view? Exceptions to the rule must be made.

**A loosely interpreted MVC architecture can make a great web application, however.**In fact, many other software architecture patterns have evolved from Model-View-Controller. So let’s dive into those.

### Model-View-Presenter \(MVP\)

Model-View-Presenter is a slightly more practical architecture pattern for web applications. The concept is basic. The presenter updates the view. The view sends user events to the presenter. The presenter changes state in the model. The state propagates from the model back to the presenter. Communication between the connected layers is bi-directional. Furthermore, the View and Model are completely decoupled from one another. Check out the diagram below for a visual aid.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/mvp-1.jpg)

#### How is this different than MVC?

There are a few notable differences here.

* The view and model are completely decoupled from one another.
* The Presenter can be correlated to the Controller in MVC, but has the added responsibility of managing the view.
* The Model dispatches state changed events back to the presenter instead of interacting with the view.

#### Is This a Practical Architecture for_Modern_Web Applications?

**Not really.**While MVP is a great leap in the right direction, it’s not quite up to the standards of_modern_web apps. You can certainly use this in your ASP.NET Web Forms application, and it will do wonders for you. However, there are other architectures you could implement that could give you a better experience.

### Model-View-ViewModel \(MVVM\)

The MVVM pattern defines 3 layers, similar to what we’ve seen before. The Model in this case defines both the data and the business logic. The ViewModel transforms data from the Model. MVVM takes advantage of data binding to update parts of the view, without necessarily rendering the entire page. Looking at the diagram below, we can see the similarities between this and the MVP pattern.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/mvvm.jpg)

#### How is this different than MVC?

Well, MVVM does have 3 main layers of separation. However, unlike a Controller in MVC, the ViewModel’s responsibility is facilitating the transportation of data between the View and Model. The View is a simple presentation of the data given by the ViewModel. Additionally, the view leverages data binding whereas this concept does not exist in the vanilla MVC architecture.

#### **How is this different than MVP?**

The biggest advantage MVVM has over MVP is that it incorporates the idea of data binding. A ViewModel, however, should be more concerned with _what_is shown in a view than _how_it is shown. The Presenter in MVP dictates much about how the view is rendered.  The ViewModel here should just facilitate the transformation of data between the view and model.

#### Is This a Practical Architecture for_Modern_Web Applications?

**Yes. **Using an MVVM architecture, you can create websites with great user experience. Data binding makes it simple to update parts of your UI and send those results back to your Model. However, there is a lot of overhead to implementing this type of architecture. Using a framework such as AngularJS that supports this type of architecture out-of-the-box is key.

### Flux

The Flux architecture really isn’t all that different from the other ones we’ve talked about. It separates your View, Model, and other logic. However, Flux introduces the concept of a few more components. Let’s look at the diagram first so you can get an idea of how they interact.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/flux.jpg)In this architecture, actions are invoked when the user makes specific interactions with the view. These actions are then dispatched to subscribed entities via registered callbacks. State is changed in the store. The changed state is then propagated back to the view and displayed to the user._In my opinion,_this is a good way of visualizing what a lot of implementations eventually evolved into.

#### How is this different than MVC?

Flux is different from MVC in a number of ways. There’s no real concept of a controller in Flux. The closest we’ve got to a controller are actions. These actions affect the state and perform some business logic in the application. The store maintains the application state, but contains no business logic like the Model does. Finally, we have a dispatcher baked into the architecture to facilitate event handling.

#### How is this different than MVP?

Flux is different from MVP in that it defines a unidirectional, cyclical flow of interaction between the components. Furthermore, the View manages itself rather than being managed by a Presenter. State is passed directly into the view from the Store without a middle-man.

#### How is this different than MVVM?

I would say that Flux is more similar to MVVM than it is to MVP. However, there are some distinctions. Namely, the unidirectional flow. The flow of interaction in MVVM _could_result in a behavior similar to that of Flux. Meaning, I could interact with some data, the ViewModel could send those changes to the Model, the Model could send another event back to the ViewModel, which renders the view again. However, I would say that MVVM is less strict than Flux in that the flow of interaction does not always have to work out that way. You could very well have a case where you interact with the view, something happens in your ViewModel, but nothing else occurs. In Flux, if you dispatch an action, that change goes all the way through the process.

#### Is This a Practical Architecture for_Modern_Web Applications?

**Yes. **However, Flux can be very difficult to implement from scratch. It can be done. But using libraries that build off the Flux architecture \(like Redux\) is often a better way to reap the benefits it has to offer without the overhead of developing that scaffolding.

### Takeaways

It’s important to remember that architecture patterns are generalized specifications to solving common problems. Many times, you’ll have to stray from the defined pattern to do what’s best for the design of your specific application. There is no “one truth” when it comes to software design. All we can do is pick a pattern that best fits our general needs, and modify our architecture from there.  
  
Source: https://michaelwashburnjr.com/an-analysis-of-web-app-architecture/ 

