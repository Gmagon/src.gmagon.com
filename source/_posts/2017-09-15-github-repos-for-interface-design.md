-
--
title: GitHub Repos for Interface Design
---

GitHub is a great place to find projects that are freely distributed to the public, but have you ever starred a repo only to forget how cool and useful it could be? In this roundup I’ll bring to light some fantastic projects freely available on GItHub that have a strong focus on helping interface designers build for the web.

## 1.[Byte Size Icons](https://github.com/danklammer/bytesize-icons)

Byte Size Icons are tiny style-controlled SVG icon sets. A resource like this can be super helpful if you don’t have a particular set of icons designed from scratch to fit the needs of your context. 

![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/bytesize-icons.png)

> “Each icon is hand-coded along a 32x32 grid, and uses SVG stroke allowing for maximum style flexibility; meaning you can adjust the weight, color, size, and if you want the edges to be round or square.”

All 92 icons weigh in at 10.5kb minified or 2.9kb in`.svgz`. Either drop each icon inline directly in your page as needed or load them up via an external SVG file and the `use`tag. You can then easily change the weight of the icon by changing the `stroke-width` attribute as well as changing the shape of the line caps and the line joins with `stroke-linecap` and `stroke-linejoin`. This will change the style of the icons by making them rounded or squared off. All these stroke properties are also available to use in CSS should you choose to.

## 2.[Shade](http://jxnblk.com/shade)

Shade is a mathematically derived gradient explorer that gives you sliders to control the desired results. ![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/shade.png)

You can adjust hue, saturation, lightness, along with each corresponding option for the gradient spread. The one downside I see currently is not having the option to control the gradient angle, but obtaining the output in a visual sense along with the proper CSS is really great. A worthy tool for those using gradients more and more in their design work.

## 3.[Material Components](https://github.com/material-components/material-components-web)

Materialize is a front-end framework based on Google's Material Design. It claims to be user focused, easy to use and help speed up development when designing and determining interface components. ![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/material-components.png)

Choose from a variety of components, JavaScript controlled widgets and so much more. For those that use Sass you’ll be happy to hear you can change the color scheme of your elements extremely quick with an easy to use and read [variables file](https://github.com/Dogfalo/materialize/blob/master/sass/components/_variables.scss).

## 4.[SVG Pattern Fills](https://github.com/iros/patternfills)

Patterns on the web can be applied in multiple ways, either with imagery or CSS, but pattern effects can also be achieved using SVG that will remain sharp on any screen resolution and compact in file size. 

![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/pattern-fills.png)

These patterns can be used in three ways using SVG patterns defs, CSS background image urls and using pattern fills via D3.js. Colors can be customizable for each pattern and you can even submit new patterns for inclusion to the repo. This can be very handy for any pattern you might need for your interface design that begs to be repeated while maintaining crispness and keeping file size under control.

## 5.[Starability](https://github.com/LunarLogic/starability)

Here’s a really handy project for those working with interfaces; it allows users to rate products or favorite items. 


![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/starability.png)

Each rating option is accessible for everyone, including keyboard control, and come with a touch of animations baked in. Currently the project contains eight different rating options to choose from, but of course you can always submit a new idea/pattern to be included amongst the currently provided patterns.

If you’re well-versed with Sass, you can adjust the rating widget to your needs, for example having a 10-star based system or turning off the outline and hover. This can be done by setting true/false values to the variables in the [\_variables.scss file](https://github.com/LunarLogic/starability/blob/master/starability-scss/_variables.scss) and running the Gulp task to process the files.

## 6.[Lists](https://github.com/listsfordesign/Lists)

Gathering real content for designs is becoming increasingly important for understanding how users interact with your components. 


![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/lists.png)

Lists is a gallery of actual content ready to populate your mockups. Export lists into JSON files and import into a Google spreadsheet, copy content to your clipboard and choose from 16 categories ranging from entertainment to education. Lists let you design with real content to make smarter decisions and work faster.

## 7.[Sketch Clipboard Fill](https://github.com/scottsavarie/clipboard-fill)

This is a Sketch plugin to paste whatever image is on your clipboard as the fill for any shape! 


![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/clipboard-fill.jpg)

It’s extremely convenient if you’re creating comps and don’t want to waste time finding images and importing them into your project; especially when you want to place imagery into different shapes. Super fast, super simple and super fantastic to speed up workflow.


## 8.[Sketch Material](https://github.com/websiddu/sketch-material)

Sketch material is a Sketch plugin that will help you generate complex Material components like tables, chips, forms, buttons, tooltips and more. 


![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/sketch-material.png)

If you’re creating mockups this can greatly improve efficiency and speed in your workflow. One of my favorite parts is the elevation aspect that grants you quick access to Material Design’s delicious drop shadows. Sketch Material focuses on the hard work so you can focus on the important things like design, design, design.


Advertisement

## 9.[Sketch Sheets](https://github.com/rnarrkus/sketchsheets)

Ready to print device sketch sheets. All files contain a blank and dotted grid template in .png and .pdf format and include a wide array of devices. 


![](https://cms-assets.tutsplus.com/uploads/users/638/posts/29353/image/sketch-sheets.png)

These sheets can not only be printed but can be used in your digital software of choice for creating quick mockups. Since the project is freely available and hosted on GitHub you can always suggest a new device to be included should you not find the one you’re in need of.

## Closing Thoughts

I’ve only skimmed the surface with the projects mentioned here and would love to hear about others that you find useful in your day to day work regarding UI design. Leave your comments and suggestions below and happy coding!

Source: https://webdesign.tutsplus.com/articles/9-recommended-github-repos-for-interface-design--cms-29353









