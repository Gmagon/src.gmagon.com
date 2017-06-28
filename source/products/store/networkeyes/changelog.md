layout: app
title: Release Notes |NetworkEyes
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

## v4.0
<script>
  var releaseDate = '2017-06-27';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>


### Downloads

for macOS 64-bit OS | FileSize
------------------------------ | -------------------------
[DownloadNetworkEyes-v1.0.zip](http://www.filefactory.com/file/4ffr19r70fd3/NetworkEyes-4.0.zip)    | (~4.9MiB)
[DownloadNetworkEyes-v4.0.dmg](http://www.filefactory.com/file/3xes7lxo1sa9/NetworkEyes-4.0.dmg)    | (~3.3MiB)

---
