---
title: Introducing S3-style file sharing for Sia through the new Minio integration
---

![](http://img0.tuicool.com/u63ayqB.png!web)

We launchedSia Bounties two weeks ago with a bounty for a[Sia + Minio integration](https://github.com/NebulousLabs/Sia/issues/2155), and received an overwhelmingly positive response! David Gore \(user[dvstate](https://github.com/dvstate)\) quickly submitted a high-quality integration only two days later, and has been working diligently with several testers from the Sia community to refine and improve the Minio integration. Today we are thrilled to announce that the integration is ready for wider use, and it brings some very exciting new file sharing features to Sia!

[Minio](https://minio.io/)is a distributed object storage server, which allows users to connect to any data source \(like S3, Azure, GCP\), create buckets for file storage, and then share URLs to the files. It also provides an external S3-compatible API.

With the Sia integration, Minio users can now store their files on the Sia network for a fraction of Amazon’s price.

[dvstate/minio_minio - Minio is an open source object storage server compatible with Amazon S3 APIs_github.com](https://github.com/dvstate/minio)

Here’s how the integration works. First, on Sia, the user deposits Siacoin and creates an allowance for storage on the network. Then, on Minio server, the user launches the Sia gateway, creates buckets, and starts uploading files.

Uploaded files are first stored locally on the Minio server, and then uploaded to Sia. The upload is marked as complete once the file reaches 1x redundancy on Sia. From there, Sia will naturally boost the redundancy to 3x, storing the data across 30 hosts all over the world.

When downloading data, the files are first downloaded from the Sia network to the Minio server, and then downloaded from the server to the user. Minio server caches the file for quick downloading. As the cache fills up, it will automatically delete the oldest files. This ensures that popular, frequently downloaded files will be fast, while less frequently accessed files will have a slight delay.

Here’s a great example. We created a public bucket in a Minio server \(thanks[Luxor](http://luxor.tech/)for hosting!\) called “public” and added some files. You can view through the Minio web interface:[http://minio.luxor.tech/minio/public/](http://minio.luxor.tech/minio/public/)or you can download or embed the files directly from a URL. Everything is being stored on the Sia backend:

Obelisk Chip:[http://minio.luxor.tech/public/obelisk\_chip.png](http://minio.luxor.tech/public/obelisk_chip.png)**  
**[http://minio.luxor.tech/public/Sia\_Minio\_Bounty\_03.png](http://minio.luxor.tech/public/Sia_Minio_Bounty_03.png)

David’s Talk:[http://minio.luxor.tech/public/David\_Sia\_Presentation.mp4](http://minio.luxor.tech/public/David_Sia_Presentation.mp4)

Sia v1.3.0:[http://minio.luxor.tech/public/Sia 1.3.0 all platforms.zip](http://minio.luxor.tech/public/Sia%201.3.0%20all%20platforms.zip)

Sia V1.3.0 UI:[http://minio.luxor.tech/public/SIa-UI 1.3.0 all platforms.zip](http://minio.luxor.tech/public/SIa-UI%201.3.0%20all%20platforms.zip)

This means that, with the Sia + Minio integration, users can start using Sia for file sharing today!

We are thrilled with the success of this first bounty, and are looking forward to launching the next bounty in a couple weeks. Congratulations to David Gore for winning the 300,000 SC reward!

For questions related to the Sia + Minio integration, please join the \#bounties channel on ourSlack or post issues to David Gore’s Github repository at[https://github.com/dvstate/minio](https://github.com/dvstate/minio). More detailed instructions for getting set up are available on the repo.



Source: [https://blog.sia.tech/introducing-s3-style-file-sharing-for-sia-through-the-new-minio-integration-bb880af2366a?gi=7543cdabb0ac](http://www.tuicool.com/articles/hit/Vvai6jE)

