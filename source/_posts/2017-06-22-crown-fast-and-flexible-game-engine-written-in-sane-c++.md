---
title: Crown – Fast and flexible game engine written in sane C++
---

## The flexible game engine.

Crown is a general purpose data-driven game engin

The flexible game engine.

Crown is a general purpose data-driven game engine, written from scratch in[orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b)with a minimalistic and data-oriented design philosophy in mind.

It is loosely inspired by Bitsquid \(now Stingray\) engine and its design principles; the current Lua API is similar to that of Bitsquid but this engine is_not_meant to be its clone_nor_to be API compatible with it.

## Screenshots

### [Level Editor](https://github.com/dbartolini/crown/tree/master/tools/level_editor)

![](http://img2.tuicool.com/3iEnqmm.png!web)

### [00-empty](https://github.com/dbartolini/crown/tree/master/samples/00-empty)

Engine initialization and shutdown.

### [01-physics](https://github.com/dbartolini/crown/tree/master/samples/01-physics)

![](http://img1.tuicool.com/bm2MFnU.png!web)

### [02-animation](https://github.com/dbartolini/crown/tree/master/samples/02-animation)

![](http://img1.tuicool.com/F7f6Fba.png!web)

## Download

### Linux

[crown-0.0.28-linux-x64.tar.gz](https://github.com/dbartolini/crown/releases/download/v0.0.28/crown-0.0.28-linux-x64.tar.gz)

## Documentation

* [Manual](http://dbartolini.github.io/crown/html)
* [Lua API](http://dbartolini.github.io/crown/html/lua_api.html)
* [C++ API](http://dbartolini.github.io/crown/doxygen/modules)

## Building

### Prerequisites

### Android

Android NDK \([https://developer.android.com/tools/sdk/ndk/index.html](https://developer.android.com/tools/sdk/ndk/index.html)\)

```
$ 
export
 ANDROID_NDK_ROOT=
<
path
/
to
/
android_ndk
>

$ 
export
 ANDROID_NDK_ARM=
<
path
/
to
/
android_ndk_arm
>
```

### Linux \(Ubuntu &gt;= 16.04\)

```
$ sudo 
add
-apt-repository 
pp
a:vala
-team
$ sudo apt-
get
 install libgtk-
3
-dev valac libgee-
0.8
-dev
$ sudo apt-
get
 install mesa-common-dev libgl1-mesa-dev libpulse-dev libxrandr-dev
```

### Windows

MSYS2 \([http://www.msys2.org](http://www.msys2.org/)\)

### Building and running Level Editor

```
$ make tools-linux-release64
$ cd build/linux64/bin
$ ./level-editor-release ../../../samples/
01
-physics
```

## Contact

Daniele Bartolini \([@aa\_dani\_bart](https://twitter.com/aa_dani_bart)\)

Project page:[https://github.com/dbartolini/crown](https://github.com/dbartolini/crown)

## Contributors

In chronological order.

Daniele Bartolini \([@dbartolini](https://github.com/dbartolini)\)

Simone Boscaratto \([@Xed89](https://github.com/Xed89)\)

Michele Rossi \([@mikymod](https://github.com/mikymod)\)

Michela Iacchelli - Pepper logo.

## License

```
Copyright (c) 2012-2017 Daniele Bartolini and individual contributors.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to 
use
,
copy, 
modify
, 
merge
, publish, 
distribute
, sublicense, 
and
/
or
 sell
copies 
of
 the Software, 
and
to
 permit persons 
to
 whom the
Software 
is
 furnished 
to
do
 so, subject 
to
 the 
following

conditions:

The above copyright 
notice
and
 this permission 
notice
 shall be
included 
in
 all copies 
or
 substantial portions 
of
 the Software.

THE SOFTWARE 
IS
 PROVIDED 
"AS IS"
, 
WITHOUT
 WARRANTY 
OF
ANY
 KIND,
EXPRESS 
OR
 IMPLIED, 
INCLUDING
 BUT 
NOT
 LIMITED 
TO
 THE WARRANTIES

OF
 MERCHANTABILITY, FITNESS 
FOR
 A PARTICULAR PURPOSE 
AND

NONINFRINGEMENT. 
IN
NO
EVENT
 SHALL THE 
AUTHORS
OR
 COPYRIGHT
HOLDERS BE LIABLE 
FOR
ANY
 CLAIM, DAMAGES 
OR
 OTHER LIABILITY,
WHETHER 
IN
 AN 
ACTION
OF
 CONTRACT, TORT 
OR
 OTHERWISE, ARISING

FROM
, 
OUT
OF
OR
IN
CONNECTION
WITH
 THE SOFTWARE 
OR
 THE 
USE
OR

OTHER DEALINGS 
IN
 THE SOFTWARE.
```



Source: [https://github.com/dbartolini/crown](http://www.tuicool.com/articles/hit/raUnuay)
