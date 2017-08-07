layout: guide
title: CSS Background 
keywords: element backgrounds in CSS, CSS background, style background in CSS
description: This article will teach you most of what you'll ever need to know about styling element backgrounds in CSS.
---


In CSS you can do a lot to style the background behind your content. This article will teach you most of what you'll ever need to know about styling element backgrounds in CSS. Hopefully you'll have some fun along the way. 

## What exactly is a background?
The background of an element is the area that sits underneath an element's content, padding, and border. The background doesn't sit underneath the margin -- the margin doesn't count as part of the element's area, but rather the area outside the element.

The background property in CSS allows you to control the background of any element. It is a shorthand property, which means that it allows you to write what would be multiple CSS properties in one. Like this:

### CSS
```html
body {
  background:
     url(sweettexture.jpg)    /* image */
     top center / 200px 200px /* position / size */
     no-repeat                /* repeat */
     fixed                    /* attachment */
     padding-box              /* origin */
     content-box              /* clip */
     red;                     /* color */
}
```

## Background basics
Background is made up of eight other properties:
* background-color: sets a solid color for the background.
Set the background-color of different elements: 

```html
body {
    background-color: yellow;
}

h1 {
    background-color: #00ff00;
}

p {
    background-color: rgb(255,0,255);
}
```

* background-image: Specifies a background image to appear in the background of the element. This can be a static file, or a generated gradient. 
Set a background-image for the <body> element:
```html
body {
    background-image: url("paper.gif");
    background-color: #cccccc;
}

* background-repeat: specifies whether the background should be repeated (tiled) or not.
Repeat a background-image only vertically:
```html
body {
    background-image: url("paper.gif");
    background-repeat: repeat-y;
}
```

* background-position: Specifies the position that the background should appear inside the element background.
```html
body { 
    background-image: url('smiley.gif');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center; 
}
```
* background-size: allows a background image to be resized dynamically.
Specify the size of a background image:
```html
div {
    background: url(img_flwr.gif);
    background-size: 80px 60px;
    background-repeat: no-repeat;
}
```

* background-attachment:specifies the behavior of an element's background when its content scrolls, e.g. does it scroll with the content, or is it fixed?
How to specify a fixed background-image:
```html
body { 
    background-image: url('w3css.gif');
    background-repeat: no-repeat;
    background-attachment: fixed;
}
```

* background-origin: defines where to paint the background: across the whole element, inside the border, or inside the padding.
Let the background image start from the upper left corner of the content:
```html
#example1 {
    background:url(img_flwr.gif);
    background-repeat: no-repeat;
    padding:35px;
    background-origin: content-box;
}
```
* background-clip: controls how far a background image or color extends beyond an element's padding or content.
Specify the painting area of the background:
```html
div {
    border: 10px dotted black;
    padding:35px;
    background: yellow;
    background-clip: content-box;
}
```
For those who are feeling difficult to code CSS style manually, <a href="../../../products/store/gmagon_css_maker/" target="_blank" rel="nofollow me noopener noreferrer" >Gmagon CSS Maker</a> is what you need. It helps you create a nice look web page on Mac platform without writing a code. Let's explore how Gmagon CSS Maker works. 
![](/img/css-background.png)

<p><a href="../../../products/store/gmagon_css_maker/" target="_blank" class="button padding20">Try Gmagon CSS Maker</a></p>

{% raw %}
<link rel="stylesheet" href="./css/page.common.css">
{% endraw %}


