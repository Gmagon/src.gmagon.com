---
title: What would a cross-platform .NET UI Framework look like? 
---

Many years ago before WPF was the "Windows Presentation Foundation" and introduced XAML as a UI markup language for .NET, Windows, and more, there was a project codenamed "Avalon." Avalon was WPF's codename. XAML is everywhere now, and the[XAML Standard](https://github.com/Microsoft/xaml-standard)is a vocabulary specification.

[Avalonia](https://github.com/AvaloniaUI/Avalonia)is an open source project that clearly takes its inspiration from Avalon and has an unapologetic love for XAML.[Steven Kirk](https://twitter.com/grokys)\(GitHubber by day\) and[a team of nearly 50 contributors](https://github.com/AvaloniaUI/Avalonia)are asking what would a cross-platform .NET UI Framework look like. WPF without the W, if you will.

[Avalonia](https://github.com/AvaloniaUI/Avalonia)\(formerly known as Perspex\) is a multi-platform .NET UI framework. It can run on Windows, Linux, Mac OS X, iOS and Android.

YOU can try out the latest build of Avalonia available for download here:[https://ci.appveyor.com/project/AvaloniaUI/Avalonia/branch/master/artifacts](https://ci.appveyor.com/project/AvaloniaUI/Avalonia/branch/master/artifacts)and probably get the "ControlCatalog.Desktop" zip file at the bottom. It includes a complete running sample app that will let you explore the available controls.

![](http://img1.tuicool.com/aIR3mym.png!web)

It's important note that while Avalonia may smell like WPF, it's not WPF. It's not cross-platform WPF - it's[Avalonia](http://avalonia%20is%20a%20multi-platform%20windowing%20toolkit%20-%20somewhat%20like%20wpf%20-%20that%20is%20intended%20to%20be%20multi-%20platform.%20it%20supports%20xaml%2C%20lookless%20controls%20and%20a%20flexible%20styling%20system%2C%20and%20runs%20on%20windows%20using%20direct2d%20and%20other%20operating%20systems%20using%20gtk%20%26%20cairo./). Make sense?[Avalonia does styles differently than WPF](https://github.com/AvaloniaUI/Avalonia/blob/master/docs/tutorial/from-wpf.md), and actually has a[lot of subtle but significant syntax improvements](https://github.com/AvaloniaUI/Avalonia/blob/master/docs/tutorial/from-wpf.md).

Avalonia is a multi-platform windowing toolkit - somewhat like WPF - that is intended to be multi- platform. It supports XAML, lookless controls and a flexible styling system, and runs on Windows using Direct2D and other operating systems using Gtk & Cairo.

It's in an alpha state but there's an active community excited about it[and there's even a Visual Studio Extension \(VSIX\)](https://marketplace.visualstudio.com/items?itemName=AvaloniaTeam.AvaloniaforVisualStudio)to help you get File \| New Project support and create an app fast. You can check out the source for the sample apps here[https://github.com/AvaloniaUI/Avalonia/tree/master/samples](https://github.com/AvaloniaUI/Avalonia/tree/master/samples).

Just in the last few weeks you can see commits[as they explore what a Linux-based .NET Core UI app would look like](https://github.com/AvaloniaUI/Avalonia/tree/master/samples/ControlCatalog.NetCore).

You can get an idea of what can be done with a framework like this by taking a look at how someone forked the[MSBuildStructuredLog utility](https://github.com/aelij/MSBuildStructuredLog)and ported it to Avalonia - making it cross-platform -[in just hours](https://github.com/aelij/MSBuildStructuredLog/tree/avalonia). You can see a[video of the port in action on Twitter](https://twitter.com/aelij/status/901898253179998208). There is also a cross-platform REST client you can use to call your HTTP Web APIs at[https://github.com/x2bool/restofus](https://github.com/x2bool/restofus)written with Avalonia.

The project is active but also short on documentation. I'm SURE that they'd love to hear from you on Twitter or in the issues on GitHub. Perhaps you could start contributing to open source and help Avalonia out!

What do you think?

Sponsor: Get the[latest JetBrains Rider preview](http://hnsl.mn/2xgwiQ3)for .NET Core 2.0 support, Value Tracking and Call Tracking, MSTest runner, new code inspections and refactorings, and the Parallel Stacks view in debugger.

Source:  https://www.hanselman.com/blog/WhatWouldACrossplatformNETUIFrameworkLookLikeExploringAvalonia.aspx