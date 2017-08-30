---
title: Hello Ubuntu Server!
---

!
[](http://img0.tuicool.com/jiUnIfz.png!web)

## Hello Ubuntu Server!

The purpose of this communication is to provide a status update and highlights for any interesting subjects from the Ubuntu Server Team. If you would like to reach the server team, you can find us at the \#ubuntu-server channel on Freenode. Alternatively, you can sign up and use the Ubuntu Server Teammailing list.

## Spotlight: cloud-init analyze

cloud-init now has an[analyze](https://cloudinit.readthedocs.io/en/latest/topics/debugging.html)feature to aid in doing boot time analysis. This tool parses the cloud-init log into formatted and sorted events to assist in determining long running steps during instance initialization. The output is similar to systemd analyze.

## cloud-init, curtin, and simplestreams

### cloud-init

* Add IPv6 support to EC2 Datasource. The datasource discovers whether IPv4 or IPv6 needs to be configured for every NIC by talking to AWS’ metadata service \(LP: \#1639030\)
* Fix url\_helper import logic to better handle missing optional package dependency python-oauthlib on RedHat/CentOS environments \(LP: \#1713760\)
* Fix two modules, landscape and puppet, that were incorrectly using six.StringIO \(LP: \#1710932, LP: \#1699282\)
* User’s can now call
cloud-init devel schema --config-file

&lt;

cloud-config.yaml

&gt;

--annotatec

for local validation of ntp and runcmd cloud-config options. For more see
cloud-init devel schema --doc

* Create initial draft of anSRU exception
* Mirroring Launchpad daily build results in Jenkins

### simplestreams

* Added glance sync support for keystone v3 auth

### curtin

* Mirroring Launchpad daily build results in Jenkins
* Added vmtest log size reporting to Jenkins

## Bug Work and Triage

* 193 bugs reviewed, backlog reduced by 4, 283 in the
[backlog](https://bugs.launchpad.net/~ubuntu-server/+subscribedbugs)
* [Notes on daily bug triage](https://wiki.ubuntu.com/ServerTeam/KnowledgeBase#Bug_Triage)

## IRC Meeting

* [IRC Log](https://ubottu.com/meetingology/logs/ubuntu-meeting/2017/ubuntu-meeting.2017-08-29-16.00.html)
* [Agenda and notes](https://wiki.ubuntu.com/ServerTeam/Meeting)

## Ubuntu Server Packages

Below is a summary of uploads to the development and supported releases. Current status of the Debian to Ubuntu merges is tracked on theMerge-o-Matic page. For a full list of recent merges with change logs please see the Ubuntu Serverreport.

### Uploads to the Development Release \(Artful\)

```
docker.io, 1.13.1-0ubuntu1, mwhudson
dpdk, 17.05.1-4, None
ipsec-tools, 1:0.8.2+20140711-10, None
ipxe, 1.0.0+git-20161027.b991c67-1ubuntu1, nacc
irqbalance, 1.1.0-2.3ubuntu1, nacc
libpam-ldap, 186-4ubuntu1, nacc
lxc, 2.0.8-0ubuntu6, stgraber
lxd, 2.17-0ubuntu2, stgraber
lxd, 2.17-0ubuntu1, stgraber
maas, 2.3.0~alpha2-6194-g7fb23b0-0ubuntu1, andreserl
net-snmp, 5.7.3+dfsg-1.7ubuntu1, nacc
nspr, 2:4.16-1ubuntu1, mdeslaur
nss, 2:3.32-1ubuntu2, xnox
nss, 2:3.32-1ubuntu1, mdeslaur
openssh, 1:7.5p1-8, None
openssh, 1:7.5p1-7ubuntu2, xnox
openssh, 1:7.5p1-7ubuntu1, xnox
openssh, 1:7.5p1-6ubuntu1, xnox
samba, 2:4.6.7+dfsg-1ubuntu1, nacc
squid3, 3.5.23-5ubuntu1, nacc
ubuntu-advantage-tools, 8, nacc
Total: 21
```

### Uploads to Supported Releases \(Trusty, Xenial, Yakkety, Zesty\)

```
backuppc, xenial, 3.3.1-2ubuntu3.3, brian-murray
cloud-init, zesty, 0.7.9-233-ge586fe35-0ubuntu1~17.04.1, smoser
cloud-init, xenial, 0.7.9-233-ge586fe35-0ubuntu1~16.04.1, smoser
libvirt, zesty, 2.5.0-3ubuntu5.5, paelzer
libvirt, xenial, 1.3.1-1ubuntu10.14, paelzer
libvirt, xenial, 1.3.1-1ubuntu10.13, paelzer
libvirt, trusty, 1.2.2-0ubuntu13.1.21, paelzer
lxd, zesty, 2.17-0ubuntu2~ubuntu17.04.1, stgraber
lxd, xenial, 2.17-0ubuntu2~ubuntu16.04.1, stgraber
lxd, xenial, 2.0.10-0ubuntu1~16.04.2, stgraber
nut, zesty, 2.7.4-5ubuntu2.1, nacc
nut, trusty, 2.7.1-1ubuntu1.1, nacc
nut, xenial, 2.7.2-4ubuntu1.1, nacc
postfix, zesty, 3.1.4-4ubuntu1, vorlon
postfix, trusty, 2.11.0-1ubuntu1.2, nacc
samba, trusty, 2:4.3.11+dfsg-0ubuntu0.14.04.11, slashd
samba, xenial, 2:4.3.11+dfsg-0ubuntu0.16.04.10, slashd
samba, zesty, 2:4.5.8+dfsg-0ubuntu0.17.04.6, slashd
sssd, xenial, 1.13.4-1ubuntu1.7, paelzer
Total: 19
```

## Contact the Ubuntu Server team

* Chat on \#ubuntu-server on Freenode
* Email the
[ubuntu-server mailing list](https://lists.ubuntu.com/mailman/listinfo/ubuntu-server)

### About the author

David is the engineering manager of Ubuntu Server. He is focused on making sure Ubuntu Server is a world-class platform for delivery of enterprise and cloud-native workloads.

[More articles by David](https://insights.ubuntu.com/author/davidpbritton/)



Source:  https://insights.ubuntu.com/2017/08/29/ubuntu-server-development-summary-29-aug-2017/