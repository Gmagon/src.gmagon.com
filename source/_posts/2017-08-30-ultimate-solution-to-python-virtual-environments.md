I
love using the Command Line; it's my favourite part of programming. It wasn't always this way. I used to worry that the commands I entered would destory the delicate equilibrium where everything_just worked_. Would this be the`pip install`that ended it all?

Enter virtual environments.

A**virtual environment**\(venv\) is a tool that allows us to keep project dependencies isolated. If Project A requires pandas version 0.17 and Project B requires pandas version 0.21, we can create a venv for each project and keep workflows independent. More info in the[Python documentation](https://docs.python.org/3/library/venv.html#venv-def).

It's been around a year since I started using virtual environments in my projects, but I had yet to find the perfect dev workflow.

Tried[Anaconda](https://www.continuum.io/what-is-anaconda); it was too bloated for non-Data Science work.

Next came[virtualenv](https://virtualenv.pypa.io/en/stable/)+[virtualevnwrapper](http://virtualenvwrapper.readthedocs.io/en/latest/). Did everything I wanted, but I had to manually manage Python installations when setting up environments for different versions.

Like everyone who learns Docker, I went thru a[containerize all the things phase](https://dev.to/alysivji/containerized-development-environments.html). The non-existent battery life on my Mac told me this wasn't the most feasible solution.

Then I found pyenv...

![](http://img2.tuicool.com/A36zQfQ.jpg!web)

In this post, I will describe how to install pyenv and pyenv-virtualenvwrapper. I will also walk through the steps required to setup and use a new virtual environment.

## pyenv

[pyenv lets you easily switch between multiple versions of Python](https://github.com/pyenv/pyenv#simple-python-version-management-pyenv)

### Background

Anytime we run a command, the OS goes looking for the executible within the list of directories in the`$PATH`environment variable.

```
$ echo $PATH
/Users/alysivji/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/alysivji/bin
$ which python
/usr/bin/python
$ which python3
/usr/local/bin/python3
```

We see both the default Python and Python3.6 installations are located in the`$PATH`var.

When we install pyenv, we add an additional directory of[shims](https://en.wikipedia.org/wiki/Shim_%28computing%29)to the front of our`$PATH`. Each shim intercepts commands \(`python`,`pip`, etc\) and redirects them to the appropriate location.

### Installation

Check the project's Github for[detailed installation instructions](https://github.com/pyenv/pyenv#installation). These instructions assume you have macOS +[Homebrew](https://brew.sh/)installed.

```
brew update
brew install pyenv
```

Add the following line to ~/.bash\_profile`:`

```
eval "$(pyenv init -)"
```

Let's make sure our installation worked:

```
$ source ~/.bash_profile
$ echo $PATH
/Users/alysivji/.pyenv/shims:/Users/alysivji/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/alysivji/bin
```

Looks good! The shims at the front of our`$PATH`variable will intercept and redirect all python-related commands.

### Commands

We use`pyenv install --list`to get a list of all Python versions available for installation. Let's install a few different versions of Python so we can see how pyenv works.

```
pyenv install 2.7.13
pyenv install pypy-5.7.1
pyenv install 3.6.2
pyenv install 3.7-dev
```

Set the Python we want as our default version:

```
$ pyenv global 3.6.2
$ pyenv versions
system
2.7.13
* 3.6.2 (set by /Users/alysivji/.pyenv/version)
3.7-dev
pypy-5.7.1
```

How does the shim know which version of Python to use? It goes down the[hierarchy](https://github.com/pyenv/pyenv#choosing-the-python-version)until it finds what it's looking for.

Activate different versions of Python using the`pyenv shell [version]`command.

```
$ which python
/Users/alysivji/.pyenv/shims/python
$ python
Python 3.6.2 (default, Aug 24 2017, 00:00:01)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.42.1)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
$ pyenv shell 2.7.13
$ which python
/Users/alysivji/.pyenv/shims/python
$ python
Python 2.7.13 (default, Aug 24 2017, 00:14:24)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.42.1)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Notice how the pyenv shims take care of everything for us. Next, we'll learn how to create a`venv`.

## pyenv-virtualenvwrapper

[pyenv-virtualenvwrapper is a pyenv plugin ... to manage your virtualenvs with virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)

### Installation

Detailed[instructions](https://github.com/pyenv/pyenv-virtualenvwrapper)are on Github. macOS +[Homebrew](https://brew.sh/)users can follow along:

```
brew install pyenv-virtualenvwrapper
```

Append to`~/.bash_profile`:

```
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

Reload the shell:

```
source ~/.bash_profile
```

### Commands

Anytime we install a new version of Python, we will need to install virtualenvwrapper. This is done with either the`pyenv virtualenvwrapper`or`pyenv virtualenvwrapper_lazy`\(**preferred**\) command:

```
$ pyenv shell 3.6.2
$ pyenv virtualenvwrapper_lazy
Collecting virtualenvwrapper
Collecting stevedore (from virtualenvwrapper)
Using cached stevedore-1.25.0-py2.py3-none-any.whl
Collecting virtualenv (from virtualenvwrapper)
Using cached virtualenv-15.1.0-py2.py3-none-any.whl
Collecting virtualenv-clone (from virtualenvwrapper)
Using cached virtualenv-clone-0.2.6.tar.gz
Collecting pbr!=2.1.0,>=2.0.0 (from stevedore->virtualenvwrapper)
Using cached pbr-3.1.1-py2.py3-none-any.whl
Collecting six>=1.9.0 (from stevedore->virtualenvwrapper)
Using cached six-1.10.0-py2.py3-none-any.whl
Installing collected packages: pbr, six, stevedore, virtualenv, virtualenv-clone, virtualenvwrapper
Running setup.py install for virtualenv-clone ... done
Successfully installed pbr-3.1.1 six-1.10.0 stevedore-1.25.0 virtualenv-15.1.0 virtualenv-clone-0.2.6 virtualenvwrapper-4.7.2
```

Now we can use the[virtualenvwrapper shell commands](http://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html)to manage our environment:

```
$ mkvirtualenv venv_test
Using base prefix '/Users/alysivji/.pyenv/versions/3.6.2'
New python executable in /Users/alysivji/.virtualenvs/venv_test/bin/python3.6
Also creating executable in /Users/alysivji/.virtualenvs/venv_test/bin/python
Installing setuptools, pip, wheel...done.
virtualenvwrapper.user_scripts creating /Users/alysivji/.virtualenvs/venv_test/bin/predeactivate
virtualenvwrapper.user_scripts creating /Users/alysivji/.virtualenvs/venv_test/bin/postdeactivate
virtualenvwrapper.user_scripts creating /Users/alysivji/.virtualenvs/venv_test/bin/preactivate
virtualenvwrapper.user_scripts creating /Users/alysivji/.virtualenvs/venv_test/bin/postactivate
virtualenvwrapper.user_scripts creating /Users/alysivji/.virtualenvs/venv_test/bin/get_env_details
(venv_test) $ which python
/Users/alysivji/.virtualenvs/venv_test/bin/python
(venv_test) $ python
Python 3.6.2 (default, Aug 24 2017, 00:00:01)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.42.1)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

We can also switch between virtual environments using the`deactivate`and`workon`commands:

```
(venv_test) $ deactivate
$ workon venv_test
(venv_test) $ python
Python 3.6.2 (default, Aug 24 2017, 00:00:01)
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.42.1)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

That's pretty much it. We can create a virtual environment for any version of Python in two commands.

#### Notes

* `virtualenvwrapper_lazy`
[decreases shell load time](https://www.reddit.com/r/Python/comments/11e773/tip_virtualenvwrapper_has_a_lazy_version_you_can/)

## Conclusion

We should always look for ways to optimize our development workflows. There are tools out there to help us manage complexity and make our life easy. Find these tools. Use them. It'll make you more productive in the long run.



Source: [https://dev.to/alysivji/ultimate-solution-to-python-virtual-environments-pyenv--v](http://www.tuicool.com/articles/hit/jumQfqY)

