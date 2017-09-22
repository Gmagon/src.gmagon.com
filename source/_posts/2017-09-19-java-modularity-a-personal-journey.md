---
title: Java Modularity-A Personal Journey
---

Java 9 was delayed so many times because of Project Jigsaw, and you might have been hearing a lot about modules, modularity, and other stuff, so what it’s all about? What the heck is modularization and what do we mean by a modularized platform? What's the Java Platform Module System \(JPMS\) all about? Is it going to be a revolution in Java ecosystem?

This post is my exploration of the most important thing that happened to the JDK, the module system. I will explain what modularization is, why you need it, and how you can create your modularized project.

![](http://img0.tuicool.com/uA7zamV.png!web)

## What and Why

Maintainability is one of the most significant concerns in software design and evolution. We want a code base that is loosely coupled, highly cohesive, extremely readable, and can be understandable at a glance. We design our classes and organize them in packages. So far so good, but when we have hundreds of packages, thedependencies between them are not visible at one look. Therefore, we need something more than packages to organize our code base to make it more maintainable.

Another problem is the Java classpath and how it runs our codes. All JAR classes and libraries are flattened into the classpath. When these JAR files have multiple version of a class on the runtime, the Java ClassLoader can load only one version of that class. In this way, there is ambiguity about how your program is going to work, and ambiguity is a bad thing. This issue is so frequent that you might know it as “JAR Hell.”

Another problem with the classpath is that it doesn’t follow the “Fail First” principle. You may have missing classes that exist in the classpath, but not in the production environment. Until you get the**JavaClassDefError exception at runtime**, you can’t be sure what is missing. Finally, the big issue with the classpath is encapsulation. Every class on the classpath has access to each other, and this is an encapsulation violation. We want to hide our internal APIs, and that’s why we need another level of encapsulation \(“**Strong Encapsulation**”\) and control over the access to our classes in our packages.

Modules are going to fix these issues. What is a module? A module has a name, it groups related code, and is self-contained. A module describes explicitly what it needs from other modules and which part of it is visible to other modules. In this manner, dependencies between modules are crystal clear. We have Strong Encapsulation, which means we can hide our internal APIs, and finally, we now follow the “Fail First” principle. Therefore, when there is a missing module or a conflict, you will get an error.

![](http://img1.tuicool.com/NJjyaeb.jpg!web)

Modularizing the JDK allows JDK developers to manage the huge complexity of it. When you write a tiny and straightforward application that doesn’t use RMI, CORBA, Java EE, and other stuff, why do you need a full, huge, and heavy JRE? Isn’t it wiser to have your runtime image only contain the modules you need? Now with a modularized platform, it’s possible.

![](http://img2.tuicool.com/NremMjA.jpg!web)

This is how the JDK now looks. On the bottom, we have the “java.base” module that every other module implicitly or explicitly depends on. As you can see, this dependency graph is a[DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph), which means no circular dependencies allowed.

The picture below shows essentially what a module is. Each module has a module descriptor called “module-info.java.”

![](http://img2.tuicool.com/2iyAvmN.png!web)In the module-info.java file, you describe the name of your module, what it requires to work, and which packages are visible outside this module. For example, you can see what packages[java.sql](http://download.java.net/java/jdk9/docs/api/java.sql-summary.html)exports \(makes visible\) and which modules it requires.

![](http://img0.tuicool.com/NvUn6zb.png!web)

So in its simplest form, the module-info.java looks like the image below:

![](http://img0.tuicool.com/FfUjaqq.png!web)

In the next section, I will show how you can work with these modules and create your own modules.

## How

First of all, you need to download and install Java 9. You can find it[here](http://jdk.java.net/9/).

```
$ java -version
java version "9"
Java(TM) SE Runtime Environment (build 9+181)
Java HotSpot(TM) 64-Bit Server VM (build 9+181, mixed mode
```

Let’s build a project in IntelliJ IDEA:

![](http://img0.tuicool.com/JV3QB3E.png!web)

The picture below shows how to create a module:

![](http://img2.tuicool.com/fyiInmb.png!web)

After creating a module, you need to create a module-info.java file inside the src:

![](http://img1.tuicool.com/Ir2IFjM.png!web)

I’ve built a project that has two modules: “com.mhrimaz.gui” and “com.mhrimaz.logic.” You can see the structure of the project in the image:

![](http://img1.tuicool.com/MVjMFbF.png!web)

In the com.mhrimaz.logic module, I have two classes called “InternalGreeting” and “Greeting.”

InternalGreeting.java:

```
package com.mhrimaz.logic.internals;

public class InternalGreeting {
public static String sayHello(String name){
return "Hello. This Greeting is internal dear "+ name;
}
}
```

Greeting.java:

```
package com.mhrimaz.logic;

public class Greeting {
public static String sayHello(String name){
return "Hello, " + name;
}
}
```

The module-info.java of com.mhrimaz.logic, is the following:

```
module com.mhrimaz.logic {
exports com.mhrimaz.logic;
}
```

This means the package com.mhrimaz.logic \(it’s a package name, not a module name — don’t confuse them\) is visible outside this module, but the package com.mhrimaz.logic.internals is not visible.

The MainApplication file is a simple JavaFX program:

```
package com.mhrimaz.gui;

import com.mhrimaz.logic.Greeting;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class MainApplication extends Application {


@Override
public void start(Stage primaryStage) throws Exception {
Label label = new Label(Greeting.sayHello("Hossein"));
StackPane pane = new StackPane();
pane.getChildren().add(label);

Scene scene = new Scene(pane);
primaryStage.setScene(scene);
primaryStage.show();
}
}
```

It seems that this package doesn’t need to export anything. It only requires javafx.base and javafx.controls, and, in order to use the Greeting class, we also should require com.mhrimaz.logic. The module-info of the com.mhrimaz.gui module looks like this:

```
module com.mhrimaz.gui {
requires javafx.base;
requires javafx.controls;
requires com.mhrimaz.logic;
}
```

When we run our application, we will get an exception:

```
Caused by: java.lang.IllegalAccessException: class com.sun.javafx.application.LauncherImpl
(in module javafx.graphics) cannot access class com.mhrimaz.gui.MainApplication
(in module com.mhrimaz.gui) because module com.mhrimaz.gui does not export com.mhrimaz.gui to module javafx.graphics
```

Obviously, it tells that we need to export the com.mhrimaz.gui package. This means javafx.graphics uses MainApplication to pass the Stage to it, and you need to export your package to javafx.graphics. \(Note: You can only export a package to specific module or export it to all modules.\)

So now module-info.java looks like this:

```
module com.mhrimaz.gui {
requires javafx.base;
requires javafx.controls;
requires com.mhrimaz.logic;
exports com.mhrimaz.gui to javafx.graphics;
}
```

The result seems like a bug in a JavaFX implementation in Java 9, but this is our result:

![](http://img0.tuicool.com/uQ3EbmQ.png!web)

The story doesn’t end here, There is a whole lot of details about modules and the dependencies between them that you can read in[Java 9 Revealed](http://www.apress.com/us/book/9781484225912)or the [Java 9 Modularity](http://shop.oreilly.com/product/0636920049494.do)book.

Source: https://dzone.com/articles/java-modularity-a-personal-journey

