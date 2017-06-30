layout: app
title: Release Notes | ColorPicker2

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

## v.4.18.0
<script>
  var releaseDate = '2017-06-30';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>


### Downloads

for macOS 64-bit OS | FileSize
------------------------------ | -------------------------
[Download ColorPicker2-v4.18..0.zip](http://www.filefactory.com/file/73v8d3ptwolf/ColorPicker2-4.18.0.zip)    | (~698.9KB)
[Download ColorPicker2-v4.18.0.dmg](http://www.filefactory.com/file/6fs9gdfx7pm7/ColorPicker2-4.18.0.dmg)    | (~1.1MiB)


---
