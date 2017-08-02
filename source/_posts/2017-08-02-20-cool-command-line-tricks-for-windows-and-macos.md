---
title: 20 Cool Command Line Tricks for Windows and macOS
---

![](http://img1.tuicool.com/m2UNbeb.jpg!web)

Image: Gizmodo

The command line \(or Terminal for you Mac fans\) is a throwback to a simpler age of computing, before mouse pointers and application windows[and desktop wallpaper](http://fieldguide.gizmodo.com/how-to-stop-windows-10-from-screwing-up-your-gorgeous-w-1788901567). Back when it was just you and a window full of text. Operating systems have long since evolved beyond the humble command line interface, but there’s still no better tool for quickly disseminating complex information in your operating system—and you can actually do some other pretty cool stuff with them, too.

### For Windows Users

In Windows you can launch the command line by typing “cmd” into the search box on the taskbar and hitting Enter, but for some of these commands you need administrator privileges. To get those, launch Task Manager \(**Ctrl+Shift+Esc**\), then choose**File**and**Run new task**. Enter “cmd” in the box, tick the admin privileges box beneath, and then click**OK**.

Some of these commands will throw up many screens of text, but you can use the “\| more” flag after any of them to go a screen at a time \(that’s the pipe character at the start\). Alternatively, use “&gt; c:\export.txt” to send the output to a text file, changing its name and location as you like.

### 1\) View installed drivers

If you’re troubleshooting hardware problems or just want to know if something’s installed successfully, seeing a list of installed drivers can help: type “driverquery”, hit Enter, and you get a list of all the current Windows drivers, alongside install dates and display names.

Image: Screenshot

### 2\) Watch Star Wars in ASCII

No, really. Enable Telnet in Windows via Control Panel \(click**Programs**then**Turn Windows features on or off\)**, then open up a command prompt window and type “telnet towel.blinkenlights.nl” then hit Enter. The same trick works on macOS, by the way—though your telnet is automatically enabled.

### 3\) Save folder trees to disk

Struggling to get an overview of all the nested folders on a drive? The command line can help. Type “tree” and hit Enter to see the current folder and its subfolders neatly laid out; add “&gt; c:\export.txt” to save the results in a text file that you can browse at your leisure.

### 4\) Scan for system problems

Nobody wants their Windows system crashing and shutting down on a regular basis, and if you’re currently having problems then the “sfc /scannow” command \(which launches the System File Checker tool\) checks the most important OS files and fixes them, if possible.

### 5\) Show your Wi-Fi password

Forgotten your Wi-Fi password? No problem with the command “netsh wlan show profile SSID key=clear”, replacing “SSID” with the Wi-Fi name of the network. If you’re not sure about the networks you’ve connected to, use the “netsh wlan show profile” command.

### 6\) Shut down your computer later

You can get your computer to shut down at some point in the future with the “shutdown” command. Add “-t xxx” to shut down with xxx being the number of seconds \(from 0 to 315,360,000, which is ten years\) and “-f” to force close any ‘you’ve got unsaved work’ dialog boxes. So if you wanted to shut your computer down in 636 seconds you would type “shutdown -f -t 636”.

Image: Screenshot

### 7\) Check your laptop’s battery health

The command prompt can give you a pretty detailed and technical readout of the battery health of your laptop \(or tablet\): Type “powercfg /batteryreport” and hit Enter to generate the report, then open C:\WINDOWS\system32\battery-report.html to view the findings.

### 8\) View your Windows license key

Lost your Windows license key again have you? If it’s not written on a sticker on your computer’s case then you can find it by typing “wmic path softwarelicensingservice get OA3xOriginalProductKey” into the command prompt window and hitting Enter.

### 9\) Fix internet problems

The command “ipconfig” shows your network connection status \(the gateway is your router, if you need to know its IP\), but you can also use “ipconfig /release” and then “ipconfig /renew” to reset your internet connection, which can solve multiple issues.

### 10\) Find information about your computer

It’s not always easy to work out where to find your computer’s specs—that is, it’s not easy unless you use the command line. Type “systeminfo”, press Enter, and you get a detailed readout of everything from the amount of RAM installed to when the last reboot was.

### For macOS Users

To launch the Terminal in macOS, open up Spotlight with**Cmd+Space**and then type “Terminal” until it appears on screen—select it, hit Enter, and you’re in. As with Windows, use “\| more” at the end of your commands to go a page at a time through the results or responses, or “&gt; export.txt” to save the results in a text file in the current directory \(it default to the current user’s directory\).

### 1\) Change the default screenshot type

Screenshots you take on macOS are saved as PNG files by default, but you don’t have to settle for this—type “defaults write com.apple.screencapture type JPG” and hit Enter to change the format to JPEG, for example. Other file formats you can use are PDF and TIFF.

### 2\) Get your Mac to speak to you

macOS comes with a text-to-speech engine that can be used for a variety of purposes, and getting it running in Terminal is as simple as typing “say” followed by any text in quotation marks, then hitting Enter. Admittedly this isn’t all that useful, but it’s still fun to play with, particularly when you want to ruin nice silences at work.

### 3\) Add a message to the login screen

You can add a login screen message through Terminal—maybe with contact details in case your Mac gets lost. Use “sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText”, then a space and your message in quotation marks, and hit Enter.

Love to play Snake. \(Image: Screenshot\)

### 4\) Play Tetris and other classics

Terminal hides some classic games as part of the vintage GNU Emacs OS, and you can access them by typing “emacs” followed by Enter, then pressing**Esc**, and then tapping**X**. Type in “tetris”, “pong”, “snake”, “solitaire”, or “tetris” then hit Enter to get started.

### 5\) Get a dictionary definition

If you don’t happen to have a proper paper dictionary or a search engine on hand then Terminal can look up words for you as well. All you need to do is type “curl dict://dict.org/d:word”, replacing that final “word” with the one you want defining.

### 6\) Keep macOS awake

To prevent your Mac’s screen from dimming or initiating the screensaver you can simply type “caffeinate” into a Terminal window and press Enter \(use**Ctrl+C**to return to normal\). Add “-t xx” to specify a duration for the wakefulness, with “xx” the number of seconds. So if you wanted an hour of wakefulness you’d type “caffeinate -t 3600”.

### 7\) Show hidden files

You can reveal the files macOS is hiding from you with “defaults write com.apple.finder AppleShowAllFiles -bool TRUE; killall Finder”. If you need to hide them again use the “defaults write com.apple.finder AppleShowAllFiles -bool FALSE; killall Finder” command.

Image: Screenshot

### 8\) Check how long your Mac has been running

This is a simple command but it might come in handy—just type in “uptime” in the Terminal window to see how long it’s been since you last shut down your Mac. If you can’t remember when the OS was last updated or need to troubleshoot your machine, it can be quite useful.

### 9\) Shut down your Mac, with a delay

As with Windows, you can shut down your macOS machine from Terminal, and add a delay if necessary \(if something needs to finish first for instance\). The command “sudo shutdown -h now” does a full shutdown, whereas “sudo shutdown -h +5" delays it for five minutes.

### 10\) Add spaces to the Dock

Add spaces to the Dock with the “defaults write com.apple.dock persistent-apps -array-add ‘{”tile-type”=”spacer-tile”;}’; killall Dock” command—run it as many times as you want spaces. To get rid of a space you’ve added, just drag them to the Trash.



Source: [http://fieldguide.gizmodo.com/20-cool-command-line-tricks-for-windows-and-macos-1797222311](http://www.tuicool.com/articles/hit/aMbYRni)

