---
title: Building Web Applications From the Ground Up（Part 2）
---

_This post is part of a series of mine on building web applications from the ground up. It covers everything you need to know to completely finish a web application. If you haven’t been following the series, please go back and _[_read part 1_](https://michaelwashburnjr.com/building-webapp-tutorial-p1/)_. _

In this part, I’ll show you how to start building an API using the Django REST Framework. Furthermore, this section will cover proper project setup as well as structure.

[**The GitHub repository for this example API project can be found here.**](https://github.com/mdw7326/DjangoRestApiExample)

### Environment Setup

To start working on your API, you’ll want to make sure you have the following:

* [Git](https://git-scm.com/downloads)
* A command line environment that you’re comfortable using. I prefer using
  [Git Bash](https://git-scm.com/downloads)
  , as I prefer a Unix like environment over windows. It’s stable, it’s small, and it’s simple.
* A good text editor or IDE. I like to use
  [Sublime Text 3](https://www.sublimetext.com/3)
  for projects like this. I know many people who prefer other environments such as Atom or PyCharm. However, I like the speed and features of Sublime 3 the best.
* [The latest \(stable\) distribution of Python 3](https://www.python.org/downloads)
  .
* [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en)
  , a chrome app for easily testing HTTP requests.

### Project Setup

The first thing you should do to setup your project is create your repository. I typically will create a free repository on[GitHub](https://github.com/). However, if you_do _have private repositories, you may want to consider the trade-offs between having an open or closed source project. However, having some kind of source control is crucial for development. If you’re not already familiar with the benefits of using source control,[swing on over to this blog post](http://www.codeservedcold.com/version-control-importance/).

#### Setting up a GitHub Repo

If you don’t already have a GitHub account,[sign up for one first](https://github.com/join). If you’re currently a student, I highly recommend signing up for the[student developer pack](https://education.github.com/pack).

After you’ve logged in, locate the button to create a new repository as shown below.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/github-new-repo.jpg)



This will bring you to a short form as shown below. Fill this out with some basic information for your project. Now, If you have private repositories and want this project to be private, go ahead and click the Private option. Check the box to initialize the project with a ReadMe, select the Python .gitignore file, and select the license you’d like your project to have \(if you need help choosing a license, see[ChooseALicense.com](https://choosealicense.com/)\). Once you’re done on this page, click Create Repository.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/github-repo-form.jpg)

Now, go to your repository page and click the clone or download button. Click the button to “clone with ssh”. If you don’t have a SSH key setup on your laptop, check out [this tutorial for creating one](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/). Then, open your command line environment in the folder where you want to store your projects. I typically make a folder named “dev” for all of my programming work. First, open your command line environment in the folder you wish to clone the repository into. After that, clone the repository onto your machine by typing the following in your command line \(filling in the URL with the link copied from GitHub\).

```
git clone URL
```

#### Creating a Python Virtual Environment

Using virtual environments in Python allows you to keep packages needed to run this project separate from your system’s Python environment. This may not be a big deal if you’re only using your computer to run one Python project, but as you install different requirements for various projects you could run into issues. It’s considered the best practice to use a separate virtual environment for each project you’re working on. And it’s easy to do in Python.

To create a new virtual environment, first install the virtualenv Python package:

pip install virtualenv

Next, run the following in the command line within the project folder:

```
virtualenv venv
```

This will generate a virtual environment directory which is essentially a sandboxed Python environment. Any python packages you install when this virtual environment is activated will only be installed into this folder. Likewise, you will need to use this virtual environment to run your application. Note that the “venv/” directory should already be added to your .gitignore file; virtual environments should never be committed to version control. While we’re on the subject of the ._gitignore_though, you should also add _db.sqlite3 _at the top of your ._gitignore_file. This will make it so the development database is not committed to the repository.

Anyways, you can use the virtual environment like so:

```
# activate the virtual environment (windows)
.\venv\Scripts\activate
# activate the virtual environment (emulated linux cmd line on windows, e.g. Git Bash)
source ./venv/Scripts/activate
# activate the virtual environment (linux)
source ./venv/bin/activate

# install python packages into this virtual environment
pip install django

# run python scripts using this environment
python my-script.py

# deactivate the environment when you're finished
deactivate
```

#### Initialize this Project as a Python Package

Making your project a pip intallable Python Package has many benefits. The two that sell me on it is that you can use absolute module paths within your application, and that you can package you can leverage a package manager like PIP as a means to manage your app’s versions and dependencies.

To make your Python project a fully fledged package, you’ll need to create a setup.py file. At the root level of your repository, add a setup.py file like below:

```
from distutils.core import setup

setup(
    name='todo_api',
    version='0.1',
    description='A ToDo List API built with Django REST Framework',
    author='Michael Washburn Jr',
    author_email='michael@michaelwashburnjr.com',
    url='https://github.com/mdw7326/DjangoRestApiExample',
    packages=find_packages(),
    install_requires=[]
)
```

Once we initialize the Django project, you can do install the package by running the following from the command line in the root folder of your repository:

```
pip install -e .
```

#### Initialize the Django Project

Now that the basic package structure is there, we can initialize our API project. I like using Django for projects like this. Specifically, I prefer Django REST Framework for API development. It leverages the Django Models that are super simple to work with, and enhances the views in Django to make building RESTful APIs super simple.

To initialize the Django project, we first have to install some dependencies \(remember to activate your virtual environment\):

```
pip install django djangorestframework
```

Remember to keep the install\_requires section of your _setup.py_file up-to-date with the latest installed dependencies. You can do this by running the following:

```
> pip freeze
Django==1.11.4
djangorestframework==3.6.3
pytz==2017.2
```

Then, you can put the output into your setup.py file like so:

```
# setup.py
setup(
    # ...other settings

    install_requires = [
        'Django==1.11.4',
        'djangorestframework==3.6.3',
        'pytz==2017.2',
    ]
)
```

Now, make a new Django app.

```
django-admin.py startproject todo_api
```

Now that we have a Django project, we have to enable the Django REST Framework by adding it to the _settings.py_file.

```
# settings.py

INSTALLED_APPS = (
    ...
    'rest_framework',
)
```

The project itself is now setup. You can start the development server by running:

```
python src/manage.py runserver
```

To see it running, go to _localhost:8000 _in your browser.



However, our project is missing models for storing data , serializers for converting data to JSON, and views for getting and returning the data.

Inside _src/todo\_api, _create 3 new folders named _models/_, _serializers/_, and _views/_. Inside each folder put an empty file named  _\_\_init\_\_.py._This is how Python denotes a folder as a module.

#### Create a Test View

Inside your _views_/ folder create a new file named _test.py_. In this file we’re going to make a quick endpoint to make sure everything is functioning correctly.

```
# todo_api/views/test.py

from django.http import HttpResponse

def test_view(request):
  html = "<html><body>Hello, World!</body></html>"
  return HttpResponse(html)
```

Now, add the view in your _urls.py_file.

```
# todo_api/urls.py
from django.conf.urls import url
from django.contrib import admin

# notice you can use absolute module paths (which you should)
from todo_api.views.test import test_view

urlpatterns = [
  url(r'^$', test_view),
  url(r'^admin/', admin.site.urls),
]
```

After the url has been added, run your development server and navigate to_localhost:8000._You should see the “Hello, World!” text we added.

![](https://michaelwashburnjr.com/wp-content/uploads/2017/08/test_view-1.jpg)

That’s it! Our project is now all set up. Woohoo!

In the next section I’ll be covering Django API development and testing. But, if you’re too excited to stop working now, take a look at the [Django REST Framework Quickstart guide](http://www.django-rest-framework.org/#quickstart).

_**Stuck? Let me know if you have any questions.**_

_Part 3 will be available next week on 8/29._



Source: https://michaelwashburnjr.com/building-webapp-tutorial-part-2/

