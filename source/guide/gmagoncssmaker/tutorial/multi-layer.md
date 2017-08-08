layout: guide
title: CSS-Multi-layers 
keywords: multilayer css, css layers, css multiple backgrounds, css layered backgrounds, css layer styles, css layer elements, css layer effects, css layer on top of another, css multi layer menu, css layer tutorial, css background tutorial
description: This CSS multi-layer elementary tutorial dedicate to helping beginners quickly to specify multiple background images for box elements using CSS on Mac. 
---
In this tutorial, we will concentrate on adding styling text with CSS code-one of the most common things you'll do with CSS. With CSS, it is possible to work with layers: pieces of HTML that are placed on top of the regular page with pixel precision. With CSS3, you can apply multiple backgrounds to elements. These are layered atop one another with the first background you provide on top and the last background listed in the back. Only the last background can include a background color.

You can do this with both the shorthand background property and the individual properties thereof except for background-color. That is, the following background properties can be specified as a list, one per background: background, background-attachment, background-clip, background-image, background-origin, background-position, background-repeat, background-size.

Specifying multiple backgrounds is easy:
<pre class="brush: css line-numbers  language-css"><code class=" language-css"><span class="token selector"><span class="token class">.myclass</span> </span><span class="token punctuation">{</span>
  <span class="token property">background</span><span class="token punctuation">:</span> background<span class="token number">1</span>, background <span class="token number">2</span>, <span class="token number">...</span>, backgroundN<span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="line-numbers-rows"><span></span><span></span><span></span></span></code></pre>


![](img/multi-layer.png)