---
title: 12 Factors to Cloud Success
---

![](http://img1.tuicool.com/3AZNviN.png!web)

## 12 Factors to Cloud Success

Posted byRafael Benevides onJune 22, 2017June 19, 2017

Hey, developers! Do you care about using the best practices to apply your application to the cloud? If so then you should be using[The 12-factor App](https://12factor.net/), which is a methodology for building software-as-a-service. Today I like to talk about the 12-factor App, which I had presented to a group at the Red Hat Summit last month.

Every developer that is moving their application to the cloud will face a different environment than what they are used to, their datacenter or own premise and that’s why they should care about the 12-factor methodology. This 12 step methodology was created by Heroku, which is a cloud provider who found a common solution to most of what their customers were experiencing and decided to release these solutions as a methodology. These 12 factors are intended to solve problems related to applications running in the cloud. If there was one key takeaway from my session it was not the idea to have the audience memorize these 12 factors but to have an understanding of why each one is important.

1. **Codebase**
   – use version control, one codebase tracked in revision control for many deployments.
2. **Dependencies**
   – use a package manager and don’t commit dependencies in the codebase repository.
3. **Config**
   – store the config in Environment Variable, if you have to repackage your application, you’re doing it wrong.
4. **Backing Services**
   – a
   [deploy](https://12factor.net/codebase)
   of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party \(such as
   [Amazon RDS](http://aws.amazon.com/rds/)
   \) without any changes to the app’s code.
5. **Build, Release, Run**
   – the twelve-factor app uses strict separation between the build, release, and run stages. Every release should always have a unique release ID and releases should allow rollback.
6. **Processes**
   – execute the app as one or more stateless processes, the Twelve-factor processes are stateless and
   [share-nothing](http://en.wikipedia.org/wiki/Shared_nothing_architecture)
   .
7. **Port Binding**
   – export services via port binding, The twelve-factor app is completely self-contained.
8. **Concurrency**
   – scale out via the process model. Each process should be individually scaled, with Factor 6 \(Stateless\), it is easy to scale the services.
9. **Disposability**
   – maximize robustness with fast startup and graceful shutdown, we can achieve this with containers.
10. **Dev/Prod Parity**
    – Keep development, staging, and production as similar as possible, the twelve-factor app is designed for
    [continuous deployment](http://www.avc.com/a_vc/2011/02/continuous-deployment.html)
    by keeping the gap between development and production small.
11. **Logs**
    – treat logs as event streams, a twelve-factor app never concerns itself with routing or storage of its output stream.
12. **Admin Processes**
    – run admin/management tasks as one-off processes.

The 12-factor App methodology is technology and language agnostic but satisfied by[Containers](https://developers.redhat.com/containers/),[Microservices](https://developers.redhat.com/microservices/), and CI/CD Pipelines with a focus on[DevOps](https://developers.redhat.com/devops/).You can access more information on The 12-factor Appat[https://12factor.net/](https://12factor.net/).

**Whether you are new to Containers or have experience, downloading this**[**cheat sheet**](https://developers.redhat.com/promotions/docker-cheatsheet/)**can assist you when encountering tasks you haven’t done lately.**



Source: [https://developers.redhat.com/blog/2017/06/22/12-factors-to-cloud-success/](http://www.tuicool.com/articles/hit/qqa2yyN)

