---
title: Highlights of Canonical Distribution of Kubernetes
---

![](http://img1.tuicool.com/a2iUFbf.png!web)

This article originally appeared on[Tim Van Steenburgh’s blog](https://medium.com/@tvansteenburgh/canonical-distribution-of-kubernetes-development-summary-2017-34-760b51846b1f)

August 18th concluded our most recent development sprint on the[Canonical Distribution of Kubernetes](https://www.ubuntu.com/containers/kubernetes)\(CDK\). Here are some highlights:

* CI failures fixed. We spent some time fixing a handful of CI failures that had crept in recently. We’re back to green now and looking good for a patch release of CDK in the near future.
* [Canal charm](https://github.com/juju-solutions/layer-canal)
   implemented. Canal provides an alternative to Flannel for those who need network policy support on CDK. We have more testing to do on Canal in this and the next sprint, but for those wishing to kick the tires, you can take Canal for a test drive with: 
  `juju deploy cs:~cynerva/canonical-kubernetes-canal-0`
   \(NB: doesn’t work on LXD\). In the current sprint we’ll be adding the Canal charm and bundle to CI for more thorough and regular testing.
* RBAC support. We updated our default cluster add-ons and microbot example to work with RBAC, completing our RBAC proof-of-concept work. In the current sprint we’re getting CI updated with more tests for RBAC.
* s390x support. We looked into getting upstream s390x builds for 
  [heapster](https://github.com/kubernetes/heapster/issues/1759)
   \(success!\) and 
  [ingress](https://github.com/kubernetes/ingress/issues/1108)
   \(no success\). For ingress we hit an impasse with a QEMU bug, so in the interest of continuing to make forward progress, we plan to build this image on actual s390x hardware for now. In the current sprint we’ll be building that image and then running e2e tests on s390x to see where we’re at!

Finally, in case you missed it, be sure to check out[the new features coming to conjure-up](https://insights.ubuntu.com/2017/08/19/conjure-up-dev-summary-aws-native-integration-vsphere-3-and-addons/)— a tool for deploying CDK on any public cloud, private cloud, or developer laptop. The latest edge build of conjure-up includes automatic native-cloud integration for CDK on AWS, and the introduction of Add-ons, which can deploy software \(like Deis, for example\) onto your new Kubernetes cluster in a repeatable and automated way.



Source: [https://insights.ubuntu.com/2017/08/24/canonical-distribution-of-kubernetes-development-summary-august-24/](http://www.tuicool.com/articles/hit/uIbU3ui)

