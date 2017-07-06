layout: app
title: Release Notes | EasyPing

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

## v.2.1
<script>
  var releaseDate = '2017-07-06';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>


### Downloads

for macOS 64-bit OS | FileSize
------------------------------ | -------------------------
[Download EasyPing-v2.1.zip](http://www.filefactory.com/file/2rjuou913fi3/EasyPing-2.1.zip)    | (~2.3MiB)
[Download EasyPing-v2.1.dmg](http://www.filefactory.com/file/3gp8699968k7/EasyPing-2.1.dmg)    | (~2.7MiB)



---
