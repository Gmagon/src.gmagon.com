---
title: The Most Efficient Way to Use Icons If You're A Designer or Developer.
---

![](http://img1.tuicool.com/bmea222.png!web)

#### Sketch Tutorials

## The Most Efficient Way to Use Icons If You’re A Designer or Developer.

## Not just how to do it, but WHY it’s better than any other way.

**Confession:**This article is intentionally polarizing so that someone will write an angry comment and give me a more efficient solution.

Maybe it’s manipulation. I call it[The Predictability of the Internet](https://en.wikipedia.org/wiki/Ward_Cunningham#Cunningham.27s_Law)_:wink:_

#### Icons are a huge pain in my ass:

* They have to look homogenous \(similar visual style\)
* They have to have bounding boxes
* They have to work when they’re
  **really big**
  and
  _really small_
* They have to be easy to design with
* They have to be easy to code with
* They have to be performant \(side note:Peter Nowell isthe
  [king](https://medium.com/sketch-app-sources/how-designers-should-think-about-svg-b2b92efc4d77)
  [of](https://medium.com/@pnowelldesign/stuff-at-the-top-of-an-svg-f3ad198eb54e)
  [SVGs](https://medium.com/sketch-app-sources/svgito-little-optimizations-for-svgs-22114af9fdc9)
  \)
* They have to not piss off your design team
* They have to not piss off your development team

#### Okay, so what about icon fonts?

Icon fonts like FontAwesome came out as a way to soften the agony of working with icons, but they still aren’t perfect.**Designing**with them is just…_okay_; you still have to go look up the glyph, copy it, and paste it into the text layer. You can’t really symbolize them, and if you do, changing their color requires some text symbol trickery.**Developing**with icon fonts is simple, but not without issues. If the browser fails to load the icon font, then you’re up shit creek without a paddle. And you’re alone. In a kayak._Sad._

![](http://img0.tuicool.com/V7nami.png!web)

Well…now what?

#### So…use SVGs then?

Well for**designers**, SVGs are certainly easier to symbolize in Sketch, but it can be kind of a pain to change their color._So just don’t make them symbols, right? Then you can use layer styles to make them different colors!_But what if you want to update the little dropdown arrow from a caret to a triangle? Well good luck finding all 398 occurrences of that little arrow and updating them one-by-one. So that’s…well,_not great_. And I know from experience that**developers**love nothing more than using standalone SVGs for each and every icon in my design. Don’t worry guys, there are only 207 unique icons. That shouldn’t affect page load. I promise. /s

#### Ugh, then what?!

Keep reading, knucklehead �� And before we dive in, here’s something free. This will help you follow along with the rest of the tutorial.

### My Workflow

My approach is divided into two parts:**What I Do for Design**and**What I Do for Development**. Neither technique is completely perfect, but it’s been successful so far, and makes the most people happy along the way.

That’s important!

### What I Do For Designers

I**absolutely love**the Nucleo icon set. There are 8,300+ icons available in all kinds of different styles \(outlined, solid, mini, full color, two-toned\), and they’ve even included those pesky social icons that you need on pretty much every project. You can grab those below \($49 for a year, $129 for life\).

[Nucleo - 8000+ Vector icons for iOS, Android and web_Nucleo is a library of 8000+ vector icons, in different styles and formats, as well as a web application to manage…_nucleoapp.com](https://nucleoapp.com/?ref=cmbeck82)

The absolute fastest and most sustainable way to use icons in Sketch is by using**color symbols and masks**. You’ve seen this technique before thanks to my palFrancesco, but here’s a quick refresher:

[Sketch: Tint icons using nested symbols - Design&Prototype - Medium_I always wanted to create a single version of an icon and apply different colors to, or tint it, to indicate its state…_freeandwilling.com](https://freeandwilling.com/fbmore?go=Sketch-Tint-Icons-Using-Nested-Symbols-UX-PowerTools)

Step 1:Make symbols for the fill colors you want to use for your icons. Make sure every color symbol artboard is the same size.

![](http://img2.tuicool.com/yMfyi2v.png!web)

Step 2:Make a new artboard for your icon symbol. Paste your icon onto your new artboard. If you’re using the[Nucleo Icon](https://freeandwilling.com/Jon?go=icon-article-nucleo)desktop app, just drag the icon directly into Sketch, then put it on your new artboard.

![](http://img1.tuicool.com/rYzeMjy.gif)

Step 3:Make sure your icon is a single shape, and set it as a mask. If your icon isn’t a single shape, then select the different paths and union them.

![](http://img0.tuicool.com/AbmUZ3f.png!web)

Step 4:Insert any of the color symbols on top of your icon mask and resize it to the size of your artboard. You’ll be able to override this color whenever you add an instance of your icon!

![](http://img2.tuicool.com/qERrQzN.png!web)

Step 5 \(Optional\):If your icon is a logo \(see above\), set the mask fill to the brand color of the app. It’s easy to quickly find official brand colors over on[brandcolors.net](https://brandcolors.net/). This saves you from having to create color symbols for a bunch of different app colors — if you ever want to use the brand color, just turn OFF the color symbol override:

![](http://img1.tuicool.com/mEf22ai.gif)

**Warning:**

If you have color symbols with semi-transparent fills, you’ll be able to see the mask fill through the transparency. So if you want 25% black to be an available color, don’t use a fill on the mask.

#### Why This Works for Designers

* All of my icons are symbols, so if I ever want to update them, I can do it in one place and immediately see it update across all of my designs.
* I can quickly override the color from the inspector.
* If I update a color symbol, it will update all icons that use that color.
* I can nest icons inside of other symbols and quickly swap them out.

#### Why This Doesn’t Work for Developers

* Zeplin and InVision don’t read color overrides, so they’ll only ever show you the color you used in the base symbol.
* The color symbol + mask technique adds some bloat to the SVG file size.
* They’re all individual SVGs, so devs will want to jump off a bridge.

**Side note:**All of the icons in[UX Power Tools](https://www.uxpower.tools/)are constructed this way. It’s super fast to swap colors, and even easier to swap icons inside of elements like buttons, fields, and notifications.

### What I Do For Developers

Zeplin works incredibly well for layout, color, and typography, but isn’t terribly efficient for assets. Instead of having devs pull icons directly from Zeplin \(or sending them a zip of SVGs\), I use[Nucleo](https://freeandwilling.com/Jon?go=icon-article-nucleo)to build an SVG sprite, then send that to developers. Not to brag, but they :heart: me for it :relieved:

Step 1:Create a new project in the Nucleo web app.

Step 2:Add icons to your Nucleo project that you intend to use \(or have already used\) in your designs.

![](http://img2.tuicool.com/qEN7bi7.png!web)

Step 3:Open the project, select all icons in the right panel, and click_Download_.

![](http://img0.tuicool.com/vUFFRvY.png!web)

Step 4:Choose your export preferences. “Export as Symbol” uses_xlink:href_which will be[deprecated in SVG 2](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:href)\(not out yet\). That being said, it’s just the_“xlink”_portion that will no longer be needed, so “Export as Symbol” is still a safe option. I usually choose “Export CSS”, which creates a single SVG sprite, then creates a CSS file with classes for each icon.

But wait, that’s not even the best part!

Along with the SVG sprite and generated CSS, Nucleo also creates an HTML page showing off each icon, and the CSS class for using that icon in code.

![](http://img0.tuicool.com/qUFNB3E.png!web)

#### Why This Works for Designers

* You don’t have to change your design process
* There’s a beautiful GUI for choosing icons
* Adding new icons is simple for both parties

#### Why This Works for Developers

* It generates a single SVG sprite and the correct CSS
* It gives developers a GUI for finding icons and copying the code
* They can change the icon color and size in code. Hallelujah!

### Summary

There are fast ways to_**design**_with icons, and fast ways to_**develop**_with them. It’s a little extra work to make things optimal for both parties, but it will make everyone’s lives easier.

If you’re not using[Nucleo](https://freeandwilling.com/Jon?go=icon-article-nucleo), you can find lots of services like[Iconizr](https://iconizr.com/)that will help you generate an SVG sprite. If you’re lucky enough to have your own icon designer\(s\), then you’ll have to do this anyway since everything will be custom! You lucky dog.

Check out[**UX Power Tools**](https://www.uxpower.tools/)to see how you can use these icons in all kinds of sophisticated nested symbols. It’s truly the fastest way to design.

![](http://img1.tuicool.com/3ArEv2r.png!web)



Source: [https://medium.com/ux-power-tools/the-most-efficient-way-to-use-icons-if-youre-a-designer-or-developer-5ce3954c146c](http://www.tuicool.com/articles/hit/UJRZv2a)

  


