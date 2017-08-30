---
title: Clean or shorten Column names while importing the data itself
---

\
(This article was first published on[**Coastal Econometrician Views**](http://costaleconomist.blogspot.com/2017/08/clean-or-shorten-column-names-while.html), and kindly contributed toR-bloggers\)

When it comes to clumsy column headers namely., wide ones with spaces and special characters, I see many get panic and change the headers in the source file, which is an awkward option given variety of alternatives that exist in R for handling them.

![](http://img2.tuicool.com/MfqeMz3.png!web)

One easy handling of such scenarios is using library\(janitor\), as name suggested can be employed for cleaning and maintaining. Janitor has function by nameclean\_names\(\) which can be useful while directly importing the data itself as show in the below example:

“

library\(janitor\); newdataobject

&lt;

- read.csv\(“yourcsvfilewithpath.csv”, header=T\) %

&gt;

% clean\_names\(\)

”


Source:  https://www.r-bloggers.com/clean-or-shorten-column-names-while-importing-the-data-itself/