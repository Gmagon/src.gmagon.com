---
title: Learn how to use Carthage
---

_Update note:_This tutorial was updated to iOS 11, Xcode 9, and Swift 4 by Lorenzo Boaro. The original tutorial was written by James Frost.

![](http://img0.tuicool.com/BJfEbqf.png!web)

Learn how to use Carthage to manage your project’s dependencies.

Two great things about iOS development are the fantastic community, and the wide range of available third party libraries.

If you’ve coded on the platform for a while, chances are you’ve used at least one of these libraries. Whether it’s[Alamofire](https://github.com/Alamofire/Alamofire),[Locksmith](https://github.com/matthewpalmer/Locksmith), or[Kingfisher](https://github.com/onevcat/Kingfisher), you already know the value of making use of someone else’s code because you’re not fond of reinventing the wheel.

Then there’s[CocoaPods](https://cocoapods.org/). If you’re not acquainted with this lovely tool, it’s a popular dependency manager that streamlines the process of integrating these sorts of libraries into your project.

It’s widely used in the iOS community, and even[Google uses it](https://www.youtube.com/watch?v=iEAjvNRdZa0)to distribute their various iOS SDKs.

Alongside Swift 3.0, Apple has released its own tool called[Swift Package Manager](https://swift.org/package-manager/)to share and distribute packages in Swift 3.0 and above. Apple defines it as:

The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

While CocoaPods and Swift Package Manager are awesome, there are other options.[Carthage](https://github.com/Carthage/Carthage)is one such alternative; it’s aruthlessly simpledependency manager for macOS and iOS, created by a group of developers from Github.

It was the first dependency manager to work with Swift; in fact, Carthage itself iswrittenin Swift! It exclusively uses dynamic frameworks instead of static libraries – this is the only way to distribute Swift binaries that are supported by iOS 8 and up.

In this Carthage tutorial, you’ll learn and do the following:

* Why and when to use a dependency manager, and what makes Carthage different
* How to install Carthage
* How to declare dependencies, installing and integrating them within a project
* How to upgrade your dependencies to different versions
* Build an app that provides definitions for search terms using the DuckDuckGo API

_Note_: This Carthage tutorial assumes that you have basic familiarity with iOS and Swift, that you’re familiar with Xcode and working with the command line.

If you need to brush up on any of these topics, check out some of our otherwritten orvideo tutorials on this site.

## Getting Started

First of all,[download the starter project](https://koenig-media.raywenderlich.com/uploads/2017/07/DuckDuckDefine-starter.zip)for this Carthage tutorial.

It includes the basic skeleton of_DuckDuckDefine_, a simple tool to look up definitions and images using the[DuckDuckGo](http://www.duckduckgo.com/)API. There’s just one problem: It doesn’t actually perform any searches yet!

Open_DuckDuckDefine.xcodeproj_in Xcode and have a quick look around to familiarize yourself. Note the two view controllers:`SearchViewController`provides a search bar for the user to perform a search, and`DefinitionViewController`displays the definition of a search term.

![](http://img0.tuicool.com/mmQzI37.png!web)

The brains of the operation are in_DuckDuckGo.swift_— or at least they will be by the time you’re finished! At the moment,`performSearch(for:completion:)`is a lazy, good-for-nothing block of code.

To make it perform a search and display the results, you’ll need to do two things:

* Make a query using the DuckDuckGo API
* Show an image for the retrieved word

There are a number of open source libraries that can help with these two tasks.[Alamofire](https://github.com/Alamofire/Alamofire)is a great Swift library which simplifies making web requests, and[AlamofireImage](https://github.com/Alamofire/AlamofireImage)makes dealing with images in Swift a more pleasant experience.

And guess what? You’ll use Carthage to add both of these dependencies to your project.

## Dependency Management

To add Alamofire and AlamofireImage to your project, you could of course just visit their respective Github pages, download a zip file of the source and drop them into your project. So why bother with a tool like Carthage?

Dependency managers perform a number of handy functions:

* They simplify and standardize the process of fetching third party code and incorporating it into your project. Without such a tool, this might be done by manually copying source code files, dropping in precompiled binaries, or using a mechanism like Git submodules.
* They make it easier to update third party libraries in the future. Imagine having to visit each dependency’s GitHub page, download the source, and place it into your project every time there’s an update. Why would you do that to yourself?
* They pick out appropriate and compatible versions of each dependency you use. For instance, if you’re manually adding dependencies, things can get tricky when they depend on one another or share another dependency.

![](http://img0.tuicool.com/n2MzIfR.png!web)

Most dependency managers will construct a[dependency graph](https://en.wikipedia.org/wiki/Dependency_graph)of your project’s dependencies, and each of their sub-dependencies, and then determine the best version of each to use.

You could probably do the same manually, but at what cost? Your sanity?

### Carthage vs CocoaPods

So how exactly is Carthage different from CocoaPods, and why would you use anything besides the most popular dependency manager for iOS?

Carthage’s developers felt that whilst CocoaPods is generallyeasyto use,simpleit is not. The philosophy behind Carthage is that this tool should beruthlessly simple.

CocoaPods adds complexity to both the app development and the library distribution processes:

* Libraries must create, update and host Podspec files \(or app developers must write their own if one doesn’t exist for a library that they wish to use\).
* When adding “pods” to a project, CocoaPods creates a new Xcode project with a target for each individual pod, as well as a containing workspace. Then you have to use the workspace and trust that the CocoaPods project works correctly. Talk about a lot of extra build settings to maintain.
* CocoaPods’ Podspecs repository is centralized, which could be problematic if for some reason it were to disappear or become inaccessible.

![](http://img2.tuicool.com/quqeiuN.png!web)

The Carthage project’s aim is to provide a_simpler_tool than CocoaPods; one that’s easier to understand, easier to maintain and more flexible.

It achieves this in a number of ways:

* Carthage doesn’t modify your Xcode project or force you to use a workspace.
* There’s no need for Podspecs or a centralized repository for library authors to submit their pods to. If your project can be built as a framework, it can be used with Carthage. It leverages existing information straight from Git and Xcode.
* Carthage doesn’t really do anything magic; you’re always in control. You manually add dependencies to your Xcode project and Carthage fetches and builds them.

_Note_: Carthage uses dynamic frameworks to achieve its simplicity. This means your project must support iOS 8 or later.

### Carthage vs Swift Package Manager

How about the differences between Carthage and Swift Package Manager?

The main focus of the Swift Package Manager is to share Swift code in a developer-friendly way. Carthage’s focus is to share dynamic frameworks. Dynamic frameworks are a superset of Swift packages since they may contain Swift code, Objective-C code, non-code assets \(e.g. images\) or any combinations of the three.

_Note_: A package is a collection of Swift source files plus a manifest file.

The manifest file defines the package’s name and its content.

## Installing Carthage

Now that you’ve got some background on things, that’s enough talk. It’s time to learn for yourself howruthlessly simpleCarthage is!

At the core of Carthage is a command line tool that assists with fetching and building dependencies.

There are two ways to install it: downloading and running a_.pkg_installer for the latest release, or using the[Homebrew](http://brew.sh/)package manager. In the same way that Carthage helps install packages for your Cocoa development, Homebrew helps install useful Unix tools for MacOS.

For the purposes of this Carthage tutorial, you’ll use the_.pkg_installer. Download the latest release of Carthage from the list[here](https://github.com/Carthage/Carthage/releases). Select the most recent build, then under_Downloads_select_Carthage.pkg_.

Double-click_Carthage.pkg_to run the installer. Click_Continue_, select a location to install to, click_Continue_again, and finally click_Install_.

_Note_: When you attempt to run the installer, you may see a message stating “_Carthage.pkg_can’t be opened because it is from an unidentified developer.” If so,_Control-click_the installer and choose_Open_from the context menu.

And you’re done! To check that Carthage installed correctly, open_Terminal_and run the following command:

```
carthage version
```

If all has gone to plan, you’ll see the version number of Carthage that was installed.

_Note_: At the time of writing, the current version of Carthage was 0.23.

Next, you need to tell Carthage which libraries to install. This is done with a_Cartfile_.

![](http://img2.tuicool.com/JreMzaz.png!web)

## Creating Your First Cartfile

A_Cartfile_is a simple text file that describes your project’s dependencies to Carthage, soitcan determine what to install. Each line in a Cartfile states where to fetch a dependency from, the name of the dependency, and optionally, which version of the dependency to use. A Cartfile is the equivalent of a CocoaPods_Podfile_.

Navigate to the root directory of your project in Terminal \(the directory that contains your_.xcodeproj_file\) using the_cd_command:

```
cd ~/Path/To/Starter/Project
```

Create an empty Cartfile with the`touch`command:

```
touch Cartfile
```

And then open the file up in Xcode for editing:

```
open -a Xcode Cartfile
```

If you’re familiar with another text editor, like Vim, then feel free to use that instead. Don’t, however, use TextEdit to edit the file; with TextEdit it’s too easy to accidentally use so-called “smart quotes” instead of straight quotes, and they will confuse Carthage.

Add the following lines to the Cartfile and save it:

```
github "Alamofire/Alamofire" == 4.5
github "Alamofire/AlamofireImage" ~> 3.2
```

These two lines tell Carthage that your project requires`Alamofire`version 4.5, and the latest version of`AlamofireImage`that’s compatible with version 3.2.

## The Cartfile Format

Cartfiles are written in a subset of_OGDL_: Ordered Graph Data Language. It sounds fancy, but it’s really quite simple. There are two key pieces of information on each line of a Cartfile:

* _Dependency origin_
: This tells Carthage
where
to fetch a dependency from. Carthage supports two types of origins:
* `github`
for Github-hosted projects \(the clue’s in the name!\). You specify a Github project in the
`Username/ProjectName`
format, just as you did with the Cartfile above.
* `git`
for generic Git repositories hosted elsewhere. The
`git`
keyword is followed by the path to the git repository, whether that’s a remote URL using
`git://`
,
`http://`
, or
`ssh://`
, or a local path to a git repository on your development machine.
* _Dependency Version_
: This is how you tell Carthage which version of a dependency you’d like to use. There are a number of options at your disposal, depending on how specific you want to be:
* `== 1.0`
means “Use exactly version 1.0”
* `>`
`= 1.0`
means “Use version 1.0 or higher”
* `~`
`>`
` 1.0`
means “Use any version that’s
compatible
with 1.0″, essentially meaning any version up until the next major release.
* If you specify
`~`
`>`
` 1.7.5`
, then any version from 1.7.5 up to, but not including 2.0, is considered compatible.
* Likewise, if you specify
`~`
`>`
` 2.0`
then Carthage will use a version 2.0 or later, but less than 3.0.
* Compatibility is based on
[Semantic Versioning](http://semver.org/)
– for more information check out our tutorial on
[Using CocoaPods with Swift](http://www.raywenderlich.com/97014/use-CocoaPods-with-swift)
.
* _branch name / tag name / commit name_
means “Use this specific git branch / tag / commit”. For example, you could specify
_master_
, or a commit has like
_5c8a74a_
.

If you don’t specify a version, then Carthage will just use the latest version that’s compatible with your other dependencies. You can see examples of each of these options in practice in[Carthage’s README file](https://github.com/Carthage/Carthage/blob/master/README.md).

## Building Dependencies

So now you have a Cartfile, it’s time to put it to use and actually install some dependencies!

_Note:_

This Carthage tutorial uses Swift 4, and at the time of this Carthage tutorial, Swift 4 is only available in Xcode 9. Ensure that your command line tools are configured to use Xcode 9. Run the following command from Terminal:

```
sudo xcode-select -s <path to Xcode 9 beta>/Xcode-beta.app/Contents/Developer
```

Close your Cartfile in Xcode and head back to Terminal. Run the following command:

```
carthage update --platform iOS
```

This instructs Carthage to clone the Git repositories that are specified in the Cartfile, and then build each dependency into a framework. You should see output that shows what happened, similar to this:

```
*** Fetching AlamofireImage
*** Fetching Alamofire
*** Checking out Alamofire at "4.5.0"
*** Checking out AlamofireImage at "3.2.0"
*** xcodebuild output can be found in /var/folders/cn/tknd724s0fv8pbdcbkg2sb6w0000gn/T/carthage-xcodebuild.no8ytB.log
*** Building scheme "Alamofire iOS" in Alamofire.xcworkspace
*** Building scheme "AlamofireImage iOS" in AlamofireImage.xcworkspace
```

The`--platform iOS`option ensures that frameworks are only built for iOS. If you don’t specify a platform, then by default Carthage will build frameworks for all platforms \(often both Mac and iOS\) supported by the library.

If you’d like to take a look at further options available, you can run`carthage help update`.

By default, Carthage will perform its checkouts and builds in a new directory named_Carthage_in the same location as your Cartfile. Open up this directory now by running:

```
open Carthage
```

You should see a Finder window pop up that contains two directories:_Build_and_Checkouts_. Take a moment to see what Carthage created for you.

![](http://img1.tuicool.com/6jeAnmR.png!web)

## Build Artifacts

If you’re familiar with CocoaPods, you know that it makes a number of changes to your Xcode project and binds it together with a special Pods project into an Xcode workspace.

Carthage is a little different. It simply checks out the code for your dependencies, builds it into binary frameworks, and then it’s up toyouto integrate it into your project. It sounds like extra work, but it’s beneficial. It only takes a few steps and you’ll be more cognizant of the changes to your project as a result.

When you run`carthage update`, Carthage creates a couple of files and directories for you:

![](http://img1.tuicool.com/2AJRvqE.png!web)

* _Cartfile.resolved_
: This file is created to serve as a companion to the Cartfile. It defines exactly which versions of your dependencies Carthage selected for installation. It’s
strongly
recommended to commit this file to your version control repository, because its presence ensures that other developers can get started quickly by using exactly the same versions of dependencies as you.
* _Carthage_
directory, containing two subdirectories:
* _Build_
: This contains the built framework for each dependency. These can be integrated into your project, which you’ll do shortly. Each framework is either built from source, or downloaded from the project’s “Releases” page on Github.
* _Checkouts_
: This is where Carthage checks out the source code for each dependency that’s ready to build into frameworks. Carthage maintains its own internal cache of dependency repositories, so it doesn’t have to clone the same source multiple times for different projects.

Whether you commit the_Build_and_Checkouts_directories to your version control repository is entirely up to you. It’s not required, but doing so means that anybody who clones your repository will always have the binaries and source for each dependency available.

Having this backup can be a useful insurance policy if, for example, Github is unavailable or a source repository is removed completely.

Don’t modify any code inside the Checkouts folder because its contents may be overwritten at any time by a future`carthage update`or`carthage checkout`command, and your hard work would be gone in the twinkling of an eye.

If modifications to your dependencies are a must do, you can run`carthage update`using the`--use-submodules`option.

With this option, Carthage adds each dependency in the Checkouts folder to your Git repository as a submodule, meaning you can change the dependencies’ source, and commit and push those changes elsewhere without fear of an overwrite.

_Note_: If other users need to use your project, and youhaven’tcommitted the built frameworks with your code, then they will need to run`carthage bootstrap`after checking out your project.

The`bootstrap`command will download and build theexactversions of your dependencies that are specified in_Cartfile.resolved_.

`carthage update`, on the other hand, would update the project to use the newest compatible versions of each dependency, which may not be desirable.

Now, how about actuallyusingthese build artifacts you worked so hard to create?

## Adding Frameworks to Your Project

Back in Xcode, click the DuckDuckDefine_project_in the Project Navigator. Select the DuckDuckDefine_target_, choose the_General_tab at the top, and scroll down to the_Linked Frameworks and Libraries_section at the bottom.

In the_Carthage_Finder window, navigate into_Build\iOS_. Drag both_Alamofire.framework_and_AlamofireImage.framework_into the_Linked Frameworks and Libraries_section in Xcode:

![](https://koenig-media.raywenderlich.com/uploads/2017/08/navigation.gif)

This tells Xcode to link your app to these frameworks, allowing you to make use of them in your own code.

Next, switch over to_Build Phases_and add a new_Run Script_build phase by clicking the_+_in the top left of the editor. Add the following command:

```
/usr/local/bin/carthage copy-frameworks
```

Click the_+_under_Input Files_and add an entry for each framework:

```
$(SRCROOT)/Carthage/Build/iOS/Alamofire.framework
$(SRCROOT)/Carthage/Build/iOS/AlamofireImage.framework
```

The result should look like this:

![](http://img2.tuicool.com/ZFVbMrN.png!web)

Strictly speaking, this build phase isn’t_required_for your project to run.However, it’s a slick workaround for an[App Store submission bug](http://www.openradar.me/radar?id=6409498411401216)where apps with frameworks that contain binary images for the iOS simulator are automatically rejected.

The`carthage copy-frameworks`command strips out these extra architectures. w00t!

There won’t be anything new to see yet, but build and run the app to ensure everything’s still working as expected. When the app launches, you should see the search view controller.

OK, great. Things are looking good. Next, upgrading dependencies.

## Upgrading Frameworks

I have a confession to make.

![](http://img2.tuicool.com/Nnuqaqe.png!web)

Remember when you created your Cartfile earlier, and I told you what versions of Alamofire and AlamofireImage to install? Well, you see, I gave you bad information. I told you to use an old version of Alamofire.

![](http://img0.tuicool.com/Z3yqeqn.png!web)

Don’t be mad though! It was done with the best of intentions. Look on this as anopportunity…yes, an opportunity to learn how to upgrade a dependency. It’s a gift, really.

![](http://img2.tuicool.com/3IV3myu.png!web)

Open up your_Cartfile_again. From your project’s directory in Terminal, run:

```
open -a Xcode Cartfile
```

Change the Alamofire line to:

```
github "Alamofire/Alamofire" ~> 4.5.0
```

As you saw earlier, this means to use any version of Alamofire that’scompatiblewith 4.5.0, so, any version up to but not including a future 5.0 version.

When adding dependencies with Carthage, it’s a good idea to consider compatibility and limit the version that you’re targeting. That way, you know the exact state of its API and functionality.

For example, version 5.0 of a dependency might include app-breaking API changes — you likely wouldn’t want to automatically upgrade to it if you built your project against 4.5.0.

Save and close the Cartfile, and return to the terminal. Perform another update:

```
carthage update --platform iOS
```

Carthage will look for newer versions of each of your dependencies, then check them out and build them if necessary. You should see it fetch the latest version of Alamofire.

Because your project already contains a reference to the built_.framework_for Alamofire, and Carthage rebuilds the new version in the same location on disk, you can sit back and let Carthage do the work; your project will automatically use the latest version of Alamofire!

## Duck, Duck… GO!

Now that you’ve integrated Alamofire and AlamofireImage with the project, you can put them to use to perform some web searches. Are you ready?

In Xcode, open_DuckDuckGo.swift_. At the top of the file, add the import below:

```
import Alamofire
```

Next, replace the existing definition of`performSearch(for:completion:)`with this:

```
func performSearch(for term: String, completion: @escaping (Definition?) -> Void) {
// 1
let parameters: Parameters = ["q": term, "format": "json", "pretty": 1,
"no_html": 1, "skip_disambig": 1]

// 2
Alamofire.request("https://api.duckduckgo.com", method: .get, parameters: parameters).responseData { response in
// 3
if response.result.isFailure {
completion(nil)
return
}

// 4
guard let jsonData = response.result.value else {
completion(nil)
return
}
// 5
let decoder = JSONDecoder()
let definition = try? decoder.decode(Definition.self, from: jsonData)
// 6
if let definition = definition, definition.resultType == .article {
completion(definition)
} else {
completion(nil)
}
}
}
```

There’s quite a bit here, so let’s break it down:

1. First, you build up the list of parameters to send to DuckDuckGo. The most important two here are
`q`
: the search term itself, and
`format`
: which tells the web service to respond with JSON.
2. Then you perform the request using Alamofire. This call makes a GET request to
`https://api.duckduckgo.com`
, using the parameter dictionary created above.
3. Once the response comes back, check if the request failed. If so, exit early.
4. Optionally bind the JSON response object to ensure it has a value.
5. Next, use
`JSONDecoder`
to deserialize the
`Definition`
, which conforms to
`Codable`
.
6. The DuckDuckGo API can return a range of different result types, but the one covered here is
_Article_
, which provides a simple definition of the search term. You filter fpr
`article`
then pass the retrieved definition to the completion handler.

_Note_: If you’re wondering why the`skip_disambig`parameter exists, it’s to tell DuckDuckGo not to return ‘disambiguation’ results.

Disambiguation results are like[those pages you see on Wikipedia](https://en.wikipedia.org/wiki/Christopher_Evans): did you mean_Chris Evans_the movie actor,_Chris Evans_the British TV personality, or_Chris Evans_the train robber?

`skip_disambig`means the API will just pick the most likely result and return it.

Build and run! Once the app starts, enter “Duck” in the search bar. If everything’s working correctly, you should see a definition on the next screen.

![](http://img2.tuicool.com/MR7vUbz.png!web)

There’s one thing missing, however: a picture! It’s one thing being able toreadwhat a duck is, but who reads anymore? Pictures are worth — okay, I’ll spare you the cliché — you know what I mean.

Anyways, whodoesn’tlike looking at pictures of ducks? Kittens aresolast season, right?

Open_DefinitionViewController.swift_, and add`import AlamofireImage`just below the existing`UIKit`import at the top:

```
import AlamofireImage
```

Then, at the following code just below`viewDidLoad()`method:

```
override func viewDidAppear(_ animated: Bool) {
super.viewDidAppear(animated)

if let imageURL = definition.imageURL {
imageView.af_setImage(withURL: imageURL, completion: { _ in
self.activityIndicatorView.stopAnimating()
})
}
}
```

`af_setImage`is an extension on UIImageView provided by AlamofireImage. You call it to retrieve the image found in the definition`imageURL`. Once retrieved, the activity indicator’s animation is stopped.

Build and run, and perform your search again.

![](http://img0.tuicool.com/ABNRR3v.png!web)

Quack quack!

### Where To Go From Here?

You can[download the complete project here](https://koenig-media.raywenderlich.com/uploads/2017/08/DuckDuckDefine-final.zip). \(Don’t forget to run`carthage update --platform iOS`to build the dependencies.\)

Congratulations, you’ve learnt about the philosophy behind dependency management and behind Carthage itself, gained some experience using Carthage to add some dependencies to a project, and used those dependencies to make a useful app!

You also know how to update your dependencies for future releases.

If you want to learn more about Carthage, your first stop should be the[Carthage README](https://github.com/Carthage/Carthage)and the documentation on[Build Artifacts](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md).

Justin Spahr-Summers, one of the project’s founders, gave a smashing talk at Realm.io about Carthage, entitled “[Ruthlessly Simple Dependency Management](https://academy.realm.io/posts/swift-dependency-management-with-carthage/).”

Finally, if you’d like to learn more about[Swift Package Manager](https://swift.org/package-manager/)be sure to read the official documentation. About[CocoaPods](http://cocoapods.org/), you can checkout our tutorial on[How To Use CocoaPods With Swift](http://www.raywenderlich.com/97014/use-CocoaPods-with-swift). It also contains a great section on Semantic Versioning, which you saw in use in Cartfiles.

I hope you got a lot out of this Carthage tutorial. If you have any questions or comments, please join in the forum discussion below!

Source:  https://www.raywenderlich.com/165660/carthage-tutorial-getting-started-2 
