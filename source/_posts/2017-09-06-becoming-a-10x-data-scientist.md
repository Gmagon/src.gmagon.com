---
title: Becoming a 10x Data Scientist
---

Recently I gave a talk at [PyData Seattle](https://pydata.org/seattle2017/) about how to ramp up your data science skills by borrowing tips and tricks from the developer community. These suggestions will help you become a more proficient data scientist who is loved by your team members and stakeholders.

This post is broken up into five parts including:

* [History and controversy of the 10x developer.](https://blog.algorithmia.com/becoming-a-10x-data-scientist/#history)
* [Project design.](https://blog.algorithmia.com/becoming-a-10x-data-scientist/#project)
* [Code design.](https://blog.algorithmia.com/becoming-a-10x-data-scientist/#code)
* [Tools for the job.](https://blog.algorithmia.com/becoming-a-10x-data-scientist/#tools)
* [Productionizing model.](https://blog.algorithmia.com/becoming-a-10x-data-scientist/#prod)



---

Also, if you want to watch the original talk in its entirety check it out[here](https://www.youtube.com/watch?v=nFVjLSvK5po).

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-17.png)]

---

A 10x developer is someone who is literally 10 times more productive than the average developer.

A 10x developer is someone who not only produces more code per hour than the average developer, but they debug like a boss, they introduce less bugs because they test their code, they mentor junior developers, write their own documentation, and have a lot of other broad skills that go beyond knowing how to code.

![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-2-1.png)

---

A 1968 experiment by [H. Sackman](http://dl.acm.org/author_page.cfm?id=81100057953&coll=DL&dl=ACM&trk=0&cfid=956367268&cftoken=72985028),[W. J. Erikson](http://dl.acm.org/author_page.cfm?id=81544973356&coll=DL&dl=ACM&trk=0&cfid=956367268&cftoken=72985028), and [E. E. Grant](http://dl.acm.org/author_page.cfm?id=81332501500&coll=DL&dl=ACM&trk=0&cfid=956367268&cftoken=72985028) called the “Exploratory experimental studies comparing online and offline programming performance” discovered that there were a wide range of times it took programmers to accomplish coding tasks.

The study focused on programmers who had an average of 7 years experience and discovered that there was a 20:1 difference between programmers. 

Although there were [flaws found in the experiment](http://www.construx.com/10x_Software_Development/Origins_of_10X_%E2%80%93_How_Valid_is_the_Underlying_Research_/) such as combining programmers writing in low-level languages and others in high-level languages , later there were [more studies](http://www.ybrikman.com/writing/2013/09/29/the-10x-developer-is-not-myth/) done finding similar results.

While there has been extensive debate regarding whether or not 10x developers exist, this article will instead focus on what you can do to be a more productive data scientist by taking tips and tricks from seasoned developers who others consider remarkably faster than their counterparts.



[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-3-1.png)]

---

**Get to Know the Business**

It doesn’t matter if you work for an education, biotech or finance company, you should have at least a high-level understanding of the business you’re solving problems for. 

In order to effectively communicate the story behind your data analysis, you should find out what drives the business and understand the business’s goals.

For instance if you were focusing on optimizing for food truck locations you would want to understand foot traffic, competition, events happening in the area, and even weather. You’d want to understand why the business is optimizing for locations. It might be to increase sales for current trucks or maybe they are looking to add trucks.

Even though you might be a data scientist at a job search site today and at a financial firm tomorrow, you should know what makes the business tick in order to make your analysis relevant to stakeholders.

You should also have an understanding of what the business processes are for your project such as knowing who needs to sign off on the end results, who the data model will get passed on to once your part is complete and what the expected timeframe is.

And finally, you should make sure you know who the stakeholders are and introduce realistic expectations to non-technical stakeholders. Expect to be an educator and teach non-technical stakeholders why reaching their goals might take more time or resources than they thought.

When you understand the stakeholder’s goals and make sure you communicate the technology, expertise, and time it would take to build out their solution then you will become an even more valuable asset to your company.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-4-1.png)]

---

**Know the Data**

While it’s important to understand the business, it’s more important to understand the data. You’ll need to know how the data was extracted, when it was extracted, who is responsible for quality control, why there might be gaps in the data \(for instance a change in vendors or a change in extraction methods\), what might be missing and what other data sources could potentially be added to create a more accurate model.

It really comes down to talking to different teams and asking a lot of questions. Don’t be afraid to ask what people are working on and discuss what you’re working on too because you never know when people are doing duplicate work or if they have a cleaner version of data that you need access to. It’ll save you a ton of time being able to query a database versus making multiple API calls to SiteCatalyst for example.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-5-1.png)]

---

Why does taking time and care during project design make you a 10x data scientist?

* You’ll only do the work that needs to be done \(think before you code\) so you’re faster at getting a project done because you’ll do less work!
* By finding misunderstandings between what customers/users think they need versus what they really need you’ll position yourself as the expert and a consensus builder.
* You’ll solidify your own understanding of what the ask is so you won’t make costly errors.

## Code Design

While there are many best practices when designing your code, there are a few that stand out which will increase your x-value considerably.

The first time I heard the idea that clarity or clearness beats cleverness was in my writing classes in college. It’s easy to get caught up on your own cleverness and use the latest word of the day to get your ideas across, but like programming you’ll not only likely confuse yourself, you’ll confuse others.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/Copy-of-PyData-Seattle2017-3.png)]
---

In the above Scala example, the first line shows the `sortBy` method using a shorthand syntax. While it’s concise, it’s hard to think through what the underscore stands for. Even though this is a common pattern that many people use as an argument name in an anonymous function, for less advanced developers \(or when you haven’t looked at your code for a while\), it becomes tedious to figure out what the code does. 

In the second example we at least use an argument name, plus it’s showing assignment and we can see that it’s sorting by the next to last element in the sequence x. 

When code is less abstracted, it’s easier to debug later so in the third example I’m going to explicitly name my argument so it’s representative of the data.

When your brain has to go through each step and either look up or recall what the shorthand code does, it takes longer to debug and longer to add a new feature so even though using shorthand such as the examples above are concise and faster to type initially, in the long run it will benefit both you and others to avoid being too clever. 

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/Copy-of-PyData-Seattle2017-1-1.png)

---

While we won’t go over caching, we will cover the importance of naming things. Imagine you’re looking through some old code and you see a sequence being sorted like in the Scala example:

```
.sortBy(x =
>
-x._2)
```

Using a single letter to name a sequence doesn’t provide useful information at all because likely you are pulling your data from somewhere like an API, a database or a data stream in Spark where you’d have to run your code to see what “x” is.

So keeping with the Scala example from before:

```
sortBy(clothesCount =
>
-clothesCount._2)
```

You can tell what we are sorting without even running the code.

However, sometimes there are perfectly good reasons to use X as a variable name. For example X is often used in machine learning libraries where X is known to mean the observed data while y is the variable that is trying to be predicted for. In this case it’s preferable to use the conventions of your field where “model”, “fit”, “predicted”, and “x” and “y” mean the same thing to everyone in that field.

Outside of data science you would be expected to follow the programming language’s conventions of the language your are using. For example, I recommend you checking out the docs such as PEP for Python to learn best practices or 

By being careful of your naming conventions and by being clear instead of clever with your code, it will make refactoring and debugging both easier and faster. By following these two tenants of code design, you’ll be well on your way to becoming a 10x data scientist.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/Copy-of-PyData-Seattle2017-2-1.png)

---

Being consistent with your code style is just as important as following naming conventions. To gain some basic style points you should stick to the same case, don’t mix camel and snake case together in the same script. It quickly becomes hard to read and navigate your code. Another way you should be consistent is to stick with the same method of accomplishing a task. For instance if you want to remove duplicates from a dictionary and you need to do it in a couple of spots in your code, don’t get creative and use a different way to do it just because you saw it on Stack Overflow. Use the clearest and least clever method that is consistent across your code and across scripts. Again, the purpose of consistency is to avoid confusing yourself and others which will allow you to debug faster! \(Notice a debugging theme here\).

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-6-1.png)

---

Remember how we just talked about having to remove duplicates in a dictionary in multiple places in your code? Use functions so you don’t have to rewrite that code multiple times. Even if you aren’t reusing the code, it’s a crucial best practice to wrap your code in functions. Your functions should be small and only do one thing so they can be reused. 

When you don’t use functions, then you’ll have global variables that result in name collisions, non-testable code, and code that repeats itself often.

By utilizing functions, your code is composable and easy to write unit tests for.

But don’t just stop at writing small functions that only do one thing, make sure to abstract your functions so you can reuse them – this lends itself to the DRY mentality and will speed up your development time which will at least make you a 2xer.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-7-1.png)

---

Less common, but important to code design is using code stubs. Code stubs are simply mock classes and functions that show inputs, outputs and comments that provide an outline for your code. Using code stubs before you actually start to write the real meat of your code will force you to think through your code first and will help you avoid monstrous spaghetti code. You’ll notice what areas you are repeating code in before you write it and will think through what data structures are most appropriate.

The above code sample brings us to writing both comments and documentation. To truly become beloved by your coworkers and increase your own efficiency as a data scientist is to write helpful concise comments. Not only should you include comments about what the piece of code does, but its inputs and outputs as well.

Also, probably the coolest thing about docstrings is that they can be turned into documentation via libraries in most languages. For instance Python has a library called[Sphinx](http://www.sphinx-doc.org/en/stable/)that allows you to turn your docstrings into full blown documentation.

You might know what your code does now, but down the line when you are trying to debug or add a feature you and others will be glad for the comments.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-8-1.png)

---

No matter what language you’re coding in, please use exception handling and leave a helpful error message for yourself, your coworkers, and end users. The code above is showing a stop function passing in the error message from the API that’s being called. 

If the data isn’t what the API expects, then it throws a helpful error message. In your own code you could write a message within the stop function that helps the user such as:



```
stop(paste0(“Make sure all your inputs are strings: ”, e))
```

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-9-1.png)

---

This example above is from the Hitchhikers Guide to Python and it uses the Python testing library Pytest.

While writing unit tests are fairly common for developers, they are rarely used in the data science world. Sure you are validating your model using cross validation, a confusion matrix, and other methods. But are you testing the queries that are getting your data for you? How about the various methods you are using to clean and transform the data the way you need it for your model? These areas are crucial in safekeeping against “Garbage In, Garbage out”. When you test your code you are both future proofing it against changes that might introduce bugs, but when you are your own QA, everyone will think you’re a rockstar due to the lack of bugs in your code once it goes to production.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-10-1.png)

---

Using version control for your projects is an important step in becoming a 10x data scientist. Obvious benefits are saving different versions of your model, and easily working across teams, but also by using version control with a back up in a repository you safeguard against losing work in case of a stolen laptop or crashed hard drive.

In beta, there is an open source data version control project called[Data Version Control](https://dataversioncontrol.com/) which looks promising for data science workflows. It relies on Git and allows projects to be reproducible across teams by building a data dependency graph. Your data is saved separately from your model and it works like other version control allowing you to roll back to previously saved snapshots.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-11-1.png)

---

10x developers know to use the right tool for the job, whether it’s using a library to save time, switching languages for performance, or using an API instead of building out the solution themselves.

Say you have Twitter or other social data and need a sentiment analysis. One option is to label that data yourself & train your own model or you could utilize a pre-trained model. It’s ok to not reinvent the wheel by building every data model yourself. Use the tools that are best suited for the job even if that means using ones that you didn’t build.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-12-1.png)

---

We’ve all written a Bash script paired with a Cron job to automate some reports right? But after you spend some time trying to debug a report written by someone else that’s automated by a Cron job without even knowing where it was running from, you realize there has to be a better way. Using an automation tool like Puppet, Chef, Ansible, or any of the other popular automation tools you can run your jobs from a centralized location so debugging someone else’s \(or your own\) job is a lot faster.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-13-1.png)

---

Sometimes you’re not going to have a team to hand your pickled model to so you might need to know how to deploy your model yourself.

While there are many differences between these providers, they range from incredibly easy-to-use to requiring much more setup and knowledge. This section could be a talk in itself. If you want more details about model hosting, check out a couple of different talks we covered about [intro to deploying your model](https://blog.algorithmia.com/building-intelligent-applications/) and[deploying and scaling your deep learning model](https://blog.algorithmia.com/deploying-deep-learning-cloud-services/).

**Things that could be deal breakers:**

* Ease of use
* Cost \(including add-ons and hidden costs such as hosting data\)
* Vender lock-in
* Languages available

**How does it make you a 10x data scientist:**

By knowing how to deploy your model you take yourself from being able to tell a story with your data to easily sharing it with team-members \(no matter what language they write\) or deploying it to a production environment to share with thousands of users. This will help you become a 10x-er because once you understand this you can create more performant models that will make users happy. And when users are happy, business owners are happy.

[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-15-1.png)

---

To round out this post, here are some favorite tips on how to become a 10x data scientist:

* Pattern Matching. This comes from hard-earned experience of running into a similar problem before and realizing that you could reuse or modify a solution to your current problem.
* Learn how to explain your code – to yourself and others. This means whiteboarding, doing/getting code reviews and even pair programming. Get used to talking about your code and your thought process.
* Learn how/when to quit and start over. Don’t be afraid to start over if you realize there is a better way to solve the problem. It’s better to start over and do it a better way versus sticking out something that isn’t optimal or performant.
* Create your own stock of
[Gists](https://help.github.com/articles/about-gists/)
 or organize code snippets through a repository on
[GitHub](https://github.com/)
or other hosting service. 



[![](https://blog.algorithmia.com/wp-content/uploads/2017/08/10X-Data-Science-talk-14-1-1.png)

---

Lastly all throughout the post, the same theme has cropped up to becoming a 10x data scientist and that one tenant is debugging. Every 10x developer is a master debugger because the rule is however long you code for, you can multiply that by 10 and get the time it will take you to debug it. A few tips to becoming a great debugger is that you use exception handling, you utilize the debugger in your IDE, you talk through your code looking for errors in your logic, and you check the source code of the library involving the error to make sure you are passing in what the code expects.

Even if you only take a few points away from this post, you’ll be on the path to becoming a 10x Data Scientist. Good luck on your journey and feel free to share your tips and tricks to being a 10X Data Scientist with us [@Algorithmia](https://twitter.com/algorithmia).
Source: https://blog.algorithmia.com/becoming-a-10x-data-scientist/

