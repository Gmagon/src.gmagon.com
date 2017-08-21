---
title: ' please do not keep your database on a drive'
---

#### Problem

If you are a SQL Server developer who thinks about the time a query is going to take to perform its work, then you know the fewer IOPS, the better the execution time. As for me, I learned this hard way. Once I developed a query that ran really fast when I was developing the query. I went home and was very happy with my work and slept well. The next morning I decided to show my work to my manager and it appeared the query worked slower than earlier. I did not change anything and all seemed to be working as normal, but something screwed up my presentation and it didn't run as fast as before.

#### Solution

I found the reason very quickly by pressing Ctrl+Shift+Esc and reviewing the Performance tab of Task Manager as shown below:

![](http://img2.tuicool.com/jQRRNnU.png!web)

Figure 1 - Overall disk C workload

Figure 1 shows that my C drive was very busy, but which program is causing the IOs? To understand, I had to click on the link showing Open Resource Monitor. I then looked at the values in columns Read \(B/sec\) and Write \(B/sec\). I checked the processes which had the biggest values in these columns. Below you can see what I saw.

![](http://img0.tuicool.com/quU3Ube.png!web)

Figure 2 - Windows Update is doing its work

There were a bunch of processes with USOPrivate.  I Googled the keyword USOPrivate and the first link I found indicated the process is related to Windows Update.  So this was causing all of the disk activity.  I wanted to check to see if my development database was on the same busy disk, so I executed the following script to find the location of the database files on disk.

```
SELECT
df
.file_id

      ,
df
.type_desc

      ,
df
.name

      ,
df
.physical_name
FROM
sys
.database_files
AS
df
```

Listing 1 - Database files location

This script returned two rows as expected, which are shown below.

![](http://img2.tuicool.com/6fmQVzb.png!web)

Figure 3 - Actual database files location

So, my database was on the C disk and this is my system drive. I realized that this was why sometimes my time measurements could be different, because my drive is a shared resource. After the Windows Update completed my second presentation went well.

To confirm this problem, this tip needs some real evidence and some metrics to prove the point related to not putting your databases on the system drive.  To be honest it is quite difficult to duplicate the Windows Update process, so I decided to reproduce a workload that a potential program can perform.

## Experiments

I want to show what happens when a disk where your database lives is busy. I will do that in two experiments. The first one is obvious and I intend to demonstrate the effect that may occur at any point in time. The second one will be more close to reality and I will show how it could happen.

## Experiment 1

#### Create Database

I created a database with the following script:

```
CREATE
DATABASE
 DiskIO
    
ON

        (
        
NAME
 = DiskIO_DAT
       ,FILENAME = 
'E:\DATA\DiskIO_data.mdf'

        )
    
LOG
ON

    (
        
NAME
 = DiskIO_LOG
       ,FILENAME = 
'E:\DATA\DiskIO_log.ldf'

    );
```

Listing 2 - Database creation script

We can see that my database lives on disk E, we can confirm this with the following script:

```
USE
 DiskIO;

SELECT
 df.file_id
      ,df.type_desc
      ,df.name
      ,df.physical_name

FROM
   sys.database_files 
AS
 df
```

Listing 3 - Database location

The result is presented in the picture below.

![](http://img1.tuicool.com/Uzii2yv.png!web)

Figure 4 Database location

Now we can be sure that the experimental database lives on drive E.

#### Conditions

At work I have been working on a task named Security & Search Index \(I am going to write about this cool asynchronous solution in the future\) and I have to say that the difference I noticed, when my disk was busy, was very little i.e. 10 milliseconds slower, but this can add up over time.

As I cannot repeat the exact workload of Windows Update, I will show you a situation when my disk is really busy. Also, my T-SQL will be as simple as possible for this example.

#### Payload

First, lets create a table with 10,000,000 rows.

```
CREATE TABLE dbo.OrderAmount
    (
        OrderAmountID INT IDENTITY(
1
, 
1
) 
NOT
 NULL
            CONSTRAINT PK_Amount PRIMARY 
KEY

       ,Amount MONEY 
NOT
 NULL
    )

GO


SET
 NOCOUNT 
ON
DECLARE
 @tmp TABLE
    (
        Amount INT
    )


DECLARE
 @counter INT;

SET
 @counter = 
1
;

WHILE
 @counter 
<
1001

BEGIN
    INSERT 
INTO
 @tmp
        (
            Amount
        )
    VALUES (FLOOR(RAND() * (
1000
 - 
50
) + 
50
))
    
SET
 @counter = @counter + 
1
END
;

INSERT 
INTO
 dbo.OrderAmount
    (
        Amount
    )

SELECT
 tmp.Amount

FROM
   @tmp 
AS
 tmp
CROSS 
JOIN

           (
               
SELECT
 TOP 
10000

                    o.object_id
               
FROM
 sys.objects 
AS
 o
               CROSS 
JOIN
 sys.objects 
AS
 o2
               CROSS 
JOIN
 sys.objects 
AS
 o3
           ) 
AS
 o

GO
```

Listing 4 - OrderAmount table creation

Lets have a look at what we did.

```
SELECT
COUNT
(*) 
AS
 [RowCount] 
FROM
 dbo.OrderAmount 
AS
 oa
```

Listing 5 - Count of rows in the experimental table

And the results is:

![](http://img1.tuicool.com/Bj2I7rB.png!web)

Figure 5 - Count of experimental rows

Second, lets write a simple query which returns a SUM from the OrderAmount table.

```
SELECT
SUM
(oa.Amount) 
AS
 OrderAmountSum

FROM
   dbo.OrderAmount 
AS
 oa
```

Figure 6 - Sum of all orders

There is nothing difficult and interesting in that query except that it is going to read many pages from disk. Lets take a look how many pages it is going to read.

```
DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS


SET
STATISTICS
 IO 
ON
SELECT
SUM
(oa.Amount) 
AS
 OrderAmountSum

FROM
   dbo.OrderAmount 
AS
 oa
```

Listing 6 - Count of pages to be read from disk

The result of IO statistics are:

Table 'OrderAmount'. Scan count 9, logical reads 26275, physical reads 1, read-ahead reads 26083, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

That means the query is going to read more than 26,000 pages which is around 20 MB.

Next, lets get how long this takes to run.

```
SET
STATISTICS
 IO 
OFF
 
DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS


DECLARE
 @d DATETIME2(
7
) = SYSDATETIME()


SELECT
SUM
(oa.Amount) 
AS
 OrderAmountSum

FROM
   dbo.OrderAmount 
AS
 oa


SELECT
DATEDIFF
(MILLISECOND, @d, SYSDATETIME())
```

Listing 7 - Time statistics

As you can see, I did not use SET STATISTICS TIME. I used some SQL code to show the duration, since this is easier to read.

Below you can see the query results:

![](http://img2.tuicool.com/IRv2AjB.png!web)

Figure 7 - General time spent to return sum by all orders

As you can see SQL Server took around 1.2 seconds to return the result.

But what happens when another program is using the same disk? To get the answer, I developed a very simple program which constantly copies a 1GB file. I called it MakeDiskBusy.exe. When I run this program from my E disk I can see the following metrics.

![](http://img2.tuicool.com/nUfEjmM.png!web)

Figure 8 - Disks statistics

Figure 8 depicts that disk E is busy and the total number of bytes sent to the disk \(write\) and retrieved from the disk \(read\) over a period of one second and is equal to 114,819,168 / 1024 / 1024 = 109.5 MB/sec.

Now I want to execute my query again while my disk is busy. Here are the results from running the code in Listing 7 again.

![](http://img2.tuicool.com/6RbYJvU.png!web)

Figure 9 - Execution time while the disk is busy

The execution time is slower this time. This shows that if there are multiple IO requests for a single disk both requests will be slower. That means if the disk is serving one request, the other is waiting.

## Experiment 2

Now I want to modify the MakeDiskBusy program and make it more similar \(from my point of view\) to Windows Update. Lets say it will do something periodically. For example, 3 threads will copy a 100 MB file once every 3 seconds. It will do that for 5 minutes. While this is running, I will execute my SQL query from Listing 7 and log the execution time to a table. Once my experiment is done I will create two charts showing execution duration and disk counters from Perfmon.

Okay, my experiment is done and here are the charts.

![](http://img1.tuicool.com/AJnq2uY.png!web)

Figure 10 - Execution Duration Chart

The chart above \(Figure 10\) shows the more work the disk is doing, the longer the execution duration. The spike you can see within time period 06:00 till 11:22 is made by the MakeDiskBusy program.

Below I want to show the disk chart.

![](http://img1.tuicool.com/3EnuErN.png!web)

Figure 11 - Disk chart

The chart above \(Figure 11\) shows the more work for the disk, the less disk throughput. And therefore the less disk throughput, the longer the execution time.

## Summary

So based on my experiments, please do not keep your database on a drive that could be used by some program other than Microsoft SQL Server. Moreover, keep an eye on other system resources like CPU, Network and Memory. If you work on optimization issues be sure that your environment is not affected by some unexpected software.



Source:  [https://www.mssqltips.com/sqlservertip/5034/do-not-keep-your-sql-server-databases-on-a-system-drive/](http://www.tuicool.com/articles/hit/FNveQvZ)

