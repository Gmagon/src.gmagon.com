---
title: Building your SPA in ELM
---

![](https://dailydrip-assets.s3.amazonaws.com/DailyDrip/blog_posts/elm-for-js-developers-ep-1/elmJS.png)This is the sixth post in a series of posts about Elm for JavaScript developers. If you're a JavaScript developer, and you want to know more about Elm, stay tuned to this series of posts or sign up for DailyDrip and check out all the episodes we have in our room topic.

Here is what we already see:

* [General Aspects between Elm and JS](https://www.dailydrip.com/blog/general-aspects-between-elm-and-js)
* [Creating HTML elements and using libraries in Elm](https://www.dailydrip.com/blog/creating-html-elements-and-using-libraries-in-elm)
* [Understanding the Elm Architecture](https://www.dailydrip.com/blog/understanding-the-elm-architecture)
* [How to get data from APIs using Elm](https://www.dailydrip.com/blog/how-to-get-data-from-apis-using-elm)
* [What are Subscriptions and Commands in Elm](https://www.dailydrip.com/blog/what-are-subscriptions-and-commands-in-elm)

And this blog post talking about the [Power of Elm in JavaScript](https://www.dailydrip.com/blog/the-power-of-elm-in-javascript)

---

You are a JavaScript developer and you know Single-Page Apps \(SPAs\) are pretty common nowadays. How can you build one in Elm ? We will see in a few episodes how to build a SPA in Elm.

There is a really good [Elm SPA Example](https://github.com/rtfeldman/elm-spa-example), which is probably the most complete Elm SPA on the web. But I feel, this is too hard for someone who is starting in Elm.

My idea is to have a few posts walking through building an Elm SPA.

Our SPA will be called [Learn-Programming.today](https://learn-programming.today/). This is an idea we have for gathering programming tutorials, and the front-end will be written in Elm.

### Creating our project 

We will start our project with [Create Elm App](https://github.com/halfzebra/create-elm-app). If you use React, and you know Create React App, this is very similar. It produces a boilerplate Elm project to be used as a starting point. This helps us get started quickly.

I suppose you already have installed create-elm-app. It’s an npm package, so it’s easy to install.

Let’s create our project and see the file structure it creates:

```
.
├── README.md
├── elm-package.json
├── elm-stuff
│ ├── exact-dependencies.json
│ └── packages
├── public

├── src
│ ├── Main.elm
│ ├── index.js
│ └── main.css
└── tests
├── Tests.elm
└── elm-package.json

```

We will divide our project into a few modules: View, Model, Update and App. To get an overview of how the code can be structured, you can check the [Elm Firestorm Client](https://github.com/dailydrip/firestorm_elm).

Let's start with our App.

### Main 

Create Elm App gave us a`Main.elm`file. Let’s tweak that to have a View, Msg, and Model file.

As you saw, an Elm App has view, init, update and subscriptions. We will not worry about subscriptions for the moment.

```
module Main exposing (main)

import App
import View
import Update
import Model
import Navigation
import Msg exposing (Msg(UrlChange))


main : Program Never Model.Model Msg
main =
Navigation.program UrlChange
{ view = View.view
, init = App.init
, update = Update.update
, subscriptions = (\_ -> Sub.none)
}
```

### App 

Here we have our update function and we have our init function.

```
module App exposing (..)

import Model
import Msg exposing (Msg(..))
import Navigation


init : Navigation.Location -> ( Model.Model, Cmd msg )
init location =
( Model.Model [ location ]
, Cmd.none
)


update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
case msg of
UrlChange location ->
( { model | history = location :: model.history }
, Cmd.none
)

Msg.NoOp ->
( model, Cmd.none )

```

### Model 

Our model will have an attribute called`history`. It will be a list of`Navigation.Location`. We will just add in the list the elements of our history. In the future we will parse this location and show the appropriate page.

```
module Model exposing (Model)

import Navigation


type alias Model =
{ history : List Navigation.Location
}
```

### Msg 

Our Messages are actions. We have two actions:`NoOp`and`UrlChange`.`NoOp`represents nothing, any action.`UrlChange`represents the act of changing our Url. It will fire the update function and push the location into our model.

```
module Msg exposing (Msg(..))

import Navigation


type Msg
= NoOp
| UrlChange Navigation.Location
```

### View

Our view takes in our model and produces the HTML to render the page. Here we are going to show the elements inside our models.

```
module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation
import Model


view : Model.Model -> Html msg
view model =
div []
[ h1 [] [ text "Pages" ]
, ul [] (List.map viewLink [ "bears", "cats", "dogs", "elephants", "fish" ])
, h1 [] [ text "History" ]
, ul [] (List.map viewLocation model.history)
]


viewLink : String -> Html msg
viewLink name =
li [] [ a [ href ("#" ++ name) ] [ text name ] ]


viewLocation : Navigation.Location -> Html msg
viewLocation location =
li [] [ text (location.pathname ++ location.hash) ]
```

## Deploying

When you build your app, you’ll get some HTML and JavaScript output. Let’s deploy this using[now](https://zeit.co/now).

To do that, we can compile`Main.elm`and output`index.html`.

```
elm make src/Main.elm --output index.html

```

To deploy that, it just uses`now index.html`and it's done! You can do this if you're starting with Elm and would like to show to someone or just put in the internet. It's really easy!

[Here you can see the project deployed](https://output-ltgpvdfexp.now.sh/).

## Summary

Today, we saw how to have a better structure of our project and how to code with Elm using different files. In the next posts, we will keep doing this project and build our SPA.

Source: https://www.dailydrip.com/blog/building-your-spa-in-elm-part-1

