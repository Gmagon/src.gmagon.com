---
title: Automated Testing Ensures Your Code in our Android App
---

Automated testing is really important for ensuring your code is bug-free and works as expected, but UI tests are particularly challenging as they tend to be flaky and unreliable. For an app like Yelp, a lot of tests are needed so developers will often see tests flake. You can look at test history to try and figure out if a test failure is your fault or not - and building tools to do so has been something we’ve invested time into - but you might be wrong, and it takes time and effort to figure this out.

This leads to another problem. When broken code gets into the master branch, someone else will check out that code and tests will start failing for them for reasons that have nothing to do with the feature they were working on. This makes life harder for developers and this makes them lose faith in the idea that tests reflect the quality of the code they’ve written. When we first started addressing this problem, our master branch passed all the tests only about 60% of the time, and it had become clear this was a problem we needed to address.

The key idea behind our solution is that a flaky test is worse than no test at all. Not only does it give no useful information, but it adds unnecessary work for those who have to deal with these tests and decreases trust in the tests overall. We concluded it would be better to get rid of any flaky test altogether, at least temporarily. When we auto-suppress flaky or broken tests on the master branch, we know that whenever a test fails on a new branch, something on that branch is broken. If all our tests give meaningful results, we can enforce that no code gets into master if even one test fails, and then we have fewer and fewer tests to suppress.

Suppressing tests doesn’t have to mean that there are fewer tests, at least in the long run. We alert on every suppressed test and auto-generate a ticket for the relevant team. Our goal is for auto-suppression to lead to broken tests being fixed faster than they otherwise would. Presumably, flaky tests were intended to tell us something important about the app.

## The initial testing system

The figure below shows how our testing infrastructure worked before we implemented auto-suppression. First, a new branch would be checked out from the master branch. As you work on this branch, you’d run what we call a buildbot - a series of unit tests and UI tests - which would post the results to the relevant code review. These tests were run remotely. On merging back to master, a script runs the unit tests remotely and only merges if they succeed. UI tests weren’t run, because we didn’t want to block a merge due to flaky tests. Finally, a buildbot was periodically run on the master branch.

![](http://img2.tuicool.com/UbU3Ab3.png!web)

## The solution

## Step 1: No more flaky tests

It turns out that, in many cases, flaky tests are avoidable. Sometimes, we get failures due to issues with our testing infrastructure, and there isn’t much we can do about these \(we don’t suppress tests in this case\). In many cases, though, flakes can be avoided by writing more robust tests. Our first step was to make sure that only non-flaky tests enter the codebase.

We now auto-detect in the buildbot whenever someone commits code with a new or changed test, and then launch a job that runs the test 20 times. We picked this number semi-arbitrarily based on how often we felt we were willing to tolerate a test flaking. Normally we only count a test as a failure if it fails three times, as an anti-flake measure, but here if it fails even once it’s out. This was a good first step at preventing the growth of flaky tests and hasn’t stopped the number of tests in our codebase from steadily growing.

![](http://img1.tuicool.com/JBvIF3a.png!web)

## Step 2: Auto-suppress flaky tests

The was a big one, and a lot more controversial too. The tests are there for a reason! What if we suppress a test and break the app? The key here is to make sure that suppressing tests mean tests are dealt with faster, not slower.

We first had a bunch of our developers sit down together and figure out what team should own each test. We annotated our tests with the team that owns that test, and added a lint rule to enforce that any new tests must be given owners:

```
@Override
public boolean visitClassDeclaration(ClassDeclaration node) {

    // Currently, we're only interested in the tests in the androidTest directory.
    if (!mContext.file.getAbsolutePath().contains("androidTest")) {
        return super.visitClassDeclaration(node);
    }

    // Then, we rule out any class that already has an ownership annotation.
    for (Annotation child : node.astModifiers().astAnnotations()) {
        if (child.getDescription().equals("Ownership")) {
            return super.visitClassDeclaration(node);
        }
    }

    boolean madeReport = false;

    // Then, we check if the class contains a test.
    // To traverse the AST to find the method annotations, you go class -> class body ->
    // methods -> method annotations and other such features.
    for (Node child : node.astBody().getChildren()) {
        if (child instanceof MethodDeclaration) {
            for (Node grandchild : child.getChildren()) {

                if (grandchild.toString().contains("@Test")
                        || grandchild.toString().contains("@SmallTest")
                        || grandchild.toString().contains("@MediumTest")) {
                    mContext.report(
                            ISSUE,
                            Location.create(mContext.file),
                            ISSUE.getBriefDescription(TextFormat.TEXT));
                    madeReport = true;
                    break;
                }
            }
        }
        if (madeReport) {
            break;
        }
    }
    return super.visitClassDeclaration(node);
}
```

Now, when a test breaks, we automatically create a ticket on that team, and depending on the team’s preferences, may also send an email. An important part of this process was involving developers and managers to understand how to best integrate alerting into each team’s workflow and be sure that everyone is invested in having this system succeed.

Just in case, we also threw in some alerting in case the number of suppressed tests got too high. About 3% of tests were suppressed for other reasons before we started, so we set an alert to go off if we ever hit 5%.

Once, an infrastructure failure meant that all the tests failed and promptly got suppressed. Thanks to the alerting, we were able to immediately revert the change, and add some sanity checks to make sure that doesn’t happen again. Generally, test failures due to infrastructure problems cause all or most tests to fail, so we can avoid auto-suppressing on these failures by having a cutoff of 10 for the number of tests we’ll auto-suppress at a time. We have alerts for this case too, in case we legitimately needed to suppress this many tests.

![](http://img1.tuicool.com/vuAvy2z.png!web)

## Step 3: Be strict about what we allow in the codebase

Before, when flakes and tests broken in master were a problem, it was up to the judgement of the developer \(and code reviewers\) to determine if a broken test is their responsibility or not. It would happen then that new problems would be introduced to our master branch because someone incorrectly thought a test failure was a flake.

Now that we are dealing with flaky or broken tests automatically, we can block pushes to master without a perfect set of tests.

![](http://img0.tuicool.com/Z3iiEjB.png!web)

## Where are we now

Here’s what our master branch stability looked like before and after these changes:![](http://img0.tuicool.com/JjQ7JvA.png!web)

We have a screenshot from a tool we’ve built that tracks the results of every set of tests we run, filtered to show only tests run on the master branch. Green runs are successes, blue are in progress, and orange runs are those where some test - either a UI or unit test - failed, or the set of tests otherwise failed to run. Our master branch isn’t perfectly stable, but it’s pretty close. Our master branch tests succeeded 87% of the time in the past two weeks, and the UI tests succeeded 93% of the time. Before, the success rate for the master branch was around 60%.

Out of the thousands of tests we have, only a handful were suppressed. It turns out that most tests are good, and only a few were causing problems. And suppressed tests were dealt with promptly enough that we never ran into any problems with broken code getting into master because an important test was suppressed. Other developers have told us they are now much more confident that test failures give them meaningful information, and that dealing with failed tests is now a much more pleasant experience as a result. Overall, auto-suppressing tests has lead to a better quality master branch and happier developers.

  




Source: [https://engineeringblog.yelp.com/2017/08/auto-suppressing-tests-for-more-reliable-code-in-our-android-app.html](http://www.tuicool.com/articles/hit/FNr2Ufr)

