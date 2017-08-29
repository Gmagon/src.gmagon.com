---
title: How do you feel learning JavaScript in 2017?
---

_\(For those who haven’t read it, this is a response to _[_How it feels to learn JavaScript in 2016_](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f)_. Unlike other responses it includes complete code for an app like the one asked about.\)  
_![](https://www.howtolearn.world/wp-content/uploads/2017/07/Javascript.png)

Hey, I got this new web project, but to be honest I haven’t coded much web in a few years and from what I’ve been reading it looks like the landscape changed a lot. You are the most up-to-date web dev around here, right?

_-I guess you could say that._

Cool. I need to create a page that displays the latest activity from the users, so I just need to get the data from the REST endpoint and display it in some sort of filterable table, and update it if anything changes in the server. I was thinking maybe using jQuery to fetch and display the data? I know there are newer frameworks out there, but the more I read about them the more confused I get.

_-Wasn’t jQuery the reason you quit web dev a few years ago?_

Yeah, well I think I was doing it wrong. I couldn’t figure out why my app kept getting into weird states. Maybe you can teach me to organize my jQuery code better so I don’t get myself into so much trouble.

_-It happens to the best of us. With jQuery you change the DOM in response to various events, and sometimes the sequence of events is different from what you expect. How you got to a particular state definitely can be confusing._

You aren’t convincing me I should get back into web dev.

_-Wait; hear me out. With modern web frameworks you simply write how the state of your data maps to the state of your web page. It’s way less confusing._

OK let me think about that…wouldn’t that mean it redraws the page every time your data changes? I guess that could work. My users are all on desktop so it won’t be a big deal. It sounds like it would be really slow on mobile browsers, though.

_-It doesn’t redraw the page every time. Modern frameworks are smart enough to figure out what part of the DOM needs to change and only touch that part._

Interesting. Which one should I use? The big ones are React, Angular and Ember, right?

_-They’re all good. If you want to write your front-end logic in Handlebars use Ember. If you want to write your front-end logic with HTML attributes use Angular or Vue. If you want to write your front-end logic with JavaScript use React, Mithril or Inferno._

JavaScript, I guess. But doesn’t React use this other thing…JSX?

_-JSX is just a JavaScript syntax extension. It lets you use HTML tags where you might otherwise write code that generates DOM elements._

What’s wrong with just using JavaScript?

_-Nothing’s necessarily wrong. Actually Mithril’s documentation is all straight JavaScript. I’ve just found I get better feedback from people who do HTML/CSS all the time when I show them JSX code than I do when I show them straight JavaScript._

All straight JavaScript? I’m glad to hear I’m not the only one who isn’t entirely comfortable with JSX. You just made me want to try Mithril. Is it popular?

_-It’s popular enough that it’s not going away, but nowhere near as popular as the bigger frameworks. I’ve actually been writing a pretty ambitious web app in Ember lately. But come to think of it, Ember hides certain things I’d like you to explicitly see when you’re getting up to speed, so I’d be happy to show you how you’d implement your app using Mithril._

Great! Can we set up a few hours soon when you can show me how to set up all the libraries, scaffolding and boilerplate code? Which is better these days, webpack or browserify? I have to confess, the build setup is the most intimidating part of modern web development for me.

_-We can skip all that for now. Once you get a feel for the main part of modern web dev you can just copy a build setup I made with nothing more than babel and rollup. The build system is really only a small part of developing a modern web app._

Skip all that? But I want to see my web app actually work.

_-You will; I’ll show you. Let’s code up your app using Mithril now. You said it was a filterable table, right? Let’s make _[_planets.html_](https://github.com/brlewis/brlewis.github.io/blob/master/2017/planets.html) _a filterable table of planets._

```
<!DOCTYPE html>
<html>
  <body>
    <div id="app">Loading...</div>
    <script src="https://unpkg.com/mithril/mithril.js"></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <script type="text/jsx" src="planets.jsx"></script>
  </body>
</html>
```

OK, you told me what Mithril is. Another library? What’s Babel?

_-Babel lets you to use modern JavaScript syntax that browsers don’t support it yet. You don’t absolutely need it, but it lets you forget what browsers do and don’t support and just code._

Oh wait, actually I think I read about that. Isn’t it bad to run a transpiler in your browser?

_-Yes. It adds significant latency. But for learning, why not? It will be easy to change later. For now, let’s start writing your _[_planets.jsx_](https://github.com/brlewis/brlewis.github.io/blob/master/2017/planets.jsx) _file by setting up the state of your app._

```
<!DOCTYPE html>
```

```
class PlanetTable {
  view() {
    return (
      <table>
        <tr>
          <th>Name</th>
          <th>Composition</th>
          <th>Moons</th>
        </tr>
            {planets.filter(planetFilter).map(planet => <PlanetRow planet={planet} />)}
      </table>
    );
  }
}
```

_-Mostly it’s just static content, but on that one line you have a concise description of what your app does. It takes an array of planets, filters them to just the ones that should be shown, and that filtered array is mapped to HTML table rows._

Oh, I think I’m getting it now! That JSX syntax is just a JavaScript expression, so I can manipulate it however I want. I’m guessing the PlanetRow component is going to be really simple?

_-Yes, possibly simpler than you think thanks to destructuring assignment._

```
class PlanetTable {
```

```
class PlanetRow {
  view(vnode) {
    const { composition, name, moons } = vnode.attrs.planet;
    return (
      <tr>
        <td>{name}</td>
        <td>{composition}</td>
        <td>{moons}</td>
      </tr>
    );
  }
}

```

OK, so I guess vnode.attrs.planet is how you get that planet attribute that was passed in. There’s only one line with an equals sign so that must be…oh wow, destructuring assignment, where have you been all my life?

_-I’m telling you, JavaScript is way more fun than it used to be. Here, let me show you how nice arrow functions are, even when you’re only considering their conciseness._

```
class PlanetFilters {
  view(vnode) {
    return (
      <p>
        <PlanetFilter
            key="All"
            func={planet => true} />
        <PlanetFilter
            key="Terrestrial"
            func={planet => planet.composition === 'terrestrial'} />
        <PlanetFilter
            key="Gas Giant"
            func={planet => planet.composition === 'gas giant'} />
        <PlanetFilter
            key="Ice Giant"
            func={planet => planet.composition === 'ice giant'} />
      </p>
    );
  }
}
```

OK, I see where you’re going with this. Those are filter functions. But I bet the event handlers you have to wrap around them can’t be that concise.

_-They can with a little abstraction._

```
class PlanetFilters {
```

```
class PlanetFilter {
  view(vnode) {
    const { key, func } = vnode.attrs;
    return (
      <label>
        <input type="radio" name="filter" 
               onchange={filterHandler(func)} /> {key}
      </label>
    );
  }
}
function filterHandler(filterFunction) {
  return function(event) {
    if (event.target.checked) {
      planetFilter = filterFunction;
    }
  };
}
```

_-But you have a meeting to go to and you wanted to see this working. Here, let me toss some data into a separate _[_planets.json_](https://github.com/brlewis/brlewis.github.io/blob/master/2017/planets.json)

_file since you mentioned you needed to fetch data from the server. And now we just need code to fetch the data, put the data where your app can get it, and then mount the top-level component. _[_Voila, it works_](https://brlewis.github.io/2017/planets.html). 

```
m.request({url: 'planets.json'}).then(data => {
  planets = data;
  m.mount(document.getElementById('app'), PlanetApp);
});
```

Really, that’s it? Wow, last year this all seemed so intimidating! I have to run now, but I’m definitely looking forward to picking JavaScript up again. Thanks a bunch!

_-Sure thing. I love talking about it. Any time._

---

Thanks to Biagio Azzarelli, Ben Chauvette, Garrick Cheung and Patrik Johnson for their feedback on drafts of this.

Source: https://medium.com/front-end-hacking/how-it-feels-to-learn-javascript-in-2017-a934b801fbe

