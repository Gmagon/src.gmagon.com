-
--
title: 'A modern project, package, and virtual env manager for Python'
---

# Hatch

Hatch is a productivity tool designed to make your workflow easier and more efficient, while also reducing the number of other tools you need to know. It aims to make the 90% use cases as pleasant as possible.

For me personally, Hatch has entirely replaced the manual \(or entire!\) use of these:

* [Cookiecutter PyPackage](https://github.com/audreyr/cookiecutter-pypackage)
* [pip](https://github.com/pypa/pip)
* [virtualenv](https://github.com/pypa/virtualenv)
* [pyenv](https://github.com/pyenv/pyenv)
* [Pew](https://github.com/berdario/pew)
* [inve](https://gist.github.com/datagrok/2199506)
* [pytest](https://github.com/pytest-dev)
* [Coverage.py](https://github.com/nedbat/coveragepy)
* [twine](https://github.com/pypa/twine)
* [bumpversion](https://github.com/peritus/bumpversion)
* [zest.releaser](https://github.com/zestsoftware/zest.releaser)
* [Incremental](https://github.com/twisted/incremental)
* `python setup.py ...`

/^\/^\
_|__| O|
\/ /~ \_/ \
\____|__________/ \
\_______ \
`\ \ \
| | \
/ / \
/ / \
/ / \ \
/ / \ \
/ / _----_ \ \
/ / _-~ ~-_ | |
( ( _-~ _--_ ~-_ _/ |
\ ~-____-~ _-~ ~-_ ~-_-~ /
~-_ _-~ ~-_ _-~
~--______-~ ~-___-~


**Table of Contents**

* [Features](https://github.com/ofek/hatch#features)
* [Usage](https://github.com/ofek/hatch#usage)
* [Installation](https://github.com/ofek/hatch#installation)
* [Commands](https://github.com/ofek/hatch#commands)
* [Configuration](https://github.com/ofek/hatch#configuration)
* [Contributing](https://github.com/ofek/hatch#contributing)
* [TODO](https://github.com/ofek/hatch#todo)
* [License](https://github.com/ofek/hatch#license)
* [Credits](https://github.com/ofek/hatch#credits)
* [History](https://github.com/ofek/hatch#history)
* [master](https://github.com/ofek/hatch#master)
* [0.4.0](https://github.com/ofek/hatch#id3)
* [0.3.0](https://github.com/ofek/hatch#id4)



## Features

* Completely cross-platform \\(\*\_^\)/
* Configurable project creation! CI service files, readme format/badges, licenses, etc.
* Easiest virtual environment management available
* Activation of virtual envs without disruption of current environments
* Ability to send commands to virtual envs without the need for activation
* Changed prompts when in a virtual env
* Installing/updating packages defaults to a per-user basis, allowing global usage with elevated privileges
* Configurable semantic version bumping
* Robust build/package cleanup
* Easy testing with code coverage
* Simple building and releasing for PyPI
* All commands are environment-aware w.r.t. python/pip
* Virtual envs can be the target for relevant commands
* Editable packages can be the target for relevant commands



## Usage

Starting a new project is as easy as:

$ hatch new my-app
Created project
`
my-app
`

Now you have a fully function package that can be built and distributed.

```
$ tree --dirsfirst my-app
my-app
├── my_app
│   └── __init__.py
├── tests
│   └── __init__.py
├── LICENSE-APACHE
├── LICENSE-MIT
├── MANIFEST.in
├── README.rst
├── requirements.txt
├── setup.py
└── tox.ini

2 directories, 8 files
```

You can also bump the version of most projects without any setup:

```
$ git clone -q https://github.com/requests/requests
&
&
cd
requests
$ hatch grow build
Updated /home/ofek/requests/requests/__version__.py
2.18.4 -
>
2.18.4+build.1
$ hatch grow fix
Updated /home/ofek/requests/requests/__version__.py
2.18.4+build.1 -
>
2.18.5
$ hatch grow pre
Updated /home/ofek/requests/requests/__version__.py
2.18.5 -
>
2.18.5-rc.1
$ hatch grow minor
Updated /home/ofek/requests/requests/__version__.py
2.18.5-rc.1 -
>
2.19.0
$ hatch grow major
Updated /home/ofek/requests/requests/__version__.py
2.19.0 -
>
3.0.0
```

Checking code coverage is a breeze:

```
$ git clone https://github.com/ofek/privy
&
&
cd
privy
$ hatch
test
-c
=========================
test
session starts ==========================
platform linux -- Python 3.5.2, pytest-3.2.1, py-1.4.34, pluggy-0.4.0
rootdir: /home/ofek/privy, inifile:
plugins: xdist-1.20.0, mock-1.6.2, httpbin-0.0.7, forked-0.2, cov-2.5.1
collected 10 items

tests/test_privy.py ..........

====================== 10 passed
in
4.34 seconds =======================

Tests completed, checking coverage...

Name Stmts Miss Branch BrPart Cover Missing
-----------------------------------------------------------------
privy/__init__.py 1 0 0 0 100%
privy/core.py 30 0 0 0 100%
privy/utils.py 13 0 4 0 100%
tests/__init__.py 0 0 0 0 100%
tests/test_privy.py 57 0 0 0 100%
-----------------------------------------------------------------
TOTAL 101 0 4 0 100%
```

Creating virtual envs is incredibly simple:

$ hatch env my-app
Already using interpreter /usr/bin/python3
Successfully saved virtual env
`
my-app
`
to
`
/home/ofek/.local/share/hatch/venvs/my-app
`
.
$ hatch env -l
Virtual environments found
in
/home/ofek/.local/share/hatch/venvs:

my-app -
>

Version: 3.5.2
Implementation: CPython

You can nest activated virtual envs:

```
$ hatch use my-app
(my-app) $ hatch use -n fast
2 (fast) $ hatch use -n old
3 (old) $
exit

2 (fast) $
exit

(my-app) $
exit

$
```

or use them as usual:

```
$ python -c
"
import sys;print(sys.executable)
"

/usr/bin/python
$ hatch use my-app
(my-app) $ python -c
"
import sys;print(sys.executable)
"

/home/ofek/.local/share/hatch/venvs/my-app/bin/python
(my-app) $ hatch use fast
(my-app) $
exit

(fast) $ python -c
"
import sys;print(sys.executable)
"

/home/ofek/.local/share/hatch/venvs/fast/bin/python
(fast) $
exit

$
```

And so much more!



## Installation

Hatch is distributed on[PyPI](https://pypi.org/)as a universal wheel and is available on Linux/macOS and Windows and supports Python 3.5+ and PyPy.

```
$ pip3 install --user hatch
```

or simply`pip`if that already points to a Python 3 version.

If`hatch`doesn't work on your system immediately after that, please run[this command](https://github.com/ofek/pybin#pybin-put).

After the first installation, you may want to run`hatch config --restore`to ensure your config file is available.



## Commands

For a complete reference, see[COMMANDS](https://github.com/ofek/hatch/blob/master/COMMANDS.rst)



## Configuration

If you would like to learn more about advanced configuration, check out[CONFIG](https://github.com/ofek/hatch/blob/master/CONFIG.rst)



## Contributing



### TODO

_meta_

* start using AppVeyor
* next to the snake ascii art, put a
`hatch`
ed egg

_issues_

* I really, really need help with
[this](https://github.com/ofek/hatch/blob/5293e418c52fb6b0417fcbff0ea17ccd01bbdab1/hatch/cli.py#L1347-L1363)

_project creation_

* Support
[AppVeyor](https://www.appveyor.com/)
and
[CircleCI](https://circleci.com/)
.
* Minimally support
[Mercurial](https://en.wikipedia.org/wiki/Mercurial)

_Commands_

* `bench`
- use
[https://github.com/ionelmc/pytest-benchmark](https://github.com/ionelmc/pytest-benchmark)
* `style`
- maybe not needed. use
[https://github.com/PyCQA/flake8](https://github.com/PyCQA/flake8)
* `docs`
- maybe not needed. use
[https://github.com/sphinx-doc/sphinx/](https://github.com/sphinx-doc/sphinx/)



## License

Hatch is distributed under the terms of both

* [Apache License, Version 2.0](https://choosealicense.com/licenses/apache-2.0)
* [MIT License](https://choosealicense.com/licenses/mit)

at your option.



## Credits

* All the people who work on
[Click](https://github.com/pallets/click)
* All the people involved in the
[Python packaging](https://github.com/pypa)
ecosystem
* All the people involved in the
[pytest](https://github.com/pytest-dev)
ecosystem
* [Ned Batchelder](https://twitter.com/nedbat)
, for his
[Coverage.py](https://github.com/nedbat/coveragepy)
is the unsung heroic tool of the Python community. Without it, users would be exposed to more bugs before we are.
* [Te-jé Rodgers](https://github.com/te-je)
for bestowing me the name
`hatch`
on
[PyPI](https://pypi.org/)



## History

Important changes are emphasized.



### master

* Significant improvements to documentation
* `MANIFEST.in`
now considers users' files from
`extras`
config entry



### 0.4.0

* **Change:**
`egg`
command is now
`new`
* Removed
`download_url`
attribute from
`setup.py`
. See:
[https://github.com/pypa/python-packaging-user-guide/pull/264](https://github.com/pypa/python-packaging-user-guide/pull/264)



### 0.3.0

* Initial release

Source: https://github.com/ofek/hatch

