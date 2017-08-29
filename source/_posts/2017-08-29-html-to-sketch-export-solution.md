---
title: Experimental HTML to Sketch export solution
---

# html-sketchapp

_Experimental_HTML to Sketch export solution.

## What it can do?

It turns HTML nodes into Sketch layers or symbols. Additionally, it allows to export shared text styles and document colors.![](https://camo.githubusercontent.com/c79c8014f5a3f33d5720dfe9d84037c04dff492f/68747470733a2f2f692e696d6775722e636f6d2f79506a4d7746552e706e67)Why?

The motivation behind this project was ability to easily share Front-End style guide with our Design team. Although similar project,[react-sketchapp](https://github.com/airbnb/react-sketchapp), already exists it does require you to:

* use React,
* build everything using generic components \(`<View>, <Text>, <Image> )`
* and keep your styles in JS.

We were unable to quickly work around these limitations, so we created html-sketchapp.

## Why experimental?

This project is a prototype that allowed us to export most of our Front-End style guide to Sketch. The main focus was on exporting the style guide and not on providing a complete solution, therefore there are quite a few known limitations:

* not all CSS properties are supported \(TODO\)
* not all values for supported CSS properties are supported \(TODO\)
* not all types of images are supported \(webp, svg\) \(TODO\)
* resizing information is not generated \(TODO\)
* all fonts have to be locally installed \(not sure if that's fixable\)
* requires MacOS \(Sketch's limitation\)

The good news is that most of the missing functionality should be fairly easy to add - feel free to contribute to or fork this project.

## How does it work?

Ideally, this project should be an, OS independent, NodeJS library that allows to crate valid Sketch files. Unfortunately, it's not possible at this point due to Sketch format limitations.

Current solution consists of two parts. First one \(`html2asketch`\) runs in a browser \(either regular or headless\) and creates an_almost_valid Sketch file \(`page.asketch.json`and`document.asketch.json`\). Second one \(`asketch2sketch`\) is a Sketch plugin that takes`asketch.json`files and imports them into Sketch.

Why two parts?`html2asketch`and`asketch2sketch`are built in different technologies and run in different environments.`html2asketch`is written in JavaScript and runs in a browser where it can easily extract all information from DOM nodes: their position, size, styles and children. Extracted information are then translated into Sketch's`document.json`and`page.json`files. Unfortunately, ATM Sketch file format is not fully readable and some parts can't be easily generated from JavaScript \(most notably text styling information which is saved as a binary blob\). Additionally, script running in the browser is limited by CORS and may not be able to download all of the images used on page. That's where we need`asketch2sketch`which is a Sketch plugin written in[cocoascript](http://developer.sketchapp.com/introduction/cocoascript/)\(JavaScript + Objective-C\). It "fixes"`.asketch.json`files \(changes text styling information format, downloads and inlines images\) and loads them into the Sketch app.

## How do I run it?

`html2asketch`is a library that you can use to create a script that extracts specific parts of the website and saves them as layers, shared text styles, document colors and symbols. There is no one right way of using`html2asketch`, but you can start by checking out the two examples that we provide:

* [html-sketchapp-example](https://github.com/brainly/html-sketchapp-example)
  - minimal script that takes an URL and produces a
  `page.asketch.json`
  file
* [html-sketchapp-style-guide](https://github.com/brainly/html-sketchapp-style-guide)
  - script that takes parts of the Brainly style-guide and exports them as Sketch symbols, shared text styles and document colors. This script produces
  `document.asketch.json`
  and
  `page.asketch.json`
  .

All`.asketch.json`files should be loaded to Sketch via the`asketch2sketch.sketchplugin`plugin provided in this repository.

![](https://camo.githubusercontent.com/2a9b5eeb3ccadd946d6815c60bd8676fd7e0a18c/68747470733a2f2f692e696d6775722e636f6d2f3965446d364e512e706e67)If you prefer to build the plugin from sources:

```
npm i # install dependencies
npm run render # build the plugin

```

## Thanks!

This project uses bits and pieces from the fantastic [react-sketchapp](https://github.com/airbnb/react-sketchapp) and wouldn't be possible without [skpm](https://github.com/skpm/skpm) and information from [Sketch-Headers](https://github.com/abynim/Sketch-Headers).

Source: https://github.com/brainly/html-sketchapp

