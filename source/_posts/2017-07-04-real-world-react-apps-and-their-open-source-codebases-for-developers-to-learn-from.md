---
title: >-
  Real World React apps and their open source codebases for developers to learn
  from
---

## Real World React

Real World React apps and their open source codebases for developers to learn from

Learn from React apps written by experienced developers.

You'll find the source code for the Real World React apps in the[`apps/`](https://github.com/jeromedalbert/real-world-react/blob/master/apps)subdirectory.

Thank you to every developer who has worked on a project this repo links to, your work is helping developers learn React.

## How to install on your computer

```
# Clone this git repo:
git
 clone git
@github
.com:jeromedalbert/real-world-react.git

cd real-world-react/


# The apps are linked to as git submodules.
# This will take some time...

git submodule update --init
```

## Information for Contributors

#### Is your app the right fit?

* A real world app should ideally be publicly accessible and used by real people in a production environment. As such, boilerplate, starter kits, libraries, and small demo/example projects are not really a good fit.
* Ideally most of the code should be frontend-oriented, in order to focus on React. Small backends may be OK, but should constitute the minority of the codebase.

That being said, don't hesitate to submit a pull request if you meet the criteria!

#### How to add a Real World App

Given a GitHub repo for an app`githubuser/foo`:

```
# Inside the project root:
git
 submodule add -b master git
@github
.com:githubuser/foo.git apps/foo
```

#### Updating the apps submodules to latest

The apps in`apps/`are git submodules. Git submodules are locked to a revision and don't stay in sync with the latest revision.

To update the revisions, run:

```
# This will take some time:
git
 submodule foreach git pull origin master
```

## Contributors

* Jerome Dalbert
  [http://jeromedalbert.com](http://jeromedalbert.com/)
* Contributions are welcome, fork the GitHub repo, make your changes, then submit your pull request! Reach out if you'd like some help.



Source: [https://github.com/jeromedalbert/real-world-react](http://www.tuicool.com/articles/hit/3QjiYbZ)



