---
title: Better Software Design with Clean Architecture
---

![](http://img1.tuicool.com/vqIfaeY.png!web)

Have you ever produced code that:

* was bug laden
* was painful to debug or enhance with new features
* was hard/impossible to test without things like a database or web server
* had presentation logic mixed with business logic or business logic mixed in with data access logic \(sql\)
* was hard for other developers to understand because it did not clearly express its intent or purpose within the application it was written for

I know I have. Over time I learned about the various[Gang of Four](https://en.wikipedia.org/wiki/Design_Patterns)patterns and made a conscious effort to keep the[SOLID](https://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29)principles running on a background thread in my mind as I wrote code. While these ideas certainly helped mitigate the problems listed above, they didn't eliminate them. When writing web or desktop software using MVC or MVVM I still found some of the same old symptoms showing up in my projects. Things like business logic leaking into controllers, entity models being used all over the place for different purposes and large regions of the code that had no unit test coverage because they had some sort of direct dependency on a database or http client.

Get notified on new posts

Straight from me, no spam, no bullshit. Frequent, helpful, email-only content.

## The answer

One day, a colleague sent around[this link](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html)introducing**The Clean Architecture**by Uncle Bob. It resonated with me instantly as it presented a solution for the same problems I was seeing. The best part, there's nothing mystical or complicated about Clean Architecture - it is a relatively simple and practical architecture template that can be applied to many application domains if you choose to follow just a few of its basic rules.

## How Clean Architecture works

The key rule behind Clean Architecture is:**The Dependency Rule**. The gist of this is simply that dependencies are encapsulated in each "ring" of the architecture model and these dependencies can only point inward.

![](http://img1.tuicool.com/U3MBbem.jpg!web)

Clean Architecture keeps details like web frameworks and databases in the outer layers while important business rules and policies are housed in the inner circles and have no knowledge of anything outside of themselves. Considering this, you can start to see how it achieves a very_clean_separation of concerns. By ensuring your business rules and core domain logic in the inner circles are completely devoid of any external dependencies or 3rd party libraries means they must be expressed using pure C\# POCO classes which makes testing them much easier.

In fact your business rules simply don’t know anything at all about the outside world.

There are a few other important concepts that I'm going to highlight along the way with an example below but if you're interested in just the theory please go check out[Uncle Bob's original post introducing Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html).

### Implementing the "Course Registration" use case

Let's see how this works using a real-world use case. For the folks doing agile scrum, I realize a use case is not the most fashionable way to describe a requirement. But for this post, it's perfect because I'd like to show how all the details of the use case can be modeled within clean architecture. A user story would simply be too vague.

I've typed out the entire use case here for reference so you don't need to digest the whole thing right now. We'll cover its aspects below in detail as we walk through implementing it using clean architecture.

| Title | Register for courses |
| :--- | :--- |
| Description | Student accesses the system and views the courses currently available for him to register. Then he selects the courses and registers for them. |
| Primary Actor | Student |
| Preconditions | Student is logged into systemStudent has not previously enrolled or registeredStudent cannot register within 5 days of course start date |
| Postconditions | Student is registered for courses |
| Main Success Scenario | Student selects "Register New Courses" from the menu.System displays list of courses available for registering.Student selects one or more courses he wants to register for.Student clicks "Submit" button.System registers student for the selected courses and displays a confirmation message. |
| Extensions | \(2a\) No courses are available for this student.System displays error message saying no courses are available, and provides the reason & how to rectify if possible.Student either backs out of this use case, or tries again after rectifying the cause.\(5a\) Some courses could not be registered.System displays message showing which courses were registered, and which courses were not registered along with a reason for each failure.\(5b\) None of the courses could be registered.System displays message saying none of the courses could be registered, along with a reason for each failure. |

This is a simple use case allowing a student to register for one or more classes and then returning either a success or error result to notify her of the outcome. We'll use clean architecture to write this use case in a fashion that meets the goals and avoids the problems I mentioned in the intro.

### Creating the Entities

Entities are the heart of clean architecture and contain any_enterprise-wide_business rules and logic. Now, you might not be working in the context of an_enterprise_and that's perfectly fine. If you're writing a standalone application Uncle Bob suggests simply referring to these as Business Objects. The key is that they contain rules that are not_application specific_- so basically any global or shareable logic that could be reused in other applications should be encapsulated in an entity.

Inspecting our use case there are 2 entities we need:`Student`and`Course`.

Using aTDD approach I wrote a couple of tests and just enough code in the[Student entity class](https://github.com/mmacneil/CleanArchitecture/blob/master/CleanArchitecture.Core/Entities/Student.cs)to get them passing.

The`RegisterForCourse()`method implements 2 rules from our use case.

```
public
class
Student
 : 
EntityBase

{
   
public
string
 FirstName { 
get
; 
set
; }
   
public
string
 LastName { 
get
; 
set
; }
   
public
 IList
<
Course
>
 RegisteredCourses { 
get
; }
   
public
 IList
<
Course
>
 EnrolledCourses { 
get
; 
set
; }

   
public
Student
(
)
   
{
      RegisteredCourses = 
new
 List
<
Course
>
();
      EnrolledCourses = 
new
 List
<
Course
>
();
   }

   
public
bool
RegisterForCourse
(
Course course
)
   
{
      
// student has not previously enrolled
if
 (EnrolledCourses.Any(ec =
>
 ec.Code == course.Code)) 
return
false
;

      
// registration cannot occur with 5 days of course start date
if
 (DateTime.UtcNow 
>
 course.StartDate.AddDays(
-5
)) 
return
false
;

      RegisteredCourses.Add(course);
      
return
true
;
   }
}
```

```
[Fact]

public
void
CannotRegisterForCourseWithin5DaysOfStartDate
(
)

{
  
// arrange
var
 student = 
new
 Student();
  
var
 course = 
new
 Course { Code = 
"BIOL-1507EL"
, Name = 
"Biology II"
, StartDate = DateTime.UtcNow.AddDays(+
3
) };

  
// act
var
 result = student.RegisterForCourse(course);

  
// assert

  Assert.False(result);
}

[Fact]

public
void
CannotRegisterForCourseAlreadyEnrolledIn
(
)

{
  
// arrange
var
 student = 
new
 Student
  {
     EnrolledCourses = 
new
 List
<
Course
>

     {
       
new
 Course { Code = 
"BIOL-1507EL"
, Name = 
"Biology II"
 },
       
new
 Course { Code = 
"MATH-4067EL"
, Name = 
"Mathematical Theory of Dynamical Systems, Chaos and Fractals"
 }
             }
     };

 
// act
var
 result = student.RegisterForCourse(
new
 Course { Code = 
"BIOL-1507EL"
 });

 
// assert

 Assert.False(result);
}
```

### Use Cases

Moving up from the entities we have the_Use Case_layer. The classes that live here have a few unique features and responsibilities:

* Contain the
  _application specific_
  business rules
* Encapsulate and implement all of the use cases of the system. A good rule to start with is a class per use case
* Orchestrate the flow of data to and from the entities, and can rely on their business rules to achieve the goals of the use case
* Have NO dependency and are totally isolated from things like a database, UI or special frameworks
* Will almost certainly require refactoring if details of the use case requirements change

Use case classes are typically suffixed with the word**Interactor**. Uncle Bob mentions in[this talk](https://www.youtube.com/watch?v=0oGpWmS0aYQ)that he considered calling them controllers but assumed this would be too easily confused with MVC so Interactor it is!

Our use case is modelled in[RequestCourseRegistrationInteractor.cs](https://github.com/mmacneil/CleanArchitecture/blob/master/CleanArchitecture.Core/UseCases/RequestCourseRegistrationInteractor.cs).

There are a few important aspects of the use case class I'd like to highlight.

First off, it implements the[IRequestHandler](https://github.com/mmacneil/CleanArchitecture/blob/master/CleanArchitecture.Core/Contracts/IRequestHandler.cs)interface. This interface is an example of the[mediator pattern](http://www.dofactory.com/net/mediator-design-pattern)which dictates that implementors will work with a certain request and response object in a loosely coupled fashion.

```
public 
class
RequestCourseRegistrationInteractor
 : 
IRequestHandler
<
CourseRegistrationRequestMessage, 
CourseRegistrationResponseMessage
>

...
```

There is a single`TResponse Handle(TRequest message)`method defined on the interface which essentially performs_all the work_of our use case. Pretty simple huh?_Handle\(\)_takes a request object as its lone parameter which will typically contain any data passed in from the outer layer \(the UI\) and returns a response message with both types dictated by the`IRequestHandler`interface. All of our_application specific_logic for the use case will go into this method.

One key aspect of the request/response messages that flow in and out of use case interactors and across boundaries is that they are simple data structures meaning they contain no special types: ie. entities, or types provided by 3rd party libs etc. - they are pure C\# objects.

```
public
class
 CourseRegistrationRequestMessage : IRequest
<
CourseRegistrationResponseMessage
>

{
  
public
int
 StudentId { 
get
; 
private
set
; }
  
public
 List
<
string
>
 SelectedCourseCodes { 
get
; 
private
set
; }

  
public
 CourseRegistrationRequestMessage(
int
 studentId,List
<
string
>
 selectedCourseCodes)
  {
    StudentId = studentId;
    SelectedCourseCodes = selectedCourseCodes;
  }
}
```

The_CourseRegistrationRequest_object consists of only a StudentId and a list of selected course codes selected by the user.

Here's the full implementation of[RequestCourseRegistrationInteractor.cs](https://github.com/mmacneil/CleanArchitecture/blob/master/CleanArchitecture.Core/UseCases/RequestCourseRegistrationInteractor.cs)

```
public
class
RequestCourseRegistrationInteractor
 : 
IRequestHandler
<
CourseRegistrationRequestMessage, CourseRegistrationResponseMessage
>

{
  
private
 readonly IStudentRepository _studentRepository;
  
private
 readonly ICourseRepository _courseRepository;
  
private
 readonly IAuthService _authService;
  
public
 RequestCourseRegistrationInteractor(IAuthService authService, IStudentRepository studentRepository, ICourseRepository courseRepository)
  {
    _authService = authService;
    _studentRepository = studentRepository;
    _courseRepository = courseRepository;
  }


public
 CourseRegistrationResponseMessage Handle(CourseRegistrationRequestMessage message)
{
   
// student must be logged into system
if
 (!_authService.IsAuthenticated())
   {
     
return
 new CourseRegistrationResponseMessage(
false
,
null
,
"Operation failed, not authenticated."
);
   }

   
// get the student
var
 student = _studentRepository.GetById(message.StudentId);

   
// save off any failures
var
 errors = new List
<
string
>
();

   foreach (
var
 c 
in
 message.SelectedCourseCodes)
   {
     
var
 course = _courseRepository.GetByCode(c);

     
if
 (!student.RegisterForCourse(course))
     {
         errors.Add($
"unable to register for {course.Code}"
);
     }
   }

   _studentRepository.Save(student);
   
return
 new CourseRegistrationResponseMessage(!errors.Any(), errors);
}
```

Note the use of`_authService`,`_studentRepository`and`_courseRepository`. These services are typically referred to as_Gateways_within clean architecture and get injected into the Use Case layer as per the dependency rule. These are the things that deal with the database, rest services or other external agencies and their implementation belongs in the_Interface Adapters_layer. Interactors only know_what_behavior these gateways offer by way of their interface definition. They have no idea_how_they do their work because those details are encapsulated in an outer layer which the Use Cases know nothing about.

### Interface Adapters

The purpose of the interface adapter layer is to act as a connector between the business logic in our interactors and our framework-specific code. For example, in an ASP.Net MVC app, this is where the models, views, and controllers live. Gateways like services and repositories are also implemented here.

It is this layer, for example, that will wholly contain the MVC architecture of a GUI. The Presenters, Views, and Controllers all belong in here.

Also in this layer is any other adapter necessary to convert data from some external form, such as an external service, to the internal form used by the use cases and entities.

In this example I'm using a basic console app to consume my use case so this serves as my interface adapter layer. It contains the concrete implementations of the required[Gateways](https://github.com/mmacneil/CleanArchitecture/tree/master/CleanArchitecture.ConsoleApp/Gateways)and has[Presentation](https://github.com/mmacneil/CleanArchitecture/tree/master/CleanArchitecture.ConsoleApp/Presentation)logic to format the response from the Use Case into something friendly for the UI.

In the Main\(\) method we can see the usage of calling the use case and presenting the results.

```
//
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
**
// Here we're connecting our app framework layer with our Use Case Interactors
// This would typically go in a Controller Action in an MVC context or ViewModel in MVVM etc.
//
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
*****
**
// 1. instantiate Course Registration Use Case injecting Gateways implemented in this layer
var courseRegistraionRequestUseCase = new RequestCourseRegistrationInteractor(authService, studentRepository, courseRepository);

// 2. create the request message passing with the target student id and a list of selected course codes 
var useCaseRequestMessage = new CourseRegistrationRequestMessage(1, new List
<
string
>
 { userInput.ToUpper() });

// 3. call the use case and store the response
var responseMessage = courseRegistraionRequestUseCase.Handle(useCaseRequestMessage);

// 4. use a Presenter to convert the use case response to a user friendly ViewModel
var courseRegistraionResponsePresenter = new CourseRegistrationRequestResponsePresenter();
var vm = courseRegistraionResponsePresenter.Handle(responseMessage);

Console.Clear();

// render results

if (vm.Success)
{
  Console.BackgroundColor = ConsoleColor.DarkGreen;
  Console.ForegroundColor = ConsoleColor.White;
}
else
{
  Console.BackgroundColor = ConsoleColor.Red;
  Console.ForegroundColor = ConsoleColor.White;
}
Console.WriteLine();
Console.WriteLine(vm.ResultMessage);
Console.WriteLine();
```

#### Presentation

We'd like to show something friendly to the user when we get a response back from the interactor. To accomplish this, I created[CourseRegistrationResponsePresenter](https://github.com/mmacneil/CleanArchitecture/blob/master/CleanArchitecture.ConsoleApp/Presentation/CourseRegistrationResponsePresenter.cs)which has the single responsibility of converting a_CourseRegistrationResponseMessage_into a_CourseRegistrationResponseViewModel_. I'll mention again that the response message and viewmodel are POCO objects containing no special types or data structures, just everyday collection and value types.

```
public
class
CourseRegistrationResponsePresenter

{
  
public
 CourseRegistrationResponseViewModel 
Handle
(
CourseRegistrationResponseMessage responseMessage
)
  
{
    
if
 (responseMessage.Success)
    {
         
return
new
 CourseRegistrationResponseViewModel(
true
,
"Course registration successful!"
);
    }

    
var
 sb = 
new
 StringBuilder();
    sb.AppendLine(
"Failed to register course(s)"
);
    
foreach
 (
var
 e 
in
 responseMessage.Errors)
    {
       sb.AppendLine(e);
    }

    
return
new
 CourseRegistrationResponseViewModel(
false
,sb.ToString());
  }
}
```

### Frameworks and Drivers

This layer contains tools like databases or frameworks. By default, we don’t write very much code in this layer, but it’s important to clearly state the place and priority that those tools have in the architecture.

### Summary

_Clean Architecture_provides a simple and effective framework for separating the different aspects of our system producing a highly decoupled, testable architecture.

Let's recap some key benefits:

* Use Cases are encapsulated in one place meaning they are **very visible and easier to understand**. Business rules are not scattered all over the place making debugging and modification of the code painful.

* The Dependency Rule and use of abstracted Gateways mean the core business logic in our Interactors and Entities is**easily testable**and not hampered by external things like databases and RESTful web services. The lack of 3rd party, feature-laden frameworks in our business logic also means thecode there is only focused on the important rules and policies of our application.

* Flexibleand**portable**- because the Use Cases are completely decoupled from any UI or infrastructure it's easy to do things like switch the database or web framework or even port to an entirely new platform. Our example runs in a console app but it could just as easily work on the web, desktop or a phone.

Like most design decisions there are tradeoffs to be made when considering Clean Architecture. For the benefits I highlighted there are also a few disadvantages:

* Your team's ability to ramp up and effectively apply Clean Architecture. There's nothing radically complex in here but there certainly is a learning curve and time required to adapt to any new design or architectural style.

* Applying Clean Architecture adds some bloat in the form of many separate classes for all the Presenters, Use Case Request/Response dtos, Use Case Interactors, Entities, Gateways etc plus all the test cases :\). Not a huge deal but a valid knock on the impact of this approach to the size of your project.

I hope this guide has provided some insight on how Clean Architecture can improve your software design and prevent many of the common pitfalls that hinder projects. Like any pattern, it takes a little familiarity with the concepts and principles before they can be effectively applied. A good exercise to start might be to think of some use cases near and dear to you currently - can you map them out mentally using Clean Architecture? Do you have a sense of the Entities, what the Use Case Interactor might look like, what data needs to flow back and forth in the request and response messages? Running your use cases through these questions can help you get started in modeling them using Clean Architecture.

Thanks for reading!

[source code](https://github.com/mmacneil/CleanArchitecture/)

Get notified on new posts

Straight from me, no spam, no bullshit. Frequent, helpful, email-only content.



Source: [https://fullstackmark.com/post/11/better-software-design-with-clean-architecture](http://www.tuicool.com/articles/hit/YBj6ZvE)

