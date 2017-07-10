---
title: 'Enhance Your Search Results: How to Get Started With Schema Markup '
---

Want to improve your appearance in search results? Then you need to know how to implement schema markup.

Schema provides the immediate benefit of enhancing the aesthetic of your search results and increasing your organic click-through rate.

Getting started with schema can be confusing – it can be a very technical process.

But any SEO can implement schema correctly without the help of a developer.

Here’s what you’ll need to implement schema microdata:

* A basic understanding of
  [HTML.](https://www.w3schools.com/html/)
* [Google’s structured data testing tool.](https://search.google.com/structured-data/testing-tool/u/0/)
* The
  [schema.or](http://schema.org/)
  g library.

## What You Need To Know About Schema

It’s important to understand where enhancements can be made for your specific industry. Staying focused on what enhancements will actually show up with the search results will help you prioritize what type of markup to concentrate on first.

Don’t get hung up on getting every bit of information that might be listed in the Schema.org library when doing your research.

While having markup markup on your web page as possible is ideal for all the search engines, it’s also important to understand exactly why you wanted to implement schema in the first place and not lose focus from that primary business objective.

Common enhancements that motivate site managers to implement schema:

* Image is shown with my search result
* Aggregate ratings shown with my search results
* Upcoming events shown with my search results
* Address to be known by the search results

There is definitely a lot more that can be done. Keep reading for specific and common enhancements later in this post.

## How to Implement Structured Data Using HTML

If you use a content management system \(CMS\) that allows you the functionality to switch to a text editor then you can easily add in markup tags to give your HTML content. If you’ve never done this before, the process is very simple.

Let’s use Devil’s Teeth Baking Company in San Francisco as an example of a local business to see how to markup the business name, address, and phone number. \(Yes, I do eat here.\)

There is currently no schema markup for this page, but the address is clearly shown in the hero image on the home page:

![](http://img1.tuicool.com/feIVNnY.png!web)

The HTML text code displays the following:

![](http://img0.tuicool.com/jmqMveN.png!web)

HTML code is taken from Google Structured Data Tool

We can enhance this homepage content by adding a few HTML tags to tell the search engine the address of this business using the existing content on the page.

![](http://img0.tuicool.com/myEjIfZ.png!web)

This might seem messy, but if you take the time to digest it, we really just added two div tags and a few span tags and put in the properties like a local business, telephone, street address, region, image and postal code names within those tags.

The end result if you put this code snippet into Google’s structured data tool is this:

![](http://img1.tuicool.com/r6vmE3R.png!web)

Passed Markup

As you can see my LocalBusiness markup has a warning for the price range. Seeing as I did not have the price range from the hero image I used for this example, I omitted it.

Whenever you implement schema, keep tabs on errors. When the structured data markup tool detects errors the SERPs will not show any of the schema markups with an error. But warnings will still populate the_other_schema tags you have in place.

## Process to Find the Right Markup

The above example had the goal in mind to mark the specific information on the page to have LocalBusiness information that search engines can understand. This markup will help the search engine understand that locality of the business with the intent to hopefully perform better in local search. That is a simple enough business objective.

You can determine what markup is needed for your business by taking into account what your business does, and where your audience is.

* If you serve customers from a physical address then a
  [local business](http://schema.org/LocalBusiness)
  markup should be included in your page.
* If you sell
  [products](http://schema.org/Product)
  online, then your product pages should have the correct product markup.
* If you host
  [events](http://schema.org/Event)
  then you would want to markup the event information with the correct event markup.

You can markup your entire page and the more your do, the more it will assist the search engine to understand your content better, which is the job of any SEO. Markup is also going to help you stay on top tomorrow’s world of voice search.

You can easily find the specific schema markup you need on schema.org and sift through the[full list](http://schema.org/docs/full.html)of what you might need and what schema microdata is available.

## Copy, Swap, and Paste from Schema.org Examples

This is a simple method that is easy to use. Look up the markup you need through schema.org’s site search. I will show this process with an example of a product markup.

Example:[Product](http://schema.org/Product)

Follow the link above and at the bottom you should find 3 examples of content being marked up on the bottom. They are divided into 4 tabs for each example.

1. Without Markup
2. Microdata
3. RDF-a
4. JSON-LD

We will look at example 2 because this example is the most in depth for a product markup.

![](http://img2.tuicool.com/3YjU3uM.png!web)

This product markup has everything you would probably need to enhance your search result as it includes the product name, the aggregate rating, the price, and will alert the customer that this product is currently in stock. All of these elements, by the way, will show up in a product image search on a mobile device.

![](http://img0.tuicool.com/B7V7Jjf.png!web)

Product Image Search on Mobile

If you run an e-commerce site and want to use this markup, you would simply copy this code and swap out the areas with information related to your product. This is simple enough to do, and you can check your implementation using the structured data testing tool. Run your code implementation through the tool and check for errors.

Tip: Try running the code first and opening up the areas Google has already identified.

![](http://img0.tuicool.com/q6VVBzI.png!web)

Paste your code snippet here

![](http://img1.tuicool.com/2ERbYrY.png!web)

Toggle through the right side and edit the left side

So, if you’re confused about how to swap out specific elements, just find the elements that directly apply to what you’re looking for. The tool will split your code into two views: the left side will be for your code, which you are free to edit. The right side is the schema validations that you can use as a guide to toggle through the code. This process is straightforward, find what you need and swap!

This is the simplest method to implementing structured data if you have no technical background in working with HTML.

## Using the JSON-LD Examples

I like to use the JSON-LD example because it is less intrusive than the HTML markup.

A lot of SEOs are adamant about not using hidden HTML content. The JSON-LD markup allows you to markup your web page without it being seen by the end user as it is done in JSON code and not visible HTML.

With this, you are able to add all the markup needed and not hinder the visual look of your web page with unnecessary text.

![](http://img2.tuicool.com/nMZbiiE.png!web)

Take this code and try editing the existing JSON-LD example within the script tags and pasting it into the text editor of your content management system.

Run the code you have from your text editor into the structured data testing tool and see if any errors occur. If no errors occur then you have readable markup in the form of JavaScript that the search engine will be able to understand this markup \(while the user won’t know it’s there\).

I prefer this implementation over HTML markup because you won’t stir up the wrath of your web designers with this method.

## Learn From Your Competitors

If you notice a competitor having a better search result than you do than analyze what markup they are using by placing their URL into the structured data testing tool.

You can run any page through Google’s Structured Data Tool to see how they are implementing their structured data. If you use the exact same schema markup that your competitors use, then your web page will also get those rich enhancements.

If you can’t tell by now the structured data testing tool is essential to doing any of this correctly.

## Common Markup You Should Use

Let’s go through some common markups that will enhance your search results.

### Product Markup

![](http://img0.tuicool.com/nMBBb2B.png!web)

* Name
* Image
* Price
* Aggregate Rating
* Description
* In Stock

### Recipe Markup

![](http://img0.tuicool.com/Zn6VrqB.png!web)

* Name
* Image
* Aggregate Rating
* Total Time
* Calories
* Recipe Instructions

### Event Markup

![](http://img0.tuicool.com/E7bayiI.png!web)

* Event Name
* Event Start Date
* Event Location Name
* Event Address Locality
* Event Address Region

## Key Takeaways

Using schema is essential to any successful SEO strategy. Schema is only going to become more important as people increasingly usevoice search.

Search engines like Google tell us exactly which bits of information they think is the most important to markup, based on how they design the look of the search results. By seeing what enhancements are made and what exactly will set off an error message we can tell that Google has collected all the data they need to let us know what is commonly being searched for.

#### Image Credits

Featured Image: Created by Author

In-Post Images: Screenshots by Author taken July 2017



Source: [https://www.searchenginejournal.com/get-started-schema/204518/](http://www.tuicool.com/articles/hit/vEbMbq7)

