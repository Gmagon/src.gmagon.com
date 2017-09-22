---
title: Ten Fallacies of Data Science Work
---

![](http://img1.tuicool.com/YNvqEnj.jpg!web)

There exists a hidden gap between the more idealized view of the world given to data-science students and recent hires, and the issues they often face getting to grips with real-world data science problems in industry. All these new college courses in data analytics \(they’re almost all newly-minted courses\) aim at teaching students the basics of coding, statistics, data wrangling etc. However, the kind of challenges you’re expected to overcome in an actual data science job within industry are greatly under-represented.

The analytics course provides the data \(and often the tools\) and asks you to generate an expected result, whereas the industry role may provide you with neither the data, nor the appropriate tools, nor even an idea of what constitutes an expected result. Plus the industry piece usually has a more stringent deadline, no support and a limited statistical understanding by the person requesting the analysis.

In the context of picking up the skills needed to perform some useful analytics work, it stands to reason that many barriers are deliberately lowered by college courses to allow you to focus on the core data science piece. The course material inches you ever-forward, introducing statistical distributions, hypothesis testing, classifiers and various tools like R, SPSS, Python and RapidMiner. Finally, after you’ve gotten to grips with the basics, you’re handed a nice clean dataset and asked to compare how some random forest performs versus some other type of classifier.

Now don’t get me wrong, this type of learning is fundamental to the types of work you might do later on in your career, but it’s about as useful as any sort of book-learning can do. There is a long, painful and never-ending re-alignment of these idealized projects against more real-world work practices. And these can be encountered most commonly as a series of fallacies which the newbie data scientist first encounters in their new role, often accompanied by much weeping and gnashing of teeth.

1. **The data exists.**

![](http://img0.tuicool.com/AnimieF.jpg!web)

Invariably, the request for an ad-hoc piece of analytics work pre-supposes the availability of data that forms the basis for this work. This may seem like the most basic kind of assumption, but it wouldn’t be too rare to be asked to analyse some dataset, only to realise that it’s non-existent, inaccessible, lacking common identifiers or aggregated/summarised at too high a level. The first question to be asked at the beginning of any task is whether the underlying data exists at all before you go chasing down the rabbit hole, or more unwisely, agreeing to specific deadlines for the completed analysis. In the worst case you can be left high and dry with no data, but an ever pressing expectation to complete your unachievable analysis. In such scenarios there’s the temptation to present your analysis of the Swiss cheese of that underlying data, which will inevitably lead to incorrect conclusions and displays of extreme rudeness from officialdom. If the data is completely missing, shout early, and shout often. If there’s some incomplete data to work with, shout it out too, but don’t use it as a catch-all excuse to down tools until the perfect dataset is magically collated for you by the data engineering gnomes.

#### 2. The data is accessible.

Great, you’ve got a confirmation that the datasets you’re depending on actually exist somewhere and are rumoured to be largely complete. Now, the next hurdle is whether this data can be made accessible, to you, in a reasonable time. Wrapped up in this is often the competing priorities between different departments within a company, or data hoarded by external consultants, long-departed employees or third-party companies out to make a quick buck by selling access. Providing free and easy access to siloed information may not be in the best interests of the notional data-owner, whether it’s because of legal, contractual or financial constrains or just plain leverage to keep their current role. Even within individual companies you can find the door unceremoniously slammed in your face for what seems like a perfectly reasonable request for data. Where there’s money to be made, especially if there are external actors involved at any point in your data pipeline, you can find single-line SQL queries being presented as some behemoth project with an equally behemoth bill. The goal therefore, of any savvy data scientist, is to become the co-administrator of each and every stage of your own data pipeline, so that the ownership of each snippet of data is, at least, somewhat pliant to any requests for data.

#### 3. The data is consistent.

For eminently sensible reasons it is highly preferable to find a consistent dataset, in a nicely-structured, self-consistent and well-defined format. The joys, oh the joys, of finding that a data file suddenly switches from having 19 columns to having 20 and then back again, or that column ordering changes between different versions of the same data. As with all unwelcome surprises, this final glitch more than often presents itself at the last possible moment — when you call the**read.csv\(\)**function in R Studio to have a proper look at the data. Even if the data_looks_consistent, there’s a veritable carnival of swearing, name-calling and hair-pulling when you see things like dodgy UTF-8 characters, or changes with the date format within in a single file, going from_YYYYMMDD_to_MM-DD-YY_or some such nonsense. The basic axiom to keep in mind, especially data pipelines dependent on legacy systems, is that unless the data feed has been designed by a data scientist or data engineer, then it’s liable to return all sorts of cruft in response to different operating conditions.

#### 4. The data is relevant.

All things going well, the budding data scientist may find their long-expected dataset is neither up-to-date nor at the level of granularity required for the analysis. Google Analytics, arguably the most widely used source for web-related user behaviour, has some vexing issues that prevent it from lending itself to detailed analysis. Firstly, there’s the difficultly of uniquely identifying web users, and secondly, there’s the disquieting issue of GA presenting “estimates” of the total page views, rather than the actual stat. So, a reasonable-sounding request is rendered impossible due to irrelevant data. For example, if you’re asked with predicting retention rates for customers logging into website X, then the GA data feed will be as good as useless on its own.

#### 5. The data is intuitively understandable.

Too many times have I waited to receive a dataset which, once delivered and examined, ended up looking about as decipherable as some ancient Assyrian clay tablet. Domain-specific codes, truncated text fields, missing lookup tables and missing or poorly named header fields all contribute to poorly understandable data. Working strictly from the garbage-in/garbage-out policy means that any indecipherable data tends to get ignored in the outputs at best, and at worst causes a series of additional problems as you’re fishing around looking for the meaning behind fields called something like_HEADER\_1_. Unless there is an well documented description of the data provided as part of any analysis, then you won’t know if you’re measuring apples or oranges.

#### 6. The data can be processed.

Perfect, you have a 600MB CSV file now, which you need to clash with another 600MB CSV using an Excel VLOOKUP function… on a flaky out-dated and under provisioned laptop. What may surprise newbie data scientists, especially those coming into more established large-scale enterprises, is that data science tools are often treated no differently to other software applications in the IT domain. Open-source tools are frowned upon, installation privileges are unavailable, or any tool must conform with some spurious magical IT security certification that nobody has seen. I have seen IT people ask to be provided with a detailed security audit of certain well-established software packages. I have seen the perfectly functioning, market-leading software applications being rejected by industry IT bosses because the vendor was “too cheap” or “not a designated supplier of XYZ”.

Beyond simple technical issues around processing large-ish datasets, there can exist a conspiracy IT rules and regulations which render it impossible to get sufficient processing tools to cope with to the task at hand. I have heard of people being forced to perform V-Lookups using Excel, as a way of joining two datasets because, well, nobody with will provide them with any better mechanism. The next result of this sort of short-term IT restriction is that it can takes hours to process a single file, which given a bit of coding and parallelism, could be done automatically in a couple of minutes.

#### 7. Analyses can be easily re-executed.

![](http://img0.tuicool.com/rqyiyqi.jpg!web)

You remember that analysis you did for me three months ago? Here’s the updated marketing affiliation data, can you re-run it for me quickly, thanks!!! Right… people, where to start!!! This is analogous to someone handing you a single piece of jigsaw and asking you to recreate it in super-fast time based on the fact it was complete just before you mussed it up and put it back in the box. Or asking to live in some run-down house based on the fact it was habitable at some point in the past. Unless you explicitly setup a piece of analysis to be re-executable, and keep the data sources current, then chances are it will be a major pain in the posterior to update and re-import everything again to get the updated analysis. And that’s not even considering whether the data you used was static, or what you would need to do to account for any database schema changes or alterations to any other inputs.

As a result, if you are asked to perform what sounds like a major piece of analytics work, design the bugger so that it can be easily re-run, ideally at the click of a button and with the minimum effort from yourself.

#### 8. Where we’re going we don’t need encryption.

Ahh, yes, the classic. You’ve completed the analysis, compiled a nice report and a few slides on the problem, and now you need to send the data to someone for review. I’ll just paste the data with all the customer details in plain-text into an email, what could go wrong? Well, for one thing, it’s not too awfully difficult to auto-complete an email to the wrong person in a contact list, and send your crown jewels off to God-knows-where. Or, like a former colleague, who sent the detailed financial analysis for one company,_in error,_to their competitor!

![](http://img0.tuicool.com/3iARjii.jpg!web)

Need to use company-wide standard data encryption huh?

There are reasons the good people in information security require that any data you send out is encrypted. Security theatre is primarily the top of that list, ass-covering is probably second, but there are also plenty of sound reasons apart from outward appearances of security.

First thing you do before sending ANYTHING to ANYBODY, is to agree on appropriate levels of encryption and access to both the raw data, and the resulting analysis. Ideally, only do work on systems which are secure and not likely to be left behind in taxi’s or accessed by someone’s nosey flatmates. If needs be you must fight for encryption as standard… do not compromise. It will be likely that your own personal security standards will be far and above more technically-savvy and more secure than IT policies, so stick with them!

If you’re not allowed to install some GPG client \(as it would violate security policies\) encryption must be done using an encrypted file format, like a password-protected Excel or encrypted zip. What’s that you say? Encrypted zip’s get blocked by the email server, and the client has no SFTP or file-sharing server?**Tough**. Never, ever, compromise on your data security standards by taking some short-cut for ‘just this one time’. At the end of the day, you will be left carrying the bucket, while the person shouting at you for the analysis will go off on their merry way while you’re looking for another job.

#### 9. Analytics outputs are easily shared and understood.

Let’s face it — the majority of your audience will have not the slightest clue how to evaluate any fundamentally detailed analysis. They will prevaricate and pretend to understand, as displays of ignorance can be seen as weakness. They will ask you to augment your analysis with more features, claim that the analysis needs to be “mathematically proven before it can used”, and use all manner of distraction and subterfuge to hide their bafflement. Some just look for certain p-values, others rely on ‘gut-feel’ but you will see your detailed analysis doubted, questioned and ignored. Or to put it another way… any sufficiently advanced analysis will be indistinguishable from magic. Therefore it’s your primary job to translate the results for the less numerically-inclined, into language they can readily comprehend, whether or not you’ve answered the question that has been posed.

#### 10. The answer you’re looking for is there in the first place.

A bit like an Easter Egg hunt, there’s an implicit understanding that the desired goal of any data science project is actually achievable, given a bit of time searching around with the help of a few tools. However, unlike the eponymous Easter Bunny, there is nobody out there deliberately peppering your data with the nuggets of insight that will help prove something. Want to find out why your click-thru rate on the website is down this month? Want to figure out what customers prefer product X rather than product Y? These queries come pre-loaded with an expected outcome, often to the detriment of proper scientific enquiry.

Source:  https://medium.com/@brennash/the-ten-fallacies-of-data-science-9b2af78a1862