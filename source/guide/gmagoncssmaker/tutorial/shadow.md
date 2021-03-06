layout: guide
title: CSS-Shadow  
keywords: css shadow, text shadow, box-shadow, css shadow inset, create css shadow, add css shadow, building css shadow, css elementary tutorial shadow, css shadow tutorial for beginners
description: This CSS shadow elementary tutorial dedicate to helping beginners quickly design box and text shadow around using CSS, especially on Mac. 
---



<br>
In this tutorial we are going to learn how to use the *CSS shadow property* to create different effects with just CSS code. CSS supported to add shadow to text or elements.Shadow property has divided as follows:

![](img/shadow-classify.jpg)

<br>

## Box Shadow
The box-shadow property helps web designers to implement multiple drop shadows on box elements, no matter inside shadow or outside shadow, including values for size, color, blur, spread, offset. It enables users to cast a drop shadow from the frame of almost any element. Used to add shadow effects to elements, following is the example to add shadow effects to element
<br>
### Inner-Shadow
You can apply shadows to the inside of a box through various settings of blur, offset, spread radius, color,.

1. **Blur radius**: The original value of the box is zero, the higher the number you set, the more blurred it will be, so the shadow becomes bigger and lighter. The maximum value is one hundred.
![](../../img/css-maker-innershadow-blur.png)
2. **Offset**: There are two values to set inner-shadow offset. Offset-x specifies the horizontal distance. The positive values place the shadow to the left of the box. While offset-y specifies the vertical distance, positive values place the shadow under the box.
![](../../img/css-maker-innershadow-offset.png)

3. **Spread radius**: Positive values will expand the shadow, make it bigger. While negative values will make the shadow shrink. 
![](../../img/css-maker-innershadow-spread.png)

4. **Color**: It takes any color value, like hex, named, rgba or hsla. The default color is black when the color value is omitted.
![](../../img/css-maker-innershadow-color.png)

<br>

### Outer-shadow
1. **Blur radius**: The original value of the box is zero, the higher the number you set, the more blurred it will be, so the shadow becomes bigger and lighter, and the further out the shadow will extend.
![](../../img/css-maker-outershadow-blur.png)

2. **Offset**: There are two values to set outer-shadow offset. Offset-x specifies the horizontal distance. The negative values place the shadow to the left of the box. While offset-y specifies the vertical distance, negative values place the shadow under the box.
![](../../img/css-maker-outershadow-offset.png)

3. **Spread radius**: Positive values will expand the shadow outside the box, make it bigger. While negative values will make the shadow shrink. 
![](../../img/css-maker-outershadow-spread.png)

4. **Color**: It takes any color value, like hex, named, rgba or hsla. The default color is black when the color value is omitted.
![](../../img/css-maker-outershadow-color.png)
<br>

### Text Shadow
We will leave the detail of the Text-shadow part to the next page of [CSS Text](./text.html).
![](img/shadow.jpg)
<br>

<p><a href="https://gmagon.com/products/store/gmagon_css_maker/" target="_blank" class="button padding20">Try to make shadows</a></p>



{% raw %}
<link rel="stylesheet" href="./css/page.common.css">
{% endraw %}

Hopefully the above has given you an insight into the wonderful world of CSS shadows.

In the next page, we will start to explore [CSS-Text](./text.html).



