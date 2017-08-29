---
title: 7 Great Disk Usage Viewing Tool in Linux
---

Where does the space go? How has your two-terabyte hard disk drive filled up so quickly? There’s only one way to find out: with a disk usage viewing tool. These are mostly designed to work with hard disk drives andsolid state drives[How Do Solid-State Drives Work? \[MakeUseOf Explains\]](http://www.makeuseof.com/tag/solidstate-drives-work-makeuseof-explains/)[How Do Solid-State Drives Work? \[MakeUseOf Explains\]](http://www.makeuseof.com/tag/solidstate-drives-work-makeuseof-explains/)Over the past few decades, there has been a considerable amount of work in the field of computer hardware. While computer technology is constantly improving and evolving, rarely do we experience moments where we simply...[Read More](http://www.makeuseof.com/tag/solidstate-drives-work-makeuseof-explains/), but they can also work with flash drives, USB sticks and SD cards.

Several such utilities are available for Linux, so let’s take a look at them.

## 1. Native Command Line Tools

The first place to check is the command line. Several tools are available here, and are already bundled with Linux.

The first command you should try is**df**. This will report the amount of disk space in use. It can be used alone, to display a full total for all mounted file systems, or with a filename.

![](http://img2.tuicool.com/rq2MVrU.png!web)

When used with a filename, df will output the remaining space on the specific partition where the file is stored.

```
df
 etc
```

The above command would show how much free space is available in the /etc/ directory. Meanwhile,

```
df
 -h
```

employs the -h switch, which means “human readable.” This basically displays the file and folder sizes in a format you can read. Use this to interpret how much disk space is being used by a particular file or directory.

Meanwhile,**du**is also available. Differing slightly to df, du displays an estimate of disk space used by files. For example,

```
du
 -shc 
*.txt
```

displays the size of each TXT file in the current directory in human-readable format.

You can also use the**ls**\(list\) command to output a list of a directory’s contents, and the file size.

![](http://img1.tuicool.com/2iIJ3mv.png!web)

This is done in any directory with

```
ls
 -l -h
```

Simple!

## 2.[Ncurses Disk Usage](https://dev.yorhel.nl/ncdu)\(ncdu\)

If you prefer to get the disk usage information you’re looking for from a dedicated utility, then try ncdu. Potentially the simplest method in this list, ncdu scans your system as soon as the tool is launched. By default, the contents and usage of the Home directory are displayed, but this can be changed by specifying a different directory as a parameter.

You can install ncdu on Debian-based systems via the command line:

```
sudo
 apt install ncdu
```

![](http://img0.tuicool.com/RRN3Ajv.png!web)

Using ncdu is simple. In the command line, enter:

```
ncdu
```

You’ll need to wait for the results on larger HDDs. You can also scan the root filesystem using the -x command:

```
ncdu
 -x /
```

And there’s the option to scan via SSH — very useful for remote devices.

```
ssh
 -C user
@system
 ncdu -o- / | .
cdu -f-
```

Head to the ncdu website to find a[full set of instructions](https://dev.yorhel.nl/ncdu/man).

Other features of ncdu include sorting by filename or size, deleting single files and directories, showing information about a file or folder, and toggling the visibility of hidden items.

With such good command line tools, you might think you’ve got everything you need. However, various visual tools will give you an enhanced view of your disk usage.

## 3. QDirStat

The first visual disk usage tool to look at is QDirStat, available across Linux desktop environments,as well as BSD[Linux vs. BSD: Which Should You Use?](http://www.makeuseof.com/tag/linux-vs-bsd-which-should-you-use/)[Linux vs. BSD: Which Should You Use?](http://www.makeuseof.com/tag/linux-vs-bsd-which-should-you-use/)[Read More](http://www.makeuseof.com/tag/linux-vs-bsd-which-should-you-use/).

Visual tools give a great insight into just what is going on with your PC’s hard disk drive that a list of numbers simply cannot relate. One of the most popular options for this on[Windows is WinDirStat](http://www.makeuseof.com/tag/visualize-your-hard-drive-with-windirstat/)[Visualize your Hard Drive Usage with WinDirStat](http://www.makeuseof.com/tag/visualize-your-hard-drive-with-windirstat/)[Visualize your Hard Drive Usage with WinDirStat](http://www.makeuseof.com/tag/visualize-your-hard-drive-with-windirstat/)[Read More](http://www.makeuseof.com/tag/visualize-your-hard-drive-with-windirstat/), which is a clone of the KDirStat utility, upon which QDirStat is based.

With QDirStat, your HDD usage is represented by rectangles and squares, each of a different size. The bigger the square, the more HDD space is being used by that particular directory. Right-clicking on the rectangle in question will give you the option to visit the folder location.

![](http://img2.tuicool.com/aumYVzR.png!web)

This is a great way to find “secret” data that has been downloaded to your computer. Things like missing download locations and your internet cache can all be traced with these tools. And if you don’t like the “blocky” view, usage data can also be viewed as a histogram.

You can[get QDirStat via GitHub](https://github.com/shundhammer/qdirstat), but packages are available for openSUSE, SLE, and Ubuntu.

For the latter, first add the PPA \(remember to remove it later\):

```
sudo 
add
-apt-repository 
pp
a:nathan
-renniewaldock/qdirstat

sudo apt-
get
update
```

Once this is done, install with

```
sudo
 apt install qdirstat
```

You can then launch the software from the desktop, or from the terminal with the qdirstat command. Follow the prompt to select the directory to scan, then wait until the data is collated and presented.

A KDE version,[K4DirStat](https://bitbucket.org/jeromerobert/k4dirstat/wiki/Home), is also available.

## 4.[Disk Usage Analyzer](https://help.gnome.org/users/baobab)\(aka Baobab\)

Formerly known as Baobab, Disk Usage Analyzer is, as you might have guessed, another visual tool. Rather than the block-based approach of QDirStat, this utility offers a radial treemap pie chart as a live illustration of disk usage. You’ll find this in the right-hand pane; on the left, a list of the contents of the currently selected directory.

![](http://img0.tuicool.com/jqIbmin.png!web)

Everything is color-coded for easy analysis, but Disk Usage Analyzer doesn’t really offer much more than that. For instance, there’s no easy shortcut to the directories you’re viewing, other than to open them manually in yourdefault file manager[Thunar vs. Nautilus: Two Lightweight File Managers For Linux](http://www.makeuseof.com/tag/thunar-vs-nautilus-two-lightweight-file-managers-for-linux/)[Thunar vs. Nautilus: Two Lightweight File Managers For Linux](http://www.makeuseof.com/tag/thunar-vs-nautilus-two-lightweight-file-managers-for-linux/)Is Thunar a better file manager than Gnome's default, Nautilus?[Read More](http://www.makeuseof.com/tag/thunar-vs-nautilus-two-lightweight-file-managers-for-linux/).

Having said that, Disk Usage Analyzer is easy to use and ideal for quick checks of usage without too much involvement.

## 5.[xdiskusage](http://xdiskusage.sourceforge.net/)

Another block-based graphical usage analyzer, xdiskusage has a quite basic UI and gathers information from the du command. This is run on your behalf, however, so the usage data is quickly compiled and presented.

Install in Debian-based systems with

```
sudo
 apt install xdiskusage
```

Run the xdiskusage command in the terminal to launch, then select the directory, or disk, to analyze.

![](http://img2.tuicool.com/3UJ363q.png!web)

The result is a tree-based presentation, with the parent directory block displayed left-most and the child directories and folders branching off to the right. Each block displays the directory name and disk usage.

You can navigate through this graphic representation of your directory structure using the mouse or arrow keys. Need to find out more about the directory block? Simply right-click for options, which include copying the path to the clipboard, and printing the display.

While it doesn’t offer great graphics, xdiskusage is designed to be extremely lightweight. If you’re in a situation where your disk has filled up without explanation and you’re short of space, xdiskusage could be the solution you’re looking for.

The downloadable executable for xdiskusage is 64-bit only, however the source can also be downloaded, and compiled on your system for installation.

## 6.[Duc](http://duc.zevv.nl/)

Another disk usage tool employing the radial treemap approach is Duc. Featuring a collection of tools, you can install Duc on Debian-based distros with

```
sudo
 apt install duc
```

For other Linux families, you can download the source from the website andcompile it[How to Compile & Install TAR GZ & TAR BZ2 Files in Ubuntu Linux](http://www.makeuseof.com/tag/compile-install-tar-gz-tar-bz2-files-ubuntu-linux/)[How to Compile & Install TAR GZ & TAR BZ2 Files in Ubuntu Linux](http://www.makeuseof.com/tag/compile-install-tar-gz-tar-bz2-files-ubuntu-linux/)[Read More](http://www.makeuseof.com/tag/compile-install-tar-gz-tar-bz2-files-ubuntu-linux/).

![](http://img1.tuicool.com/36z26bb.png!web)

Get started with Duc by indexing the /usr directory. This builds a database \(more on that below\), and can take a while on the first run:

```
duc
 index /usr
```

From here, you can use ls to list the contents of the directory and their impact on the HDD:

```
duc ls -Fg /usr/
local
```

If you prefer to see this in Duc’s visual analyzer meanwhile, use

```
duc
 gui /usr
```

![](http://img1.tuicool.com/M7fqA3i.png!web)

There’s also a console interface you can open with

```
duc
 ui /usr
```

Duc offers a far faster approach to disk usage analysis by maintaining a database of the disk’s contents. This makes it ideal for larger systems; the Duc website boasts that it has been tested with “500 million files and several petabytes of storage.”

## 7.[JDiskReport](http://www.jgoodies.com/freeware/jdiskreport/)

Another option for a lightweight installation is JDiskReport, which is a Java-based disk analysis tool. Because it’s Java, JDiskReport is cross-platform, which means you shouldn’t run into any issues running it on older or unusual Linux distributions.

![](http://img2.tuicool.com/RzMJbuv.png!web)

After analyzing your HDDs, JDiskReport presents the statistical data as charts and tables. This is where it comes into its own — not only do you get the expected pie chart display, the utility also displays a top 50 list of the largest files. You’ll also find a screen displaying the largest files by type.

Java isn’t the most popular platform, and is a pain to update, but if you’re looking for something with better reporting options than xdiskusage, JDiskReport is the answer.

## 7 Disk Usage Tools for Linux: Which Is Your Favorite?

It doesn’t matter if you want to use native command line tools, awesome GUI visualizers or console-based analysis of your HDD usage: there’s a tool for everyone!

But which one do you use? Are you using a Linux disk usage tool that we haven’t covered? Tell us more in the comments.



Source: [http://www.makeuseof.com/tag/how-to-analyze-your-disk-usage-pattern-in-linux/](http://www.tuicool.com/articles/hit/3y2Qba)

