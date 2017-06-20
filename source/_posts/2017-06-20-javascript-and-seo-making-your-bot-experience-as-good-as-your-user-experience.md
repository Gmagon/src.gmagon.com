---
title: 'JavaScript & SEO: Making Your Bot Experience As Good As Your User Experience'
---

  
Understanding JavaScript and its potential impact on search performance is a core skillset of the modern SEO professional. If search engines can’t crawl a site or can’t parse and understand the content, nothing is going to get indexed and the site is not going to rank.

The most important questions for an SEO relating to JavaScript: Can search engines see the content and grasp the website experience? If not, what solutions can be leveraged to fix this?

## Fundamentals

### What is JavaScript?

When creating a modern web page, there are three major components:

1. **HTML –**
   Hypertext Markup Language serves as the backbone, or organizer of content, on a site. It is the structure of the website \(e.g. headings, paragraphs, list elements, etc.\) and defining static content.
2. **CSS –**
   Cascading Style Sheets are the design, glitz, glam, and style added to a website. It makes up the presentation layer of the page.
3. **JavaScript –**
   JavaScript is the interactivity and a core component of the dynamic web.

_Learn more about_[_webpage development_](https://www.codecademy.com/learn/web)_and how to code basic_[_JavaScript_](https://www.codecademy.com/learn/javascript)_._

![](http://img2.tuicool.com/jqUZR3Q.gif)

Image sources:[1](https://img0.etsystatic.com/000/0/6007442/il_fullxfull.281148222.jpg),[2](http://i.ebayimg.com/00/s/NTAwWDQ1Mg==/z/0FYAAOxyRhBS-qzb/$_3.JPG?set_id=2),[3](http://i.imgur.com/hjRn2ZM.gif)

JavaScript is either placed in the HTML document within &lt;script&gt; tags \(i.e., it is embedded in the HTML\) or linked/referenced. There are currently a plethora of JavaScript libraries and frameworks, including jQuery, AngularJS, ReactJS, EmberJS, etc.

#### JavaScript libraries and frameworks:

![](http://img2.tuicool.com/Q73aYj2.png!web)

### What is AJAX?

AJAX, or Asynchronous JavaScript and XML, is a set of web development techniques combining JavaScript and XML that allows web applications to communicate with a server in the background without interfering with the current page. Asynchronous means that other functions or lines of code can run while the_async_script is running. XML used to be the primary language to pass data; however, the term AJAX is used for all types of data transfers \(including JSON; I guess "AJAJ" doesn’t sound as clean as "AJAX" \[pun intended\]\).

A common use of AJAX is to update the content or layout of a webpage without initiating a full page refresh. Normally, when a page loads, all the assets on the page must be requested and fetched from the server and then rendered on the page. However, with AJAX, only the assets that differ between pages need to be loaded, which improves the user experience as they do not have to refresh the entire page.

One can think of AJAX as mini server calls. A good example of AJAX in action is Google Maps. The page updates without a full page reload \(i.e., mini server calls are being used to load content as the user navigates\).

![](http://img2.tuicool.com/reM3Un3.png!web)

Image[source](https://derivadow.com/2007/01/05/ajax-what-is-it-its-not-dhtml/)

### What is the Document Object Model \(DOM\)?

As an SEO professional, you need to understand what the DOM is, because it’s what Google is using to analyze and understand webpages.

The DOM is what you see when you “Inspect Element” in a browser. Simply put, you can think of the DOM as the steps the browser takes after receiving the HTML document to render the page.

The first thing the browser receives is the HTML document. After that, it will start parsing the content within this document and fetch additional resources, such as images, CSS, and JavaScript files.

The DOM is what forms from this parsing of information and resources. One can think of it as a structured, organized version of the webpage’s code.

Nowadays the DOM is often very different from the initial HTML document, due to what’s collectively called_dynamic HTML_. Dynamic HTML is the ability for a page to change its content depending on user input, environmental conditions \(e.g. time of day\), and other variables, leveraging HTML, CSS, and JavaScript.

Simple example with a &lt;title&gt; tag that is populated through JavaScript:

| HTML source | DOM |
| :--- | :--- |
| ![](http://img2.tuicool.com/QBJ3qeM.png!web) | ![](http://img1.tuicool.com/fmaimmr.png!web) |

### What is headless browsing?

Headless browsing is simply the action of fetching webpages without the user interface. It is important to understand because Google,[and now Baidu](https://www.merkleinc.com/blog/baidu-adds-new-spider-rendering-job), leverage headless browsing to gain a better understanding of the user’s experience and the content of webpages.

[PhantomJS](http://phantomjs.org/)and[Zombie.js](http://zombie.js.org/)are scripted headless browsers, typically used for automating web interaction for testing purposes, and rendering static HTML snapshots for initial requests \(pre-rendering\).

## Why can JavaScript be challenging for SEO? \(and how to fix issues\)

There are three \(3\) primary reasons to be concerned about JavaScript on your site:

1. Crawlability: Bots’ ability to crawl your site.
2. Obtainability: Bots’ ability to access information and parse your content.
3. Perceived site latency: AKA the Critical Rendering Path.

![](http://img0.tuicool.com/bAVB7bI.png!web)

### Crawlability

Are bots able to find URLs and understand your site’s architecture? There are two important elements here:

1. Blocking search engines from your JavaScript \(even accidentally\).
2. Proper internal linking, not leveraging JavaScript events as a replacement for HTML tags.

#### Why is blocking JavaScript such a big deal?

If search engines are[blocked from crawling JavaScript](https://moz.com/blog/why-all-seos-should-unblock-js-css), they will not be receiving your site’s full experience. This means search engines are not seeing what the end user is seeing. This can reduce your site’s appeal to search engines and could eventually be considered cloaking \(if the intent is indeed malicious\).

[Fetch as Google](https://www.google.com/webmasters/tools/googlebot-fetch)and TechnicalSEO.com’s[robots.txt](https://technicalseo.com/seo-tools/robots-txt/)and[Fetch and Render](https://technicalseo.com/seo-tools/fetch-render/)testing tools can help to identify resources that Googlebot is blocked from.

The easiest way to solve this problem is through providing search engines access to the resources they need to understand your user experience.

_!!! Important note:_Work with your development team to determine which files should and should not be accessible to search engines.

#### Internal linking

Internal linking should be implemented with regular anchor tags within the HTML or the DOM \(using an[HTML tag\) versus leveraging JavaScript functions to allow the user to traverse the site.](https://moz.com/blog/www.example.com)

Essentially: Don’t use JavaScript’s onclick events as a replacement for internal linking. While end URLs might be found and crawled \(through strings in JavaScript code or XML sitemaps\), they won’t be associated with the global navigation of the site.

Internal linking is a strong signal to search engines regarding the site’s architecture and importance of pages. In fact, internal links are so strong that they can \(in certain situations\) override “SEO hints” such as canonical tags.

#### URL structure

Historically, JavaScript-based websites \(aka “AJAX sites”\) were using fragment identifiers \(\#\) within URLs.

* **Not recommended:**
  * **The Lone Hash \(\#\) –**
    The lone pound symbol is not crawlable. It is used to identify anchor link \(aka jump links\). These are the links that allow one to jump to a piece of content on a page. Anything after the lone hash portion of the URL is never sent to the server and will cause the page to automatically scroll to the first element with a matching ID \(or the first 
    &lt;
    a
    &gt;
     element with a name of the following information\).
    [Google recommends](https://plus.google.com/u/0/+JohnMueller/posts/LT4fU7kFB8W)
    avoiding the use of "\#" in URLs.
  * **Hashbang \(\#!\) \(and**
    [**escaped\_fragments**](https://developers.google.com/webmasters/ajax-crawling/docs/specification)
    **URLs\) –**
    Hashbang URLs were a hack to support crawlers \(Google wants to avoid now and only Bing supports\). Many a moon ago, Google and Bing developed a complicated AJAX solution, whereby a pretty \(\#!\) URL with the UX co-existed with an equivalent escaped\_fragment HTML-based experience for bots. Google has since backtracked on this recommendation, preferring to receive the exact user experience. In escaped fragments, there are two experiences here:
    * **Original Experience \(aka Pretty URL\):**
      This URL must either have a \#! \(hashbang\) within the URL to indicate that there is an escaped fragment or a meta element indicating that an escaped fragment exists \(
      &lt;
      meta name="fragment" content="!"
      &gt;
      \).
    * **Escaped Fragment \(aka Ugly URL, HTML snapshot\):**
      This URL replace the hashbang \(\#!\) with “\_escaped\_fragment\_” and serves the HTML snapshot. It is called the ugly URL because it’s long and looks like \(and for all intents and purposes is\) a hack.

![](http://img0.tuicool.com/ai6JNjv.png!web)

Image[source](http://www.developerfusion.com/article/145920/using-html5-history-in-an-aspnet-mvc-site/)

* **Recommended:**
  * **pushState History API –**
    PushState is navigation-based and part of the History API \(think: your web browsing history\). Essentially, pushState updates the URL in the address bar and only what needs to change on the page is updated. It allows JS sites to leverage “clean” URLs. PushState is currently
    [supported by Google](https://webmasters.googleblog.com/2016/11/building-indexable-progressive-web-apps.html)
    , when supporting browser navigation for client-side or hybrid rendering.
    * A good use of pushState is for infinite scroll \(i.e., as the user hits new parts of the page the URL will update\). Ideally, if the user refreshes the page, the experience will land them in the exact same spot. However, they do not need to refresh the page, as the content updates as they scroll down, while the URL is updated in the address bar.
    * Example: A good example of a search engine-friendly infinite scroll implementation, created by Google’s John Mueller \(go figure\), can be found
      [here](http://scrollsample.appspot.com/items)
      . He technically leverages the replaceState\(\), which doesn’t include the same back button functionality as pushState.
    * Read more:
      [Mozilla PushState History API Documents](https://developer.mozilla.org/en-US/docs/Web/API/History_API)

![](http://img1.tuicool.com/beiAZ3E.jpg!web)

### Obtainability

Search engines have been shown to employ headless browsing to render the DOM to gain a better understanding of the user’s experience and the content on page. That is to say, Google can process some JavaScript and uses the DOM \(instead of the HTML document\).

At the same time, there are situations where search engines struggle to comprehend JavaScript. Nobody wants[a Hulu situation](http://www.linkresearchtools.com/case-studies/hulu-javascript-fail-visibility-drop/)to happen to their site or a client’s site. It is crucial to understand how bots are interacting with your onsite content. When you aren’t sure, test.

Assuming we’re talking about a search engine bot that executes JavaScript, there are a few important elements for search engines to be able to obtain content:

* If the user must interact for something to fire, search engines probably aren’t seeing it.
  * Google is a lazy user. It doesn’t click, it doesn’t scroll, and it doesn’t log in. If the full UX demands action from the user, special precautions should be taken to ensure that bots are receiving an equivalent experience.
* If the JavaScript occurs after the JavaScript load event fires plus ~5-seconds\*, search engines may not be seeing it.
  * \*
    [John Mueller mentioned](https://groups.google.com/forum/#!topic/js-sites-wg/ZFBMv2TcB3M)
    that there is no specific timeout value; however, sites should aim to load within five seconds.
  * \*
    [Screaming Frog tests](https://www.screamingfrog.co.uk/crawl-javascript-seo/)
    show a correlation to five seconds to render content.
  * \*The load event plus five seconds is what Google’s PageSpeed Insights, Mobile Friendliness Tool, and Fetch as Google use; check out
    [Max Prin’s test timer](https://maxxeight.com/tests/js-timer/)
    .
* If there are errors within the JavaScript, both browsers and search engines won’t be able to go through and potentially miss sections of pages if the entire code is not executed.

#### How to make sure Google and other search engines can get your content

#### 1. TEST

The most popular solution to resolving JavaScript is probably not resolving anything \(grab a coffee and let Google work its algorithmic brilliance\). Providing Google with the same experience as searchers is[Google’s preferred scenario](https://webmasters.googleblog.com/2015/10/deprecating-our-ajax-crawling-scheme.html).

Google first announced being able to “better understand the web \(i.e., JavaScript\)” in[May 2014](https://webmasters.googleblog.com/2014/05/understanding-web-pages-better.html). Industry experts suggested that Google could crawl JavaScript way before this announcement. The iPullRank team offered two great pieces on this in 2011:[Googlebot is Chrome](http://ipullrank.com/googlebot-is-chrome/)and[How smart are Googlebots?](https://moz.com/blog/just-how-smart-are-search-robots)\(thank you, Josh and Mike\). Adam Audette’s[Google can crawl JavaScript and leverages the DOM](http://searchengineland.com/tested-googlebot-crawls-javascript-heres-learned-220157)in 2015 confirmed. Therefore, if you can see your content in the DOM, chances are your content is being parsed by Google.

![](http://img1.tuicool.com/ZJj6VrV.jpg!web)

Recently, Barry Goralewicz performed[a cool experiment testing a combination of various JavaScript libraries and frameworks](https://goralewicz.com/blog/javascript-seo-experiment/)to determine how Google interacts with the pages \(e.g., are they indexing URL/content? How does GSC interact? Etc.\). It ultimately showed that Google is able to interact with many forms of JavaScript and highlighted certain frameworks as perhaps more challenging.[John Mueller even started a JavaScript search group](https://groups.google.com/forum/#!forum/js-sites-wg)\(from what I’ve read, it’s fairly therapeutic\).

All of these studies are amazing and help SEOs understand when to be concerned and take a proactive role. However, before you determine that sitting back is the right solution for your site, I recommend being actively cautious by experimenting with small section Think: Jim Collin’s “bullets, then cannonballs” philosophy from his book[Great by Choice](http://www.jimcollins.com/books/great-by-choice.html):

“A bullet is an empirical test aimed at learning what works and meets three criteria: a bullet must be low-cost, low-risk, and low-distraction… 10Xers use bullets to empirically validate what will actually work. Based on that empirical validation, they then concentrate their resources to fire a cannonball, enabling large returns from concentrated bets.”

Consider testing and reviewing through the following:

1. Confirm that your content is appearing within the DOM.
2. Test a subset of pages to see if Google can index content.

* Manually check quotes from your content.
* Fetch with Google and see if content appears.

* Fetch with Google supposedly occurs around the load event or before timeout. It's a great test to check to see if Google will be able to see your content and whether or not you’re blocking JavaScript in your robots.txt. Although Fetch with Google is not foolproof, it’s a good starting point.
* Note: If you aren’t verified in GSC, try
  [Technicalseo.com’s Fetch and Render As Any Bot Tool](https://technicalseo.com/seo-tools/fetch-render/)
  .

After you’ve tested all this, what if something's not working and search engines and bots are struggling to index and obtain your content? Perhaps you’re concerned about alternative search engines \(DuckDuckGo, Facebook, LinkedIn, etc.\), or maybe you’re leveraging meta information that needs to be parsed by other bots, such as Twitter summary cards or Facebook Open Graph tags. If any of this is identified in testing or presents itself as a concern, an HTML snapshot may be the only decision.

#### 2. HTML SNAPSHOTS

#### What are HTmL snapshots?

HTML snapshots are a fully rendered page \(as one might see in the DOM\) that can be returned to search engine bots \(think: a static HTML version of the DOM\).

[Google introduced HTML snapshots 2009](https://webmasters.googleblog.com/2009/10/proposal-for-making-ajax-crawlable.html),[deprecated \(but still supported\) them in 2015](https://webmasters.googleblog.com/2015/10/deprecating-our-ajax-crawling-scheme.html), and awkwardly mentioned them as[an element to “avoid”](https://webmasters.googleblog.com/2016/11/building-indexable-progressive-web-apps.html)in late 2016. HTML snapshots are a contentious topic with Google. However, they're important to understand, because in certain situations they're necessary.

If search engines \(or sites like Facebook\) cannot grasp your JavaScript, it’s better to return an HTML snapshot than not to have your content indexed and understood at all. Ideally, your site would leverage some form of user-agent detection on the server side and return the HTML snapshot to the bot.

At the same time, one must recognize that Google wants the same experience as the user \(i.e., only provide Google with an HTML snapshot if the tests are dire and the[JavaScript search group](https://groups.google.com/forum/#!forum/js-sites-wg)cannot provide support for your situation\).

#### Considerations

When considering HTML snapshots, you must consider that Google has deprecated this AJAX recommendation. Although Google technically still supports it, Google recommends avoiding it. Yes, Google changed its mind and now want to receive the same experience as the user. This direction makes sense, as it allows the bot to receive an experience more true to the user experience.

A second consideration factor relates to the risk of cloaking. If the HTML snapshots are found to not represent the experience on the page, it’s considered a cloaking risk. Straight from the source:

“The HTML snapshot must contain the same content as the end user would see in a browser. If this is not the case, it may be considered cloaking.”

–[Google Developer AJAX Crawling FAQs](https://developers.google.com/webmasters/ajax-crawling/docs/faq#cloaking)

#### Benefits

Despite the considerations, HTML snapshots have powerful advantages:

1. Knowledge that search engines and crawlers will be able to understand the experience.
   * Certain types of JavaScript may be harder for Google to grasp \(cough... Angular \(also colloquially referred to as AngularJS 2\) …cough\).
2. Other search engines and crawlers \(think: Bing, Facebook\) will be able to understand the experience.
   * Bing, among other search engines, has not stated that it can crawl and index JavaScript. HTML snapshots may be the only solution for a JavaScript-heavy site. As always, test to make sure that this is the case before diving in.

![](http://img0.tuicool.com/ZRRz6rR.jpg!web)

#### Site latency

When browsers receive an HTML document and create the DOM \(although there is some level of pre-scanning\), most resources are loaded as they appear within the HTML document. This means that if you have a huge file toward the top of your HTML document, a browser will load that immense file first.

The concept of Google’s critical rendering path is to load what the user needs as soon as possible, which can be translated to → "get everything above-the-fold in front of the user, ASAP."

#### Critical Rendering Path - Optimized Rendering Loads Progressively ASAP:

![](http://img2.tuicool.com/zMjQFrF.png!web)

Image[source](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/)

However, if you have unnecessary resources or JavaScript files clogging up the page’s ability to load, you get “render-blocking JavaScript.” Meaning: your JavaScript is blocking the page’s potential to appear as if it’s loading faster \(also called: perceived latency\).

![](http://img2.tuicool.com/BVNRN3B.png!web)

#### Render-blocking JavaScript – Solutions

If you analyze your page speed results \(through tools like[Page Speed Insights Tool](https://developers.google.com/speed/pagespeed/insights/),[WebPageTest.org](https://www.webpagetest.org/), CatchPoint, etc.\) and determine that there is a render-blocking JavaScript issue, here are three potential solutions:

1. Inline: Add the JavaScript in the HTML document.
2. Async: Make JavaScript asynchronous \(i.e., add “async” attribute to HTML tag\).
 
   ![](http://img2.tuicool.com/Bba67bj.png!web)
3. Defer: By placing JavaScript lower within the HTML.

![](http://img1.tuicool.com/FbU7n2N.png!web)

_!!! Important note:_It's important to understand that scripts must be arranged in order of precedence. Scripts that are used to load the above-the-fold content must be prioritized and should not be deferred. Also, any script that references another file can only be used after the referenced file has loaded. Make sure to work closely with your development team to confirm that there are no interruptions to the user’s experience.

Read more:[Google Developer’s Speed Documentation](https://developers.google.com/speed/docs/insights/BlockingJS)

## TL;DR - Moral of the story

Crawlers and search engines will do their best to crawl, execute, and interpret your JavaScript, but it is not guaranteed. Make sure your content is crawlable, obtainable, and isn’t developing site latency obstructions. The key = every situation demands testing. Based on the results, evaluate potential solutions.

![](http://img0.tuicool.com/bEFRvaj.png!web)

Thanks:Thank you Max Prin \(@maxxeight\) for reviewing this content piece and sharing your knowledge, insight, and wisdom. It wouldn’t be the same without you.

Source: [https://moz.com/blog/javascript-seo](http://www.tuicool.com/articles/hit/z63uymu)

