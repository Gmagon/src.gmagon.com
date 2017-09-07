---
title: Query Minio datastore with Apache Drill
---

Minio object storage server is perfect home for all your unstructured data. However, historically, one of the major pain points of unstructured data is the inability to query it easily, just like a database, or other structured data formats.
![](https://businessintelligence.com/wp-content/themes/bi/assets/images/vendor/apachedrill-logo.png)
Apache Drill is one of the leading query engines for various data backends like, Hadoop, NoSQL and Cloud Storage. In this post, we’ll see how to setup Apache Drill to query data from your Minio cloud storage instance.

#### Apache Drill

Drill can be install in [embedded mode](https://drill.apache.org/docs/installing-drill-in-embedded-mode/) or [distributed mode](https://drill.apache.org/docs/installing-drill-in-distributed-mode/). Embedded mode lets you use Drill on a single node, while distributed mode is used for clustered deployments involving more than one Drill node. We’ll use the embedded mode in this post, but configuring Drill in distributed mode to talk to Minio is not different.

To install Apache Drill download the latest version by

```
curl -o apache-drill-1.11.0.tar.gz
http://www.apache.org/dyn/closer.cgi/drill/drill-1.11.0/apache-drill-1.11.0.tar.gz
```

extract the contents using

```
tar -xvzf <.tar.gz file name>
```

change to the installation directory and run

```
bin/drill-embedded
```

You’ll get the Drill prompt in the form

$ bin/drill-embedded
OpenJDK 64-Bit Server VM warning: ignoring option MaxPermSize=512M; support was removed in 8.0
Aug 30, 2017 8:17:11 AM org.glassfish.jersey.server.ApplicationHandler initialize
INFO: Initiating Jersey application, version Jersey: 2.8 2014-04-29 01:25:26...
apache drill 1.11.0 
"the only truly happy people are children, the creative minority and drill users"
0: jdbc:drill:zk=local>

This is where you can run queries. Let us now see how to setup the Minio data source for your Apache Drill installation.

#### Connect Drill to Minio

Before you do this, you’ll need to have a Minio instance up and running on an IP accessible from the node running Drill. Once you have the Minio instance and credentials ready, navigate to the`conf`directory inside Drill installation directory and create`conf-site.xml` . Here are the contents of the`conf-site.xml`directory

```html
<?xml version="1.0" encoding="UTF-8" ?>
<!--
 Licensed to the Apache Software Foundation (ASF) under one or more
 contributor license agreements.  See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 The ASF licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->

<configuration>

    <property>
        <name>fs.s3a.access.key</name>
        <value>RSHVQ2MD3MM60XGJYG15</value>
    </property>

    <property>
        <name>fs.s3a.secret.key</name>
        <value>OSVqLLdmomirMj9mXSF2TTcBDLDtaSGJwr9chRPG</value>
    </property>

    <property>
      <name>fs.s3a.endpoint</name>
      <value>http://127.0.0.1:9000</value>
    </property>

    <property>
      <name>fs.s3a.connection.ssl.enabled</name>
      <value>false</value>
    </property>

    <property>
      <name>fs.s3a.path.style.access</name>
      <value>true</value>
    </property>
    
</configuration>
```

Change the`access.key` ,`secret.key` , and`endpoint`with relevant Minio instance values. Also, if you have TLS enabled for your Minio instance, change the field`ssl.enabled`to`true` .

Now lets setup the S3 storage plugin to talk to the Minio instance.

#### Configure S3 storage plugin

To enable the S3 plugin, point your browser to http://\[Drill-Node-IP\]:8047 and select the ‘Storage’ tab. \(you should have drill-embedded running before you can access the web console site\).

Create a new plugin named`s3-lake`and add the below `.json`contents in`configuration`window. Note that`connection:s3a://lake`refers to the Minio bucket you want to query data from. Change this appropriately to reflect your bucket name.

{
  "type": "file",
  "enabled": true,
  "connection": "s3a://lake",
  "config": null,
  "workspaces": {
    "root": {
      "location": "/",
      "writable": false,
      "defaultInputFormat": null
    },
    "tmp": {
      "location": "/tmp",
      "writable": true,
      "defaultInputFormat": null
    }
  },
  "formats": {
    "psv": {
      "type": "text",
      "extensions": [
        "tbl"
      ],
      "delimiter": "|"
    },
    "csv": {
      "type": "text",
      "extensions": [
        "csv"
      ],
      "delimiter": ","
    },
    "tsv": {
      "type": "text",
      "extensions": [
        "tsv"
      ],
      "delimiter": "\t"
    },
    "httpd": {
      "type": "httpd",
      "logFormat": "%h %t \"%r\" %>s %b \"%{Referer}i\"",
      "timestampFormat": null
    },
    "parquet": {
      "type": "parquet"
    },
    "json": {
      "type": "json",
      "extensions": [
        "json"
      ]
    },
    "avro": {
      "type": "avro"
    },
    "sequencefile": {
      "type": "sequencefile",
      "extensions": [
        "seq"
      ]
    },
    "csvh": {
      "type": "text",
      "extensions": [
        "csvh"
      ],
      "extractHeader": true,
      "delimiter": ","
    }
  }
}


Finally, click`update`and go back to the Drill prompt we saw earlier.

#### Test the setup

Setup Drill to use Minio storage as data source:

0: jdbc:drill:zk=local> USE `s3-lake`.`root`;
+-------+-------------------------------------------+
|  ok   |                  summary                  |
+-------+-------------------------------------------+
| true  | Default schema changed to [s3-lake.root]  |
+-------+-------------------------------------------+
1 row selected (1.182 seconds)
0: jdbc:drill:zk=local>

Next, download[Lake Erie Fishing Data](https://www.sciencebase.gov/catalog/item/56951c63e4b039675d005ed9)and upload to`lake`bucket in your Minio instance using[`mc`](https://github.com/minio/mc) . Now query the data in`lake`bucket using Drill:

0: jdbc:drill:zk=local> SELECT * FROM `WB_Catch.csv`;
...........
...........
["541","1312","17","9","2015","Autumn","10.9728","7.8","923.0932326","7200.127214","0.720012721","Yellow Perch","YAO","0","0","0","0","41.46292","-82.24912\r"] |
| ["541","1312","17","9","2015","Autumn","10.9728","7.8","923.0932326","7200.127214","0.720012721","Yellow Perch","YOY","5.136012696","0.020919384","7.133224933","0.029054186","41.46292","-82.24912\r"] |
+---------+
36,901 rows selected (2.32 seconds)

Source: https://blog.minio.io/query-minio-datastore-with-apache-drill-dcaf71d0cee5


