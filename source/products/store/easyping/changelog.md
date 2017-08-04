layout: app
title: Release Notes | EasyPing

subtitle: Release Notes
comments: false
current: changelog
---
{% raw %}
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
{% endraw %}

## Ver 2.2
{% raw %}
<script>
  var releaseDate = '2017-08-04';
  document.write("Released this version <strong>" + DateDiff(releaseDate) +  "</strong> days ago.  " + releaseDate)
</script>
{% endraw %}

### `Changes`
> Please upgrade as soon as possible

1. **Upgrade the core ping engine.**
1. **Fixed some bugs.**

---

## Ver 2.1
{% raw %}
<script>
  var releaseDate = '2017-07-06';
  document.write("Released this version " + DateDiff(releaseDate) +  " days ago.  " + releaseDate)
</script>
{% endraw %}

### `Changes`
1. **Update ui **
