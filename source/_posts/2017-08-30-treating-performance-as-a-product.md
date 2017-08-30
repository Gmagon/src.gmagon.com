---
title: Treating performance as a product
---

# The origins of Luna

### Asana product vision

When developing the initial Asana application, cofounders Dustin Moskovitz and Justin Rosenstein imagined a web app that was as easy to use as paper. The early[vision for Asana](https://asana.zoomforth.com/asana-long-term-product-vision)was that users could create and update tasks at the speed of thought and share them with teammates immediately. To achieve this dream, we had to engineer a desktop-quality application. Yet building a native application for each platform was untenable for our size at the time. As a result, we decided to attempt to build a web application which we could deploy to every platform.

### Lack of alternatives

When we started development in 2009, few rich web applications existed. And with so few examples, there were no best practices to follow. Most interactive applications used a combination of AJAX and templates to achieve reactivity. This approach lead to missing data, many round trips, and inconsistent user experience. But our founding engineers had learned from their experience working at Google and Facebook that to ensure a performant and stable application, they would need to build their own framework. They named the framework[Luna](https://blog.asana.com/2015/05/the-evolution-of-asanas-luna-framework/)\(after Dustin’s cat\).

### Critical design decisions

To achieve our goals, we designed a system that optimized for developer productivity. Developers could write views like you would in React and the data would be available. Writing in Luna, when it was behaving well, was almost magic. Developing sophisticated features took half the time of a traditional Model-View-Controller approach. Our datastore and reactivity abstractions ensured a consistent product user experience.

To ground this in the open source context, we developed an in house versions of Firebase, RxJS, and React. The open source alternatives at the time were Backbone, Knockout, and Angular 1. Some developers believed so deeply in this framework they left Asana; with a few other contributors, they founded Meteor based on the principles of Luna.

But this magic came with some major drawbacks. The first was that we coupled application logic and data fetching. Determining what data to send to the client required the server to render the entire view. This meant we ran a stateful process for each user to simulate the UI. To make this whole system work, we also had to couple our patented reactivity system to our data store. The end result was that changing one aspect required changing all the aspects.

## Deciding on Luna2

### The need to convert

By 2013, as we added more features and as the code grew, the application started to feel slower. At the same time, Asana was becoming more than a simple shared task list for teams: we were growing into a full-blown work-tracking application that teams of 100s and even 1000s were relying on to hit deadlines, meet goals, and complete work together. We—and more importantly, our customers—had noticed performance degrading over time and Asana no longer felt like the desktop-quality application that our founders originally imagined. Several performance teams spent months improving different parts of the app. While each team achieved incremental wins, the fundamental drawbacks of the framework remained. We needed to attempt drastic measures to achieve our desired performance.

During[Thankshacking](https://blog.asana.com/2012/11/thankshacking/?)2013, a few engineers discussed how to address the core issues. The goal was to decouple application logic from data fetching. This would allow our infrastructure engineers to write a newer, faster backend. So we staffed a team to convert the existing product code to the new paradigm. But by March 2014, this team realized the deep coupling of Luna made this approach infeasible. During our next hackathon, we prototyped a new frontend in[TypeScript](https://blog.asana.com/2014/11/asana-switching-typescript/)and React. The hackathon design was both familiar and compatible with the new backend. We named the new combination of frontend and backend Luna2.

### Technical choices

After staffing one last Luna performance team, we decided to convert in August 2014. We heard anecdotes of companies failing to achieve their performance goals from rewriting. We also heard anecdotes of startups imploding from the effort. To avoid these outcomes, we rigorously challenged our principles and strategy. This process defined our vision of Luna2.

We chose a handful of core principles for Luna2 based on experience with Luna.

The first was to bias for**open source**. We had previously written many core utilities whose alternative appeared in the open source community over time. Instead of maintaining each internal library, we decided to use the open source alternatives. This approach also led us to contribute to the open source community. Our main contributions were the[React type definitions](https://github.com/Asana/DefinitelyTyped/tree/master/react)and[typed-react](https://github.com/Asana/typed-react).

The next principle was to bias for**explicit over implicit**. Many of our engineering problems came from the implicit nature of Luna. We struggled to onboard new engineers because product development required understanding our framework. Additionally developers were not setup to “[fall into the pit of success](https://blog.codinghorror.com/falling-into-the-pit-of-success/)” with performance.

The final principle was**simple over easy**. We composed clear and single use abstractions in contrast to the Luna monolith. These abstractions avoided the magic of Luna. Luna abstractions attempted to handle all cases and relied on domain specific languages. In contrast, Luna2 used strong invariants and a consistent coding style.

### An incremental rewrite

We decided to incrementally convert the application to avoid the anecdotal nightmares we had heard about. We noticed the rewrite-induced nightmares had a common theme. Each time, the company placed a big bet without unanimous support. They also tried to avoid running two frameworks at the same time. The natural consequence would be a “stop-the-world” re-write and no new product features.

Our strategy allowed us to validate the new framework early and often. Each feature would enable performance improvements sooner and inform the project timeline. As opposed to creating a new “v2” application, we maintained the entire feature set. This increased the cost compared to writing a new application but avoided a trade off between features and performance. In hindsight, we chose the correct trade off.

The strategy required two new technical features. The first was an adapter from our existing datastore to the new API. This adapter allowed us to build Luna2 frontend features without the Luna2 backend. This adapter was both slow and took months to build and productionize. But we had learned our lesson from Luna to decouple our architecture.

The second was an abstraction to connect Luna and React. Each framework had a similar set of abstractions for the DOM, Event Handler, and more. The bridge between these two framework seemed simple but was the greatest source of bugs. Luna had nuanced and complicated behavior to support ancient browsers and our features. This behavior often clashed with the assumptions of React. Creating harmony between the two frameworks was one of the hardest technical challenges.

## Costs of our strategy

### Product changes and rewrites

The first large-scale component we decided to convert was the product’s navigational[Sidebar](https://asana.com/guide/help/fundamentals/navigating-asana). We created a new Sidebar in Luna2 which had an untested new UX. Users revolted when we shipped. We broke sidebar-specific workflows that users created and depended on. We had also compromised on important functionality because the framework was immature.

After running a[5 Whys](https://wavelength.asana.com/workstyle-ask-5-whys-to-get-to-the-root-of-any-problem/), we learned an important lesson. Combining product changes with rewriting was too many variables at the same time. So we evolved our strategy. The first was that rewrite projects would no longer include product changes. The second was to focus rewrite efforts proportional to usage. This allowed our customers to enjoy the most leveraged performance wins sooner. To implement this strategy, we formed two teams. One team to convert the[List View](https://asana.com/guide/help/views/list), and the other to convert the[Details View](https://asana.com/guide/help/tasks/fields#gl-description).

### Split brain issues

Once we launched the Luna2 backend, we noticed that different parts of the UI had different data. The two frameworks now synced via PubSub instead of the Luna2/Luna datastore adapter. This meant that changes in the List View could take almost a minute to appear in the Details View. The product cost to ship was too great despite the performance gains. We initially attempted to resolve each bug one by one. This effort took time and was the exact practice we wanted to prevent with Luna. We mitigated the problem with a new solution, the DoubleWriteDatastore. This adapter kept the two frameworks in sync by applying changes to each in the correct order. This solved “split brain” bugs systematically instead of individually . We believed this would be a temporary solution for the List/Detail Views. Yet the DoubleWriteDatastore remains a core piece of infrastructure to this day, since there are many infrequently used Luna views that we haven’t rewritten yet.

![](http://img0.tuicool.com/IbqaumQ.png!web)

Before the DoubleWriteDatastore

![](http://img0.tuicool.com/2aaYR3m.png!web)

After the DoubleWriteDatastore

### Prioritizing features

Another product issue was lack of drag-and-drop support between Luna and Luna2. Users could not drag a task from the List View to the Sidebar. This missing functionality persisted until we converted our existing Sidebar. In contrast, we knew drag-and-drop from List to Details was more common. We decided to use the Luna2 Details View when showing the Luna2 List View. This balance enabled us to ship performance faster while maintaining important features.

### A/B testing assumptions

While converting incrementally, we had also incrementally degraded page load performance. Since our bundle contained product functionality in both frameworks, evaluation time increased. Luna2 also relied on code generation which exacerbated the problem. Since Luna2 relied on Luna as part of our rewrite strategy, we fetched Luna2 data last. We discovered the issue by running an A/B test.

A/B tests are a well known best practice in engineering. In this case, the A/B test taught us that there were still critical issues with the new framework. Despite in-application actions being significantly faster, the A/B test was negative \(probably attributable to the slowdown in page load speed\). Staffing a page load performance team mitigated the issues and uncovered other opportunities. After page load performance improved, we re-ran the A/B test and got positive results.

## TL;DR

### Developer efficiency

Throughout the rewrite, the Framework Team applied sound principles and listened to internal developers. The end result was a framework even more productive than Luna. We managed to keep the spirit and vision of Luna alive while delivering performance. Because the decoupled nature of Luna2, new framework functionality is easy to implement. We’ve added i18n support, automatic performance tracking, and more. Developers now prefer to do product work in Luna2 over Luna.

### Better performance

Around 85% of real user navigations are now in Luna2. This means that users are consistently feeling real performancebenefits. The framework also matured through real-world testing. This means we can now combine product and performance improvements.

In a recent survey, customers said performance was no longer their top pain point \(it had been for several years\). This is not only a huge relief and accomplishment for the Engineering Team, but more importantly a huge improvement in the lives of our customers. As Asana continues to grow fast — and as larger and larger teams and companies come to rely on Asana to track and manage their work with greater clarity and efficiency — we’ll continue to treat performance as a product in order to empower them to achieve their goals and ambitions.

Source: http://blog.asana.com/2017/08/performance-asana-app-rewrite/

