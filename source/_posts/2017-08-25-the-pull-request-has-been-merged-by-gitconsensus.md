---
title: The Pull Request Has Been Merged By Gitconsensus
---

This weekend I dug into the Github API to build[gitconsensus](https://github.com/tedivm/GitConsensus), which lets communities create truly democratic projects using Reactions as a voting mechanism. Projects can define consensus rules \(minimum age of pull request, quorum for votes, threshold needed for passing\) using a yaml file in their project root. Pull Requests that meet the consensus rules will get merged, and those that do not meet them after a certain amount of time will get closed.

[![](http://blog.tedivm.com/wp-content/uploads/2017/08/gitconsensus_votes-852x1024.png)](http://blog.tedivm.com/wp-content/uploads/2017/08/gitconsensus_votes.png)

The yaml file itself is pretty straightforward-

| `# .gitconsensus.yaml# Add extra labels for the vote counts and age when mergingextra_labels:false# Do not count any vote from a user who votes for multiple optionsprevent_doubles:true# Minimum number of votersquorum:5# Required percentage of yes votes (ignoring abstentions)threshold:0.65# Only process votes by contributorscontributors_only:false# Only process votes by collaboratorscollaborators_only:false# When defined only process votes from these github userswhitelist:-alice-bob-carol# Number of days after last action (commit or opening the pull request) before issue can be mergedmergedelay:3# Number of days after last action (commit or opening the pull request) before issue is autoclosedtimeout:30` |
| :--- |


The project is available now on[pypi](https://pypi.python.org/pypi/gitconsensus)and can be installed using pip.



Source: http://blog.tedivm.com/open-source/2017/08/manage-github-pull-requests-with-gitconsensus/

