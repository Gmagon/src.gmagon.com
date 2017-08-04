layout: guide
title: How CSS works? 
keywords: how css works, css works together with html 
description: How does CSS work? This article explains how CSS works together with HTML as a web page in the reader’s browser. 
---

Cascading Style Sheet (CSS) allows you to create great looking webpages, but how does it work? This article explains how CSS works together with HTML as a web page in the reader’s browser. 

(Cascading Style Sheet) is a completely different approach to webpage styling and layout. When a web-browser displays an HTML document , it must combine the document`s content with its style information . Actually the content of a page goes into an HTML file, and the style information goes into a style sheet. But how does all this work together to determining how a webpage should look? 
![](img/patterns.png)
Cascading Style Sheet (CSS) works by allowing you to associate rules with the elements that appear in an HTML document. These rules govern how the content of those elements should be rendered. A rule set consists of a selector followed by a declaration block.
![](img/rules.png)
CSS selectors are patterns used to select the elements you want to style
><font color=#0099ff size=3>h1 {color:red}  - here h1 is the selector</font>

Declarations, which sets out how the elements referred within the selector should be styled
><font color=#0099ff size=3>h1 {color:red} - here color:red is declaration</font>

The declaration is also split into two parts, separated by a colon : property and value

Property is assigned to a selector in order to manipulate its style and Value is an assignment that a property receives
><font color=#0099ff size=3>h1 {color:red} - here color is property and red is value.</font>

Each property - value pair within a rule must be separated by a semicolon, If there is only one property-value pair in the declaration, you do not need to end it with a semicolon.

A simple example Applying CSS and HTML tags in an HTML page. 

```html
<html>
	<body>
		 //css implementation
		 <hr style="color:#FF0066;">
		 
		 // HTML implementation
		 <hr color="#FF0066">
	</body>
</html>
```

In the next page, we will explain how to code CSS stylesheets quickly in an easy way even though you are a CSS beginner. 

<p><a href="../../../products/store/gmagon_css_maker/" target="_blank" class="button padding20">Try Gmagon CSS Maker</a></p>

{% raw %}
<link rel="stylesheet" href="./css/page.common.css">
{% endraw %}