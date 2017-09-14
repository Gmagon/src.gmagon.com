---
title: What does container portability really mean?
---

Portability and compatibility are not the same thing. Portability is a business problem, while compatibility is a technical problem.

Containers offer the promise of portability and agility: the ability to move your applications from a developer's laptop to your internal datacenter, and out to different cloud providers with little trouble right? They offer the ability to spin up new, custom versions of yoursoftwareto quickly meet contractual deadlines which were signed last minute, or maybe even provide your customers with self service. They start faster, and are easier to move around than virtual machines. Right?

That’s the goal, but portability and compatibility are not the same thing. Portability is a business problem, while compatibility is a technical problem. Portability can only be achieved by planning compatibility in different environments. Adopting containers alone provides no guarantee of application compatibility. Why would it? Containers are really just a [fancy way of packaging applications and all their operating system dependencies](http://sdtimes.com/guest-view-containers-really-just-fancy-files-fancy-processes/).

![](https://images.idgesg.net/images/article/2017/08/life-container-megabricks-100732136-large.jpg "life container megabricks")

Scott McCarty

A standard application definition is necessary to enable build and deployment automation across environments.

What does this all mean? It means that to really achieve portability, and hence agility in your business, you need to plan. Here is a quick set of recommendations to help ensure success:

**\[**[**What is Docker? Linux containers explained**](https://www.infoworld.com/article/3204171/what-is-docker-linux-containers-explained.html#tk.ifw-infsb)**. \| Go deeper with InfoWorld’s **[**beginner’s guide to Docker**](https://www.infoworld.com/resources/16373/application-virtualization/the-beginners-guide-to-docker.html#tk.ifw-infsb)**. \]**

## 1. Standard operating environment

This needs to include [container hosts, container images, container engine, and container orchestration](http://crunchtools.com/container-portability-part-1/). All these [moving parts](http://crunchtools.com/portability-not-compatibility/) need to be aligned and standardized. All these components need to be versioned and tested together. Upgrades need to be planned together as a unit because there are a lot of interdependencies. Infrastructure parity needs to be guaranteed in every environment where containers are built or run, including developer's laptops, testing servers, andvirtual machines. It is always recommended to use the same tested and certified components everywhere.

## 2. Standard application definition

There are several technology choices when it comes to application definitions. [Docker Compose](https://docs.docker.com/compose/), [Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/), [OpenShift Templates](https://docs.openshift.org/latest/dev_guide/templates.html), or [Helm Charts](https://github.com/kubernetes/helm/blob/master/docs/charts.md). Do a bake-off and choose oneapplicationdefinition. Each has strengths and weaknesses. Don’t translate between different ones; this will only lead to problems when features in one aren’t supported or aren’t supported the same way in another.

For example, developers shouldn’t build with Docker Compose, then rebuild with Kubernetes in production. Although this is technically possible, it leads to two sets of experience, two sets of investment, two sets of bugs, two sets of learning, two sets of documentation, two sets of workarounds for things that don’t work right, and so on. It is best to choose one and then if needed, reevaluate later if you find there is something better—this technology is changing rapidly.

## 3. Data storage, configuration, and secrets

These things should be determined and provided by the environment, not embedded in the container images, nor in the application definitions.

For example, you do not want credit card information in a data store on the developer’s laptop, this should only be in production. You don’t want production database passwords embedded in container images which developers use on their laptops.

On the other hand, if you move between two cloud providers, you will need to move data and keep it synchronized. You can do this at three different levels—blocks, files, or transactions. This doesn’t change with containers, and most container platforms don’t handle this for you. Block storage replication is typically done with underlying technologies [DRBD](https://en.wikipedia.org/wiki/Distributed_Replicated_Block_Device), [SRDF](https://www.emc.com/storage/symmetrix-vmax/srdf.htm), or [Ceph](http://docs.ceph.com/docs/master/rbd/rbd/). File replication is typically handled with [Rsync](https://en.wikipedia.org/wiki/Rsync), [Gluster Geo Replication](https://gluster.readthedocs.io/en/latest/Administrator%20Guide/Geo%20Replication/), or, in low latency environments, [GFS2](https://en.wikipedia.org/wiki/GFS2) or [GPFS](https://en.wikipedia.org/wiki/IBM_General_Parallel_File_System). At the transaction layer, this needs to be part of the data store ordatabaseand is completely different with each technology—with MySQL it’s [Transaction Replication](https://dev.mysql.com/doc/refman/5.7/en/replication.html), with MongoDB it’s [Geographically Redundant Replica Sets](https://docs.mongodb.com/manual/tutorial/deploy-geographically-distributed-replica-set/), with Oracle Database there are [multiple options](http://www.orafaq.com/wiki/Third_Party_Replication_Products), with JBoss Datagrid it’s [Cross-Datacenter Replication](https://access.redhat.com/documentation/en-US/Red_Hat_JBoss_Data_Grid/6.1/html/Administration_and_Configuration_Guide/chap-Cross-Datacenter_Replication.html#About_Cross-Site_Replication).

Guaranteeing application portability requires extensive planning. Containers offer the promise of portability, but only if compatibility is thought about at the lower levels \(container image, host, engine, orchestration\), higher levels \(application definition\), and with the management \(synchronization, role based access, etc\) ofdata, configuration, and secrets.

![](https://images.idgesg.net/images/article/2017/09/life-in-the-container-building-running-applications-100735368-large.jpg "life in the container building running applications")

Scott McCarty

The application definition is shipped between environments, but configuration and data are determined by the environment

Start with an application that is straightforward. Standardize on a set of container hosts, images, an engine, an orchestrator, and an application definition. Figure out how to manage data, configuration, and secrets. When you succeed, expand to another workload. Not every workload will be easy. But when you nail these things, you will achieve agility and portability and lower the barrier to delivering applications faster, and moving them between cloud providers easier.

Source: https://www.infoworld.com/article/3223073/containers/what-does-container-portability-really-mean.html

