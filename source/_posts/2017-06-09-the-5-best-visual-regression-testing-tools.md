---
title: The 5 best visual regression testing tools
---

# The 5 best visual regression testing tools

2017-06-08 21:03:22

[Creative Bloq](http://www.tuicool.com/sites/JfUNza)

**Source:**

[http://www.creativebloq.com/features/the-5-best-visual-regression-testing-tools](http://www.tuicool.com/articles/hit/QBFZfmF)

**Themes:**

regression testing

Over the past several years, I've noticed the term 'visual regression testing' cropping up in web development conversations more and more... and for good reason. It promises to provide tremendous value for those who are tired of manually checking their sites for style issues.

With this growing popularity, it seems like every month there's a new tool released, each promising to provide awesome visual regression testing automation. Unfortunately, I've found most to be more dream than reality, the truth being that these types of tests are deceptively complicated.

There are, however, a few that stand out from the crowd. While each has its benefits and drawbacks, I believe every tool in this list is worth a look.

![](http://img0.tuicool.com/2aEJVj3.jpg!web)

A quick chart looking at the major features of five of the most popular visual regression tools out there \[click the icon to enlarge\]

### 01.[Wraith](http://bbc-news.github.io/wraith/)

Wraith has been around for several years. It was one of the first tools on the scene, and it continues to see enhancements in functionality, with over 200 pull requests closed in its GitHub repo. It's the go-to tool for anyone developing in Ruby.

### Try it out

From your project directory, run**wraith setup**. Then run**wraith capture configs/config.yaml**. This will run a set of tests on two different versions of the BBC homepage. After completing your test run, check out your screenshot gallery by opening the newly created**shots/gallery.html**page in your browser of choice.

You can also customise your tests. In the**configs/config.yaml**file you can update the sites and pages to test, along with setting screen widths and diff mode.

### Pros and cons

* YAML configuration file is simple to work with
* You can compare two different URLs
* Installation can be tricky if you're not familiar with Ruby
* Running interactions specific to individual pages can be difficult

### 02.[PhantomCSS](https://github.com/Huddle/PhantomCSS)

Another veteran option, PhantomCSS has been a popular choice among frontend developers. Its familiarity and functionality make PhantomCSS a great choice for frontend folks looking to stretch their legs in terms of website testing. Built on top of PhantomJS/CasperJS, PhantomCSS adds to the fantastic functionality provided by those two tools.

### Try it out

Create a new JavaScript file with the following code:

```
casper.start(
'http://the-internet.herokuapp.com/checkboxes'
)
    .
then
(
function
()
{
        phantomcss.screenshot(
'#checkboxes'
, 
'before click'
);
        casper.click(
'#checkboxes input:first-child'
);
        phantomcss.screenshot(
'#checkboxes'
, 
'after click'
);
    });
```

Then run your file via the CapserJS CLI:**casperjs test myfile.js**. Your script will run in the background and your images will be saved to the**screenshots**folder.

### Pros and cons

* Many tutorials and presentations on it
* Built on top of CasperJS, allowing integration of page actions into tests
* Tests limited to PhantomJS
* No interface for reviewing/managing screenshots

### 03.[Gemini](https://gemini-testing.github.io/)

I find Gemini appealing because it packages traditional Selenium testing in an interface that isn't too complicated. As with PhantomCSS, you can define custom actions around your screengrabs. Unlike PhantomCSS, Gemini goes several steps further by providing 'test suites' that can help organise your code.

### Try it out

Create a**.gemini.yml**file with the following contents \(replacing the URL to your Selenium grid server\):

```
rootUrl
: 
http
:
//the-internet.herokuapp.com/checkboxes
gridUrl
: 
http
:
//localhost:4444/wd/hub
browsers
:

chrome
:

desiredCapabilities
:

browserName
: chrome
```

Then create a test file, and put it into the**gemini**folder in the root of your project. The file can be as simple as:

```
gemini.suite(
'yandex-search'
, 
function
(suite)
 {
    suite.setUrl(
'/checkboxes'
)
        .setCaptureElements(
'#checkboxes'
)
        .capture(
'before click'
)
        .capture(
'after click'
, 
function
(actions, find)
 {
                actions.click(
'#checkboxes input:first-child'
);
        });
});
```

Next, create your baseline images by running**gemini update**. You should see one test passed. You can run a regression test via**gemini test**, which will compare the new images with the ones stored inside the**gemini/screens**directory.

### Pros and cons

* Selenium integration allows you to test on a wide variety of browsers and devices
* Well-documented site with various examples
* Provides a framework for sorting tests into suites
* No direct access to Selenium, limiting the type of actions you can take on a page
* Running the same test on multiple resolutions requires advanced configuration

### 04.[WebdriverCSS](https://github.com/webdriverio/webdrivercss)

First, a caveat: the future of WebdriverCSS is uncertain, as there are efforts to replace it with a more up-to-date module. That said, I think it's still worth mentioning, as the same basic structure will carry on to the next implementation.

Like Gemini, WebdriverCSS hooks into Selenium for its functionality. It also sits on top of another tool: WebdriverIO. Because it is part of the WebdriverIO ecosystem, it benefits from everything that framework has to provide. This includes hundreds of commands you can send to the browser, before and after taking screenshots.

WebdriverCSS also integrates well with test frameworks like Mocha, Jasmine and Cucumber.js. Add in connectivity with cloud Selenium services like Sauce Labs and Browserstack and you've got a full-featured functional test suite with visual regression testing as the cherry on the top.

### Try it out

Create a new JavaScript file \(**test.js**\) in your project with the following content:

```
var client = require(
'webdriverio'
).remote({desiredCapabilities:{browserName: 
'chrome'
}})
require(
'webdrivercss'
).init(client, { screenWidth: [
640
,
1024
] });
var screenshotElement = [{ name: 
'checkboxes'
, elem: 
'#checkboxes'
 }];

client.init()
    .url(
'http://the-internet.herokuapp.com/checkboxes'
)
    .webdrivercss(
'before-click'
, screenshotElement)
    .click(
'#checkboxes input:first-child'
)
    .webdrivercss(
'after-click'
, screenshotElement)
.
end
();
```

Run the test by typing this command into your command line:**$ node test.js**. Validate the images that were created by checking the**webdrivercss**folder. If you run your test again and the screenshots change, you'll notice a**diff**folder will be added and the respective diff images will be inside of it.

### Pros and cons

* Since it uses WebdriverIO, you can take advantage of all the features that framework provides
* Quick configuration of different screen resolutions
* Enables you to hide/mask certain areas of the screenshot
* Future uncertain as this specific plugin is no longer officially maintained
* Requires you to learn how to use WebdriverIO

### 05.[Spectre](https://github.com/wearefriday/spectre)

Unlike the other tools on this list, Spectre doesn't run tests. Instead, it focuses on providing image comparison capabilities, along with an admin interface for managing screenshots.

In normal use, you'd pair Spectre up with a tool like WebdriverIO or PhantomJS. The latter would do the work of capturing the screenshots, while Spectre would manage storing and processing of images. I'm a fan of this, as the separation of concerns makes it easier as a community to have a testing tool of our choice, but also build out a common admin interface.

### Try it out

On your Spectre website, open up the path**/tests/new/**. From there you can customise the test information and upload an initial screenshot. After submitting your test, go to the main page of your site where you'll see a 'Test Project' created, along with a notification of 1 passed. You can click on any of the links on that page for further details on the test.

Next, go back to the**/tests/new**page and upload a new image. When completed, return to the main page and you'll see that Spectre ran the comparison and is now reporting a failing test.

### Pros and cons

* Clean, friendly interface for managing screenshots
* Doesn't try to do too many things, focusing efforts on a specific area of the testing landscape
* Requires knowledge of Ruby server setup
* Requires you to know how to send data/screenshots via a REST API

### Honourable mentions

There are a few tools that I feel are worth mentioning, even if they didn't get a featured spot in the list above. They are:

* [Galen Framework](http://galenframework.com/)
* [Shoov](http://shoov.io/)
* [BackstopJS](https://github.com/garris/BackstopJS)

For a comprehensive list of tools and articles on the subject, check out[visualregressiontesting.com](https://visualregressiontesting.com/).

### What next?

'That list is great, but can't you just tell me which tool to use?' I hear you ask. Well ... no, because it greatly depends on what you're testing. If you're checking a fairly simple site, Wraith or Gemini are great options. But if you need to mimic user actions, then WebdriverCSS or PhantomCSS would be a better fit. If you're unsure, don't worry. Just pick one and try it out. No matter which tool you choose, you'll learn valuable lessons about frontend testing and just how powerful \(albeit complicated\) it can be.

_This article originally appeared in_[_net magazine_](http://www.creativebloq.com/net-magazine)_issue 290;_[_buy it here_](https://www.myfavouritemagazines.co.uk/design/net-magazine-back-issues/net-march-2017-issue-290/)_!_

