layout: app
title: Release Notes | XLS2csv

subtitle: Release Notes
comments: false
current: changelog
---
<script>
  function DateDiff(sDate1){
      var  aDate,  oDate1,  oDate2,  iDays;
      aDate  =  sDate1.split("-")  
      oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
      oDate2  =  new  Date()  
      iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)
      return  iDays  
  }
</script>

## v.4.22
<script>
  var releaseDate = '2017-07-13';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>

### Update

- Upgrade core API.
- Logo redesign

### Downloads

[Download XLS2csv-v4.22.zip](http://www.filefactory.com/file/2yfxt1z2zdkh/XLS2csv-4.22.zip)    | (~10.6MiB)

[Download XLS2csv-v4.22.dmg](http://www.filefactory.com/file/5fv7u561omq9/XLS2csv-4.22.dmg)    | (~8.9MiB)


---
