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

## v3.19.0
<script>
  var releaseDate = '2017-06-28';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>


### Downloads

for macOS 64-bit OS | FileSize
------------------------------ | -------------------------
[DownloadNetworkEyes-v3.19.zip](http://www.filefactory.com/file/1bhcm6k6nbkh/NetworkEyes-3.19.0.zip)    | (~431.9KB)
[DownloadNetworkEyes-v3.19.dmg](http://www.filefactory.com/file/4gqn5uagoqkl/NetworkEyes-3.19.0.dmg)    | (~583.6KB)

---
