layout: app
title: Release Notes | TryToFLAC
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
  var releaseDate = '2017-05-24';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>

### Fixed

- Fixed the multiple conversion problem.

### Update

- UI update and code rewriting.

### Downloads

for macOS 64-bit OS | FileSize
------------------------------ | -------------------------
[Download TryToFLAC-v4.0.zip](http://www.filefactory.com/file/6o92m8tyzott/TryToFLAC-4.0.zip)    | (~15.9MiB)
[Download TryToFLAC-v4.0.dmg](http://www.filefactory.com/file/3nmz0js5vn9d/TryToFLAC-4.0.dmg)    | (~15.8MiB)
[Download TryToFLAC-v4.0.pkg](http://www.filefactory.com/file/72z7dj94i6qp/TryToFLAC-4.0.pkg.zip)    | (~16.0MiB)


---
