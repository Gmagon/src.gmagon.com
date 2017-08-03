---
title: Crick goes open source!
---

Crick is a web application split into two main components: a Go HTTP API and a JavaScript user interface. Its aim is to display[Watson](https://tailordev.github.io/Watson/)data, in other words, time tracking information related to your projects, tasks and so on. In addition, and that is certainly its best feature so far, it is possible to generate reports based on the projects, tags, and even gather data from different people \(teams!\).

We dedicated oneLe lab session to this project:

* [Le Lab \#5: Crick.io, we needed it so we built it](https://tailordev.fr/blog/2017/06/07/le-lab-5-crick-a-backend-for-watson-time-tracker/)

### Get it while it is hot!

[TailorDev/crick](https://github.com/TailorDev/crick)

At TailorDev,[we work seven effective hours a day](https://tailordev.fr/hire-us/)and Watson is very useful when it is time to send invoices. Time to time, we use the output of`watson report`to inform our clients about their projects \(cheap yet comprehensive progress report\). Nonetheless, it does not feel natural to do that and we also have to do the maths when we all work with the same client.

Crick does not change the way Watson works or how you use it but it adds a few interesting features. First, synchronizing your Watson data \(called_frames_,_projects_and_tags_\) allows to backup them. Next, the web interface allows to quickly browse your data and help you answer questions such as “how long did it take to setup CI/CD on that Java project”. Last but not least, you can create “teams”,_i.e._sets of members and projects, and create reports for them too!

We are not sure about this term “team” yet because we do not have a unique TailorDev team for instance, but rather a team per client. That way, there is no need to force Watson users to change their habits, like respecting a specific project name or any other convention. Instead, add members to a team and ask them for their own local project names \(Watson uses project names as unique identifiers\).

Example:you have a`Project X`for client`X`and two employees`A`and`B`.`A`has logged time under`project-x`and`B`under`x`. By creating a team with members`A`and`B`and project names`project-x`and`x`, you will get a report for the entire project.

You get more accurate reports that are automatically updated, and you can create as many reports as you want. Errr… I meant as many teams as you want![](http://img1.tuicool.com/v2y2If.png!web)

As mentioned previously, we designed Crick to enhance the Watson experience, but we did not want to change Watson. In an upcoming iteration, we will probably add a read-only overview report for both projects and teams. Our motivation is to be able to share these reports with our clients to keep them informed at any time. We might also display GitHub/GitLab information on these pages.

![](http://img1.tuicool.com/Z7jAFz.png!web)

Crick is released under[the MIT License](https://opensource.org/licenses/MIT). If you are willing to contribute, be sure to read[our contributing guidelines](https://github.com/TailorDev/crick/blob/master/CONTRIBUTING.md). We have a few[easy picktags](https://github.com/TailorDev/crick/issues?q=is%3Aissue+is%3Aopen+label%3A%22easy+pick%22)for newcomers, and we are willing to mentor/help!

We would love to read your thoughts, such as things that did not work as expected or feature requests. Feel free to[submit new issues](https://github.com/TailorDev/crick/issues).

Note that you can either host your own instance or safely use our public instance, which is the one we also use at TailorDev:[https://app.crick.io](https://app.crick.io/). Also, be sure to use Watson version &gt;=[1.5.2](https://github.com/TailorDev/Watson/releases/tag/1.5.2).



Source: [https://tailordev.fr/blog/2017/08/02/crick-goes-open-source/](http://www.tuicool.com/articles/hit/iMrYneQ)

