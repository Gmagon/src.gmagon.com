---
title: Using Horizon/RethinkDB with React
---

Horizon is an open source[Backend as a Service](https://en.wikipedia.org/wiki/Mobile_backend_as_a_service)\(BaaS\) that allows developers to easily build data-driven web and mobile applications. Horizon,[which is built on RethinkDB](http://horizon.io/faq/)and by the RethinkDB team, facilitates common application development tasks like backend setup, real-time data transfer, security and scalability. Horizon can be run locally, on a private server or in the cloud.

This tutorial will give you an introduction to Horizon and RethinkDB while also showing you how to build a simple app with Horizon and React. This will give you a simple and scalable architecture for building your own much more complex apps.

#### A Quick Note About the State of Horizon/RethinkDB

On October 5th 2016, the company behind RethinkDB[announced it would be shut down](https://rethinkdb.com/blog/rethinkdb-shutdown/). This left many users believing the entire project was being cancelled and shuttered. In actuality, RethinkDb and Horizon became fully open source and community driven. On February 6th 2017, the[Cloud Native Computing Foundation](https://www.cncf.io/)\(CNCF\) purchased the rights to the RethinkDB source code and[contributed it to the Linux Foundation](https://rethinkdb.com/blog/rethinkdb-joins-linux-foundation/). This gave the project the necessary support to keep the project alive and facilitate its continuous development.

#### Horizon + React = Awesome Combo

Horizon and React is a pair made in heaven for developers. Horizon takes charge of all the backend complexities and React facilitates building a modular, reactive frontend. Horizon handles the distribution of data in real-time while React keeps the clients updated. Everything scales and everything has high performance and low latency.

When there is a change in the app’s state, ReactJS will efficiently redraw the necessary components by diffing between the virtual DOM and the existing DOM \(and making only the required changes\). Horizon notifies all subscribed clients when there is a data update, so they can either download the data again or simply apply the change into its local copy when the original data is too large to fully reload on each change. Together, Horizon and React allow for a simple way to build real-time data-driven applications.

#### Building a ‘ToBring’ App

To demonstrate how they work together, we’ll build a ‘ToBring’ app \(not another another ToDo!\). This application will track a list of items we need for a party. This app will allow users to add items in a section that we will call_“We need list”_or move them to another list called_“We have list”_and add the name of the user who will bring the item.

To see all the code for this demo,[check out this repo](https://github.com/reicek/react-horizon-intro).

![](http://img0.tuicool.com/Y73URju.png!web)

To keep the setup simple, we’ll use[create-react-app](https://github.com/facebookincubator/create-react-app). To start the React part of the application, first install create-react-app with the command

`npm install -g create-react-app`

Then you’ll need to initialize a new app with the commands

_`create-react-appparty_checklist`_

and

_`an npm install/start`_

Once ready, it should launch on your browser with the address[**http://localhost:3000/**](http://localhost:3000/)and will auto-reload every time you change the source code.

React is all about components. The main component of our app will have three sub-components: one to add a new item, one to hold the “we need list” and another to hold the “we have list”. Here’s a quick visual of how these components will fit together.

![](http://img0.tuicool.com/naQRvaJ.png!web)

We will need to know the user’s name for keeping track of what they bring. Let’s put a simple input to get the name of the active user into the main component.

If you are wondering, Horizon does include[options to authenticate](http://horizon.io/docs/auth/), add permissions and even Transport Layer Security to our app, but that is beyond the scope of this tutorial.

Here’s how we’ll code up the name input:

app.js

```
import
React
, { 
Component
 } from 
'reac
t';
 

class
App
extends
Component
{
  constructor(props) {
    
super
(props);
    
this
.state = {
      
// A holder for the user name

      user : '',
    };
    
// A binding to call updateUser without the () suffix
this
.updateUser = 
this
.updateUser.bind(
this
);
  }
 
  render() {
    
return
 (
      
<
div
        className= 
'ap
p'
>
<
h1
>
Party
Checklist
<
/h1
>
<
p
>
I
 am:
<
/p
>
<
input
          value = {
this
.state.user}
          onChange = {
this
.updateUser} /
>
<
/div
>

    );
  }
 
  
// A method to update the state in response to a synthetic event

  updateUser(e) {
    
this
.setState({user: e.target.value});
  }
}

```

It is important to remember how we use the constructor to hold the state and also to create bindings to expose methods, without it “_this_” will return “_undefined_” when the method is actually called. This is how[React handles events](https://facebook.github.io/react/docs/handling-events.html), also notice how “updateUser” has a parameter called “e”, this is called a[synthetic event](https://facebook.github.io/react/docs/events.html).

Now let’s add the**NewItem**component:

app.js

```
class
App
extends
Component
{
  constructor(props) {
    
super
(props);
    
this
.state = {
      user : '',
    };
    
this
.updateUser = 
this
.updateUser.bind(
this
);
  }
 
  render() {
    
return
 (
      
<
div
        className= 
'ap
p'
>
<
h1
>
Party
Checklist
<
/h1
>
<
p
>
I
 am:
<
/p
>
<
input
          value = {
this
.state.user}
          onChange = {
this
.updateUser} /
>
<
NewItem
 /
>
<
/div
>

    );
  }
 
  updateUser(e) {
    
this
.setState({user: e.target.value});
  }
}
 

class
NewItem
extends
React
.
Component
{
  constructor(props) {
    
super
(props);
    
this
.state = {
      item  : '',
    };
    
this
.updateItem = 
this
.updateItem.bind(
this
);
  }
  render() {
    
return
 (
      
<
div
>
<
p
>
Add
 to need list:
<
/p
>
<
form
>
<
input
            value = {
this
.state.item}
            onChange = {
this
.updateItem} /
>
<
/form
>
<
/div
>

    );
  }
 
  updateItem(e) {
    
this
.setState({item: e.target.value});
  }
}

```

JSX allows you import the “NewItem” component into “App” similar to[custom web components](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Custom_Elements)on HTML.

Now let’s make a component for the**WeNeedList**, notice how it was an “items” list in its properties, this means the value will be passed when it is declared inside another component. When dealing with lists in React, you can use a simple[map method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map).

app.js

```
class
WeNeedList
extends
React
.
Component
{
  render() {
    
return
 (
      
<
div
>
<
h2
>
We need...
<
/
h2
>

        {this.props.items.map(item =
>
 (
          
<
div
className
= 
'row'
>
<
button
className
= 
'remove'
>

              x
            
<
/
button
>

            {item.description}
            
<
button
className
= 
'add'
>

              +
            
<
/
button
>
<
/
div
>

        ))}
      
<
/
div
>

    );
  }
}

```

Now lets add “WeNeedList” to “App”.

app.js

```
class
App
extends
Component
{
  
constructor
(props) {
    
super
(props);
    
this
.state = {
      weNeedList : [],
      user : 
''
,
    };
    
this
.updateUser = 
this
.updateUser.bind(
this
);
  }
 
  render() {
    
return
 (
      
<
div
        className= 
'app'
>
<
h1
>
Party Checklist
<
/h1
>
<
p
>
I am:
<
/p
>
<
input
          value = {
this
.state.user}
          onChange = {
this
.updateUser} /
>
<
NewItem /
>
<
WeNeedList
          items = {
this
.state.weNeedList}
          user = {
this
.state.user} /
>
<
/div
>

    );
  }
 
  updateUser(e) {
    
this
.setState({user: e.target.value});
  }
}

```

See how “App”will hold the[**state**](https://facebook.github.io/react-native/docs/state.html)of the list and will pass it to “WeNeedList” as parameters. Inside “WeNeedList” we can read this values from[**props**](https://facebook.github.io/react-native/docs/props.html).

And finally we need to make a**WeHaveList**component:

app.js

```
class
WeHaveList
extends
React
.
Component
{
  render() {
    
return
 (
      
<
div
>
<
h2
>
We
 have...
<
/h2
>

        {
this
.props.items.map(item =
>
 (
          
<
div
            className= 
'ro
w'
            key = {item.id}
>
<
button
              className= 
'cance
l'
>

              x
            
<
/button
>

            {item.description} from {item.user}
          
<
/div
>

        ))}
      
<
/div
>

    );
  }
}

```

And also add it to the “App” component:

app.js

```
class
App
extends
Component
{
  
constructor
(props) {
    
super
(props);
    
this
.state = {
      weNeedList : [],
      weHaveList : [],
      user : 
''
,
    };
    
this
.updateUser = 
this
.updateUser.bind(
this
);
  }
 
  render() {
    
return
 (
      
<
div
        className= 
'app'
>
<
h1
>
Party Checklist
<
/h1
>
<
p
>
I am:
<
/p
>
<
input
          value = {
this
.state.user}
          onChange = {
this
.updateUser} /
>
<
NewItem /
>
<
WeNeedList
          items = {
this
.state.weNeedList}
          user = {
this
.state.user} /
>
<
WeHaveList
          items = {
this
.state.weHaveList} /
>
<
/div
>

    );
  }
 
  updateUser(e) {
    
this
.setState({user: e.target.value});
  }
}

```

![](http://img2.tuicool.com/6jmA7rF.png!web)

Now the core of our app is complete! But it doesn’t do anything yet, for that, we need to add Horizon and create a few methods inside our components.

To install Horizon in your machine, simply run the command**npm install -g horizon**.

Horizon, like create-react-app, automatically initializes everything. You only need to provide the name of the app you want to create with the command**hz init**_**party\_checklist**_; it is important that you run this from the same place from where you created the app, so it will just add new files to the project instead of creating a new one. You must always start with React and then add Horizon.

Horizon needs RethinkDB to work. Before launching your Horizon server, make sure you have RethinkDB running on your machine. Refer to the[official documentation](https://www.rethinkdb.com/install)for detailed instructions on how to run it on your system. The simplest way for Mac users is to[use Homebrew to install it](https://www.rethinkdb.com/docs/install/osx/).

Now let’s configure Horizon to look for RethinkDB in your local machine. To do so, go to_**.hz =&gt; config.toml**_and replace it with the following:

```
bind
 = [ 
"localhost"
 ]

port
 = 
8181
connect
 = 
"localhost:28015"
start_rethinkdb
 = 
false
```

To launch your Horizon server locally, go the folder with your project and run**hz serve –dev**, this will start your local Horizon server on**port 8181**. Note that you always need to keep one instance running React and another running Horizon while you are developing.

Before hitting the code, let’s learn a few basic Horizon concepts:

Horizon groups data into[horizon collections](http://horizon.io/api/collection/)and each collection is backed by a RethinkDB table. All documents inside a collection are identified by a**unique key**stored in the**id**field.

Horizon provides a very simple yet powerful API that helps you handle the following aspects:

* [DB conn](http://horizon.io/api/horizon/#connect)
  [ection](http://horizon.io/api/horizon/#connect)
* [Data collections](http://horizon.io/api/collection)
* [Authentication](http://horizon.io/docs/auth/)
* [Users and groups](http://horizon.io/docs/users/)
* [Permissions](http://horizon.io/docs/permissions/)

In this tutorial, we will be focusing on the first two, DB connection and data collections.

ReactJS is designed to use an unidirectional data flow, so the data always flow from the DB into the parts of the UI that represents it. You can stream data right into its specific component or stream many into the parent and then your pass it down via component props.

Here’s a visual to help you make sense of the data flow in this app:

![](http://img2.tuicool.com/iqeUf2Z.png!web)

Note that any change in the data is sent from**one**React client into Horizon and Horizon sends it back to**all**React apps so they can update their view, this flow makes sure that all clients are always watching the same without inconsistencies. Also note that the data always flows in one direction between Horizon and React.

Let’s add the[Horizon client library](https://www.npmjs.com/package/@horizon/client)into our app. First run**npm install @horizon/client**to get the horizon client installed locally and make an instance of the client holding a connection to our local server in app.js.

app.js

```
import
 Horizon 
from
'@horizon/client'
;

const
 horizon = 
new
 Horizon({
host
: 
'localhost:8181'
});

```

Now let’s configure React to open a connection with the Horizon server right after everything has loaded correctly using the**componentDidMount\(\)**lifecycle method. We will include some watchers to log when the connection to Horizon is ready and when it gets disconnected.

app.js

```
class
App
extends
Component
{
 
  
// ...

 
  componentDidMount(){
    horizon.connect();
 
    horizon
      .onReady()
        .subscribe(() =
>

          console.info(
'Connected
 to 
Horizon
 server'));
 
    horizon
      .onDisconnected()
        .subscribe(() =
>

          console.info(
'Disconnected
 from 
Horizon
 server'));
  }
}

```

Remember how we talked about collections in Horizon? Our app will use two Horizon collections, one for the “we need list” and other for the “we have list”. Let’s store a reference to them at the top of app.js.

app.js

```
import
 Horizon 
from
'@horizon/client'
;
 

const
 horizon = 
new
 Horizon({
host
: 
'localhost:8181'
});

const
 weNeedList_collection = horizon(
'weNeedList'
);

const
 weHaveList_collection = horizon(
'weHaveList'
);

```

Horizon makes it very easy to watch and apply for changes in real time, you can even add custom logic and subscribe to a feed of changes. A common practice is to use the timestamp of each object as its ID and request the collection sorted by the ID, so they will always come in chronological order. Let’s do that for both collections.

app.js

```
class
App
extends
Component
{
 
  
// ...

 
  componentDidMount(){
    horizon.connect();
 
    
// ...

 
    weNeedList_collection
      .order(
'i
d')
        .watch()
          .subscribe(allItems =
>
this
.setState({weNeedList: allItems}),
            error =
>
 console.error(error));
 
    weHaveList_collection
      .order(
'i
d')
        .watch()
          .subscribe(allItems =
>
this
.setState({weHaveList: allItems}),
            error =
>
 console.error(error));
  }

```

Now it’s time to add data manipulation methods, for this app we will use insert and remove; in both cases we only need to pass the item we wish to insert or remove as the parameter.

Let’s start by updating NewItem

app.js

```
class
NewItem
extends
React
.
Component
{
  
constructor
(props) {
    
super
(props);
    
this
.state = {
      item  : 
''
,
    };
    
this
.updateItem = 
this
.updateItem.bind(
this
);
    
this
.insertItem = 
this
.insertItem.bind(
this
);
  }
  render() {
    
return
 (
      
<
div
>
<
p
>
Add to need list:
<
/p
>
<
form
          onSubmit = {
this
.insertItem}
>
<
input
            value = {
this
.state.item}
            onChange = {
this
.updateItem} /
>
<
/form
>
<
/div
>

    );
  }
 
  updateItem(e) {
    
this
.setState({item: e.target.value});
  }
 
  insertItem(e) {
    e.preventDefault();
    const newItem = {
      description: 
this
.state.item,
      id: Date.now()
    };
 
    weNeedList_collection.insert(newItem);
    
this
.setState({item: 
''
});
  }
}

```

Now let’s do the same for WeNeedList.

app.js

```
class
WeNeedList
extends
React
.
Component
{
  render() {
    
return
 (
      
<
div
>
<
h2
>
We need...
<
/
h2
>

        {this.props.items.map(item =
>
 (
          
<
div
className
= 
'row'
>
<
button
className
= 
'remove'
onClick
= 
{()
 =
>
 this.remove(item)}
>

              x
            
<
/
button
>

            {item.description}
            
<
button
className
= 
'add'
onClick
= 
{()
 =
>
 this.moveToHave(item)}
>

              +
            
<
/
button
>
<
/
div
>

        ))}
      
<
/
div
>

    );
  }
 
  remove(item) {
    weNeedList_collection.remove(item);
  }
 
  moveToHave(item) {
    weNeedList_collection.remove(item);
    item.user = 
this
.props.user;
    weHaveList_collection.insert(item);
  }
}

```

And finally for WeHaveList.

app.js

```
class
WeHaveList
extends
React
.
Component
{
  render() {
    
return
 (
      
<
div
>
<
h2
>
We
 have...
<
/h2
>

        {
this
.props.items.map(item =
>
 (
          
<
div
            className= 
'ro
w'
            key = {item.id}
>
<
button
              className= 
'cance
l'
              onClick= {() =
>
this
.returnToNeed(item)}
>

              x
            
<
/button
>

            {item.description} from {item.user}
          
<
/div
>

        ))}
      
<
/div
>

    );
  }
 
  returnToNeed(item) {
    weHaveList_collection.remove(item);
    weNeedList_collection.insert(item);
  }
}

```

And we are finished! Now you know all the basics to start building amazing real time apps using ReactJS and Horizon.

The Horizon-React combo greatly simplifies development, allowing you and your team to develop applications and prototypes in a very short time while also making it easy to scale, maintain and debug those apps in the future, this greatly reduces costs and makes you and your team more competitive in the global market.



Source: [https://appendto.com/2017/08/using-horizonrethinkdb-react/](http://www.tuicool.com/articles/hit/UJ7JjiQ)

