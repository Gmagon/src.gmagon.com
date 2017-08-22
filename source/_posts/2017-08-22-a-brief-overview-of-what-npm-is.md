---
title: A Brief Overview of What NPM Is.
---

## Introduction to NPM

![](http://img1.tuicool.com/ZF7vQf3.jpg!web)

[Andrew Wulf](https://unsplash.com/@andreuuuw)

I made a mistake, this week I started to write and prepare whatever I felt I needed the next article instead of investigating first like usual and ended up with something I didn’t feel was satisfactory.

Lesson re-learned: Research more before typing!

That aside, I managed to make a brief overview of what NPM is and while searching for NPM and how to publish for it I ended up stumbling on awesome articles and videos about the topic. If that would interest you keep reading.

### NPM

When you install Node.js it comes with NPM which translates to “Node Package Manager”.

A package is nothing else than a project that gives you some methods to make your life easier while developing in Node.js, for example, you want to have your`console.log`text with color, instead of doing something like`console.log('\x1b[32m', 'I am green')`you could install a package like chalk which allows you to just have to do`console.log(chalk.green('I am green'))`. Or maybe you want to handle dates, instead of figuring out all the edge cases you have packages like[moment](https://www.npmjs.com/package/moment).

So NPM ends up being an online registry hosting packages for you to download and a manager of those packages and their dependencies on your machine so that you can use them whenever needed on your project.

You can have a more in depth overview of NPM in their[documentation](https://docs.npmjs.com/getting-started/what-is-npm).

### How to use

After you install Node.js if you want to track your project package dependencies you have to create a file named`package.json`, you can do that by just doing`npm init`and answering the prompted questions.

To install a dependency just do`npm install --save [package]`what`--save`does is add it to the package \(since npm 5 that comes with Node 8 this is the default behaviour\) so if you share your code with anyone they just have to run`npm install`and every dependency for your project to run will be installed.

When dependencies are installed a node\_modules folder is created, that is where all the packages and their dependencies of your project are stored. You shouldn’t version that to Git since whenever a project is cloned the first thing you should do its run`npm install`to get those dependencies again. To remove a dependency from node\_modules that is no longer in your package run`npm prune`.

You can install a dependency globally by replacing`—-save`with`-g`but I would only recommend you do so for utility dependencies like a linter and just leave the rest of the dependencies being tracked by project so you have a better overview of what is really needed on each project.

Global dependencies can be listed by doing`npm list -g --depth=0`. And you can uninstall package by doing`npm uninstall [dependency]`. If installed globally remember to send the`-g`and the same with`—-save`for project dependencies.

“I have a dependency what now?” — Now you can either run it with`node_modules/.bin/[dependency]`and play around with it on the CLI \(terminal\) or in a JavaScript file to be run by node do`const myVarName = require('[package]')`and your variable should have access to the methods available to that package. For example, for chalk like we talked earlier

![](http://img0.tuicool.com/26bMn2m.png!web)

chalk will have the methods that you can see in their documentation like green, red and so on

![](http://img0.tuicool.com/reiQjiE.png!web)

test.js being my JavaScript filename

![](http://img2.tuicool.com/bMZvamq.png!web)

package.json example

You can also add scripts in the`package.json`so that they get used as shortcuts for frequent commands, to run a script just do`npm run [scriptName]`. To get a list of all available scripts without having to open the`package.json`just do`npm run`.

“Why the caret \(^\)?” - well the moment a package is installed and saved in the`package.json`the version of that package is also saved, if a caret is present next time you do`npm install`if that package has a new minor version \(1.x.x\) it will install that version even tough the package is saved with 1.2.0 but it will not install a major like 2.0.0. Likewise tilde \(~\) will install upwards to the patch version \(1.2.x\) but never a major or minor.

I like to remove those and just let it locked to the version of installation since a patch can be sent has an update with a major change when semantic versioning is not being followed making the project to just stop working.

Note that when calling a package in the scripts you don’t have to give the bin path you can just do`"scriptName”: [dependency] [file] [params]`, the same happens to global dependencies.

![](http://img0.tuicool.com/Q3Mr2yQ.png!web)

“tape-watch” instead of “node\_modules/.bin/tape-watch”

You can complement this introductory reading with[this](https://www.sitepoint.com/beginners-guide-node-package-manager/)awesome article.

### Finding Packages

You could search in the NPM website to get a list of existing packages or you can use[NPMS](https://npms.io/)which will not only give you the packages that are available but will also present you a score to each package which is higher if the package doesn’t have vulnerable dependencies, is popular and maintenance is frequent.

### How to publish

This is what I started writing and ended up finding there are awesome, very complete articles and videos already of the topic \(one would expected that being the case but sometimes information is fragmented or old enough that is not useful anymore, not in this case\):

* [How to create and publish your first node.Js modules](https://medium.com/@jdaudier/how-to-create-and-publish-your-first-node-js-module-444e7585b738)
* [How to publish your package on NPM](https://hackernoon.com/how-to-publish-your-package-on-npm-7fc1f5aae600)
* [JavaScript publishing to NPM](https://egghead.io/lessons/javascript-publishing-to-npm)

### NPM alternatives

Instead of using NPM to install your packages there are a couple of alternatives that can catch your eye because they boast being simpler or faster than NPM like[PNPM](https://github.com/pnpm/pnpm)and[YARN](https://github.com/yarnpkg/yarn).[Bower](https://github.com/bower/bower)is still maintained but as lost popularity over time.

### Private Registry

So that you can have your modules private you have to pay a small monthly fee to have it on NPM has private package.

There are alternatives like[Nexus Repository manager](https://www.sonatype.com/download-oss-sonatype)which you can install on your own server and install your packages from it instead of from NPM.

Article 10 of 30, part of a project for publishing an article at least once a week, from idle thoughts to tutorials. Leave a comment, follow me onDiogo Spínola and then go back to your brilliant project!



Source: [https://medium.com/@daspinola/introduction-to-npm-d62b6f6efd08](http://www.tuicool.com/articles/hit/rEnY323)

