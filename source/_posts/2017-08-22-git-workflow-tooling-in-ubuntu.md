---
title: Git Workflow Tooling In Ubuntu
---

![](http://img0.tuicool.com/V7zaAnn.png!web)

This is the third post in our series on our git workflow tooling in Ubuntu. There is an[index of all our planned posts in the first post](https://insights.ubuntu.com/2017/07/24/developing-ubuntu-using-git/). As mentioned there, it is important to keep in mind that [the tooling and implementation are still highly experimental](https://insights.ubuntu.com/2017/07/24/developing-ubuntu-using-git/).

Nish introduced our imported repositories[using the `git ubuntu clone` wrapper](https://insights.ubuntu.com/?p=78921/), as well as using git directly.

I’d like to go into a little more detail about what we’re actually importing.

Automatic imports watch for new source publications in Launchpad. When they occur, the importer will push new commits and tags to match those publications and move up branch pointers automatically. All branches maintained by the importer are fast-forwarding. A temporary exception to this is during our experimental stage, before we release a 1.0. Until then, we may re-import packages as we work on the importer.

Our importer maintains one repository per source package in[lp:~usd-import-team](https://code.launchpad.net/~usd-import-team/+git)for now. Eventually we expect to make these available under an alias of the form `lp:ubuntu/+source/<package>`.

The imported trees correctly reflect the ancestry of individual source packages. This includes both Debian and Ubuntu history, with Ubuntu history correctly parented from the appropriate points in Debian’s history.

There is a branch corresponding to each Debian and Ubuntu series \(eg.`sid`, `stretch`, `xenial`, `artful`\), and in the case of Ubuntu, pocket \(eg. `trusty-updates`, `xenial-security`, `artful-proposed`\). We’ll cover details on how exactly these work, and the logic behind their design, in future posts.

## Single source of truth

A goal of the importer is to reflect the single source of truth, which we define as Launchpad’s source publication history. Therefore, the only source of the imported tags and branches must come via the importer and not directly from uploaders. Only the importer can push to the imported repositories. We do have a mechanism to preserve “rich history” provided by git committers that in any other project they’d be able to push directly; more on this in a future post.

Note that this methodology means that upstream’s commit graphs are typically not made available by the importer. You won’t find individual upstream commits by looking in our imported respository against a particular package. We may decide to make this possible in the future by relying on the “rich history” import mechanism combined with the use of our parenting invariant. More on this in a future post.

We’re trying hard to make sure that there is no case where a source package upload can cause the importer to fail. We’re treating any failure to import a source package as a bug in our importer. The importer should be able to import anything that was ever uploaded to Debian or Ubuntu.

## Available branches

As Nish mentioned, there are two main types of branches:

1. Devel branches: the branches on which to start development.
2. Pocket branches: understanding the current state of the archive.

There are also “applied” versions of these branches, which provide quilt patches already applied.

### The “devel” branches

Ubuntu developers are used to using`pull-lp-source`to grab the latest version of a package source on which to base development. We want to make `git clone`work instead.

What is the correct version on which to base development? In Ubuntu, this can vary depending on the exact publication state. Usually you want the highest version published in the development release, or the highest version published in a particular series for anSRU. For this purpose, the git importer maintains `devel`branches. For the development release, this is just called `ubuntu/devel`. For a stable release, it is `ubuntu/<codename>-devel`; for example: `ubuntu/xenial-devel`.

This is intended to save developers the effort of figuring out which pocket to use \(between the release pocket,`proposed`, `updates`and `security`\) and saves scripts from having to figure it out themselves.

One exception to this is in the rare case that a version in the proposed pocket has been discarded, such as a failed SRU. The importer only follows new version publications and does not follow deletions. In this case you may wish to start directly from a pocket branch \(described below\). Alternatively, before you begin you could start from the devel branch and use`git revert`to add a commit reversing the published change in line with the deletion. The infrastructure doesn’t care which method you choose.

### Pocket branches

A different use case is to look at the git branches to understand what the archive looks like today, or how it looked in the past.

#### Ubuntu’s pockets

First let’s review what Ubuntu pockets actually are.

In Ubuntu, the archive for a particular release \(“series”\) is divided up into a number of “pockets”, which correspond to the entries in your`sources.list`file:

1. The release pocket. This pocket has no specific name. During development, the release pocket is where package eventually land. Upon release, this pocket is frozen and never changes again.
2. The “proposed” pocket. This pocket is used for two different purposes depending on whether the series is in development or has been released. During development, this is the staging area in which packages are built, tested and checked for installability before they land. When all tests pass, packages are moved into the release pocket in a process called proposed migration. After release, the proposed pocket is used for a different purpose: manual user verification of proposed stable release updates through the 
   [SRU verification process](https://wiki.ubuntu.com/StableReleaseUpdates#Verification)
   . When a package passes SRU verification, the package is moved into the updates pocket, rather than the release pocket is as the case during development.
3. The “updates” pocket. Only used for stable releases, this pocket is used to issue recommended updates to users during the lifetime of a stable release.
4. The “security” pocket. Only used for stable releases, this pocket is used to issue security updates to users during the lifetime of a stable release. Updates to the security pocket are always also copied into the updates pocket.

The name of a pocket is in the form`<series>-<type>`, such as `xenial-security`and `artful-updates`. As an exception, the release pocket is the series with no suffix, such as `trusty`.

#### Importing pockets into git

The importer maintains a branch for each pocket, in the form`ubuntu/<pocket name>`, such as `ubuntu/trusty`\(the Trusty release pocket\), `ubuntu/xenial-security`, `ubuntu/artful-proposed`and so on.

### Combining pocket branches: the devel branches

To support the archeology use case, the importer must maintain these pocket branches. However, for the ongoing development use case, it’s far more convenient for developers to use our “devel branches”.

We do this by making use of our “parenting invariant”, which we’ll describe in more detail in a future post. For now, it’s sufficient to understand that the devel branches are the points at which you should start development, and the pocket branches can be used to examine the current state of the various pockets in the Ubuntu archive.

### Applied branches

For our drive-by contributor use case, it would be nice if these drive-by contributors didn’t have to understand quilt. It’s reasonable to expect that, straight after running`git clone`from Ubuntu and selecting an appropriate branch, the tree that appears is exactly the source used to build the corresponding Ubuntu package. For drive-by contributors unfamiliar with Debian packaging, this means that quilt patches should appear applied. Our “applied” branches and tags provide this function.

The non-applied branches are the normative imports from Debian and Ubuntu developer uploads. They are intended to represent the source package exactly and without any derived components. This means that quilt patches appear in`debian/patches/`as normal, but are not applied.

From one of these import commits, all quilt patches \(if any\) are applied one by one. Each application results in a separate git commit. A final commit with an identical tree is added for branch fast-forwarding purposes, and these commits form the line of the “applied” branch.

Consequently, you can switch to an “applied” branch, or corresponding tag, and you’ll see the state of the Ubuntu source package with all patches applied and as if quilt doesn’t exist. Drive-by contributors can then file pull requests against such a branch \(eg.`applied/ubuntu/devel`\) and bots and sponsors will be able to understand exactly what is being requested.

It will often be necessary to pull out requested changes into a separate quilt patch, add[dep3](http://dep.debian.net/deps/dep3/)headers, and possibly squash the requested change into an existing quilt patch, before uploading. We hope to automate some of this in the future, but for now this is left as a task for sponsors who accept git workflow upload requests. Contributors can either submit pull requests against the applied branches this way, or fold up into quilt patches themselves and submit pull requests against the non-applied branches instead.

In the future, it may be desirable for all Ubuntu developers to forget quilt and live entirely inside git-based patchsets. For the time being, we want to support both traditional and git-based workflows. So both applied and non-applied branches are maintained by the importer.

It is a matter of debate as to whether the non-applied or applied branches should appear by default. We are open to further discussion on this.

## Available tags

The first time the importer imports a new version of a source package, it tags it using an “import tag”, which is of the form`import/<version>`. The patches-applied equivalent is derived, and the result is tagged in the form`applied/<version>`.

Pocket copies, such as from Debian into Ubuntu via autosync, are not tagged; the pocket branches are moved forward with new commits \(with identical trees\) as necessary.

Since not all valid package version strings are valid git tag names, the tag names are escaped using the same rules as specified in[dep14](http://dep.debian.net/deps/dep14/), Debian’s recommendation on git repository layouts.

We use tags of the form`upload/<version>`to supply rich history for adoption into the imported commit graph. This cannot be pushed directly; more on this in a future post.

To support the preservation of orig tarballs using pristine tar, the importer also tags`upstream/<version>`.

## pristine-tar and the dsc branches

So that the git repositories contain all the information needed to reconstruct an imported source package, the importer also stores the orig tarballs using pristine-tar and the signed dsc file in separate branches. Orig tarballs are automatically extracted on package build as needed by the`git ubuntu build`wrapper. This means that `git ubuntu clone`followed by `git ubuntu build`should Just Work.

Orig tarballs between Debian and Ubuntu may vary in exceptional cases, so the importer keeps these properly namespaced in`debian/pristine-tar`and `ubuntu/pristine-tar`branches to avoid collisions, and likewise for the dsc files `debian/dsc`and `ubuntu/dsc`. pristine-tar doesn’t currently support multiple branches; it assumes a single branch of `pristine-tar`. Our `git ubuntu build`wrapper works around this for now. In the future I’d like for us to drive getting parameterised branch name support into `pristine-tar`upstream to support our use case.

## Conclusion

In order to provide a full understanding of what we’re doing to those developers interested in all the detail, I’ve tried to cover all the git reference objects presented by our importer in this post today.

In our next post, Nish will continue discussing the`git ubuntu`tooling by introducing `git ubuntu tag`.



Source: [https://insights.ubuntu.com/2017/08/21/git-ubuntu-more-on-the-imported-repo](http://www.tuicool.com/articles/hit/6326z2b)

