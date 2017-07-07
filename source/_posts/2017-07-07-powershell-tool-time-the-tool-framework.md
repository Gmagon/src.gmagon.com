---
title: 'PowerShell Tool Time: The Tool Framework'
---

Welcome to a new blog series here on SQL Server Central, Powershell Tool Time. Over the next few articles I will serve a SQL Server/Powershell blend here, helping readers make more effective use of Powershell. This series will focus on helping you build a Powershell Toolbox that you can use to ease the administration of your SQL Server environment.

This series is intended for an audience that already has some familiarity with Powershell and its syntax. If you are brand new to the language, I do not want to chase you away, but you could easily become intimidated without some knowledge of the basics. If this is your first exposure to Powershell, I highly recommend[Powershell in a Month of Lunches](http://www.amazon.com/Learn-Windows-PowerShell-Month-Lunches/dp/1617291080)along with[Powershell Courses from the Microsoft Virtual Academy](https://www.microsoftvirtualacademy.com/en-us/training-courses/getting-started-with-powershell-3-0-jump-start-8276). These two resources will give you a solid foundation for using and writing Powershell.

## How to build a tool

Before we start talking about specific tools we can build, we first need to set the table by covering how we actually build a tool. In T-SQL, you are probably used to writing scripts that eventually become stored procedures. In Powershell, we have the same approach, but instead of using stored procedures we use functions.

To define a function in Powershell, use the function keyword and encapsulate your code within { and }.

```
function
 Invoke-Message{
    Write-Host -ForegroundColor Yellow 
"Hello World!"

}
```

Run the function by calling the name you give it:

```
Invoke-
Message
```

![](http://img2.tuicool.com/QnA77fU.png!web)

With just a few lines, we can create repeatable code that is easy to call, the foundation of a tool. In addition, we can start to parameterize our functions with the**param**keyword, extending our function:

```
function
 Invoke-
Message
{
      param([
string
] $
message
)
      Write-Host -ForegroundColor Yellow $
message

  }

  Invoke-
Message
 'Hello World!'
```

![](http://img1.tuicool.com/JvqAfe.png!web)

What’s useful about Powershell is the amount of information baked directly into the language. The Powershell team has worked very hard into adding as much[self discovery into the language](http://www.mikefal.net/2015/05/05/exploring-powershell/)as possible. If you want the full detail on functions and how to write them, you can start by looking at[Get-Help about\_Functions](https://technet.microsoft.com/en-us/library/hh847829.aspx).

## Our First Tool

One thing that administrators always have to struggle with is managing disk utilization. Logging directly into servers to check free space becomes laborious. A common Powershell task that you’ll find many examples for is[getting disk usage](https://www.google.com/search?&q=get%20disk%20usage%20powershell). While many of the scripts are useful, we need to make this task as repeatable as possible, so let’s use this task for our first function:

    function
     Get-FreeSpace{

    param
    ([string] 
    $HostName
     = (
    $env:COMPUTERNAME
    ))


    Get-WmiObject
     win32_volume -computername 
    $hostname
      | `

    Where-Object
     {
    $_
    .drivetype 
    -eq
    3
    } | `

    Sort-Object
     name | `

    Format-Table
     name,@{l=
    "Size(GB)"
    ;e={(
    $_
    .capacity/
    1
    gb).ToString(
    "F2"
    )}},`
                                  @{l=
    "Free Space(GB)"
    ;e={(
    $_
    .freespace/
    1
    gb).ToString(
    "F2"
    )}},`
                                  @{l=
    "% Free"
    ;e={((
    $_
    .Freespace/
    $_
    .Capacity)*
    100
    ).ToString(
    "F2"
    )}}

    }

There’s a lot going on here, so let’s focus on a couple basic elements. The first item to notice is our function accepts a simple parameter, $HostName, which defaults to the local computer name. This allows us to run this function for a remote computer if we want to, but by default look at the machine it’s installed to. One strength of PowerShell is the ability to access remote machines, and we want to leverage that with this first function.

The second element to understand is the core function we’re using, Get-WmiObject. The[Windows Management Instrumentation](https://msdn.microsoft.com/en-us/library/aa394582%28v=vs.85%29.aspx)\(WMI\) framework is a key element of the Windows OS. With WMI, you can review many different parts of the stack. By using the [win32\_volume class](https://msdn.microsoft.com/en-us/library/aa394515%28v=vs.85%29.aspx)to poll our disk and mount point information, we can get detailed information about the disk volumes attached to the host we are querying.

The third element is that of the pipeline \(\|\). The pipeline is a fundamental concept in shell scripting languages and you can learn more about it by using[Get-Help about\_Pipelines](https://technet.microsoft.com/en-us/library/hh847902.aspx). The use here is to filter, sort, and format the output of our function, giving us a nice report on with only the elements that are important to us. There are actually three pipelines here as the output is passed from the WMI call to the Where-Object, to Sort-Object, to Format-Table. 

Running the function on my local computer is easy:

```
Get
-FreeSpace -HostName localhost
```

![](http://img0.tuicool.com/IJvuMnf.png!web)

## If I Had a Hammer

With this function, we now have the first tool for our toolbox. I use this function almost every day in my environment and it saves me a lot of time and effort. By calling this function, I can quickly analyze my disk utilization if we have a shortage. Furthermore, I can include this in other code to build out disk space reports for my team, allowing us to be more proactive in managing our environments. Building tools not only can help me, but help the folks I work with by creating consistency for managing our environments.

Thank you for reading and I hope you will return for the next article in this series. I’ve created a GitHub repository for all the code in this series. Please feel free to download and make use of this code as well as provide feedback. You can find the repository at[https://github.com/MikeFal/PowershellToolbox-SSC](https://github.com/MikeFal/PowershellToolbox-SSC).

Thanks to Steve Jones \([@way0utwest](https://twitter.com/way0utwest)\) for giving me an opportunity to share with you more about how Powershell can be used to effectively manage SQL Server.



Source: [http://www.sqlservercentral.com/articles/PowerShell/129889/](http://www.tuicool.com/articles/hit/QjIbYjm)

