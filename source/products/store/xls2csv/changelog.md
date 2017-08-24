layout: app
title: XLS2csv Release Notes

subtitle: Release Notes
comments: false
current: changelog
---

## Ver 5.1

<script> GmagonUtils.$verNote('2017-08-23')</script>

<br>
### XLS to CSV
#### Revise
* Memory overflow exception
* The size of file parsing and bumper
* The problem of default CSV field separator
* Delete the character of CSV field surrended by ""

#### Add
* Support converting large XLS files

#### Modification
* Generate the name of CSV file according to the number of Sheet.

<br>
### XLSX to CSV
#### Add
* Support XLSX files (Microsoft Excel, Apple Numbers, Open Offices Excel)
* Support parsing section of data format conversion
* Support WPS: 
               1. WPS [176] Fraction expression format [#\ ?/?].  
               2. WPS [177] Common string format [0_ ]
               3. WPS [178] Date time format [yyyy/m/d;@]
               4. WPS [179] Date time format [[$-409]h:mm:ss\ AM/PM;@]
               5. WPS [180] Common format coding [[DBNum1][$-804]General]
* Support built-in format: 
               1. built-in format style of parsing date
               2. built-in format style of variable reference
               3. built-in format style of parsing fraction
               4. built-in format style of parsing scientific counting expression
               5. built-in format style of parsing percentage
               6. built-in format style of parsing time
               7. built-in format style of parsing currency        
* Support characters of Numbers:
               1. Numbers [59] 0" "
               2. Numbers [60] yyyy/m/d
               3. Numbers [61] "￥"#,##0.00;"￥-"#,##0.00
               4. Numbers [62]  h:mm:ss" "AM/PM
               5. Numbers [63] # #/#
* Support extraction of table data attributes:  
          title
          subject
          author
          keywords
          comment
          lastAuthor
          appName
          category
          manager
          company
* Support table preview and data extraction
* Support large XLSX files procession
* Generate the name of CSV file according to the number of Sheet.

<br>
### UI 
#### Modification
* Setting-adjust background of language interface
* Adjust the Hover status of all buttons
* Accurately locate output path after successfully converting XLS/XLSX files  

<br>
### Core 
Product core upgrade to Ver1.14


<br>
### Downloads


[Download XLS2csv-v5.0.dmg](http://www.filefactory.com/file/4bsfcg1ev6hv/XLS2csv-5.1.dmg
)    | (~10.5MiB)


---
