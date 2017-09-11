---
title: Get started with Apache Spark using Python
---

Apache Spark is fast and general engine for large-scale data processing and Python is the most preferred programming language with the active developer community. In this article, I am going to show how to use Apache Spark with Python.  
![](http://ravindranaik.com/wp-content/uploads/2017/04/sPARK1-300x122.png)

### How to use Apache spark with Python

* Install Spark first. You can refer to this link to
[install spark on windows](http://ravindranaik.com/install-spark-standalone-mode-windows/)
.
* After you have installed Spark, you need to create the configuration:
> sparkConf = \(SparkConf\(\).setMaster\(“local”\).setAppName\(“Test”\)\)
* Now, we have to initialize a spark context or if there is already one running we can use that too:
> sc = SparkContext.getOrCreate\(\)
* Let’s just say, if you have a text file “command.txt”, here is how you can read the text file:
> rddRead = sc.textFile\(“C:\command.txt”\)
* If you want to look what is the value of rddRead then here is you what you should do:
> rddRead.Collect\(\)
* However if you are doing Collect operation over a large text file it is not recommended since it would overload the data with too much of text into the console, hence there is a chance that driver could run out of memory.
* If you want to pick the first element in RDD’s then here is what you should do:
> rddRead.First\(\)
* If you want to display first 5 lines of the text file or for any n lines of the text file, here is what you should do:
> rddRead.Take\(n\)  \# n represents the number of lines of text file to be displayed in console
* If you want to find out the number of lines of RDD’s then  here is the command:
> rddRead.Count\(\)

Here is how you can get started with Apache Spark using Python. Few more articles on a similar topic would follow soon.

Source: http://ravindranaik.com/using-apache-spark-python/

