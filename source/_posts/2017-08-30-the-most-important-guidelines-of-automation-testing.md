---
title: The Most Important Guidelines of Automation Testing
---

#
# Overview

There is no doubt about the importance of using automated testing during a testing process, in this article, I will review the most important guidelines that you should use to achieve the best results from your automated process.  

## ![](http://img2.tuicool.com/jEbQjiv.png!web)

## Write a clear and efficient code

Just like any other development project, you must write a clear and efficient code that you can run under a reasonable time, just think about the number of tests that you run even on the smallest automation project, there are hundreds and sometimes thousands of tests that you need to run over and over again, therefore, if the code is no efficient it will affect the timelines and reduce the number of executions.  

## [ ](https://www.blogger.com/null)

## Uncertainty as the automation worst enemy

One of the main and most important criteria to determine the quality of a good automation project is the ability to provide consistent results every time we run it.

### **So how can we remove this uncertainty?**

1. Remove unstable tests.
2. Do not automate unstable functionality.
3. Make sure that each test is verified manually.
4. Make sure that your code is up to date.
5. Make sure that you change the testing data if requirements are changed.
6. Make sure that you run on steadiness environments.
7. Make sure that you are using reliable builds of the application.
8. Make sure that each test case and code implementation is reviewed.
9. Make sure that each new code is approved before release it to the main branch. 

## Determining the Failure Gates

No matter how good the automation code is, it was designed to find defects in the tested application, as a result, we must make sure that in a case of a failure, it will be easy to understand what was the root cause of the failed test without spending a Hugh amount of time to explore the cause.

Therefore, when writing an automation, we must think about different ways to reduce the debugging time such as Automated defect reporting, Logs and any other information that will improve the debugging process.

## [ ](https://www.blogger.com/null)

## Know when to automate

There are many keys that will determines the success of the automation project, but the knowing of**when**to automate is probably the most critical one since test automation is a very delicate process that can be frustrating if used at the wrong time. Two simple Examples:

* Automation created before understanding the requirements and specifications.
* Automation run on unstable product builds.

## Maintainable

After the first implementation of the automation code, you should validate that the code is always updated to support new features that where added, modified or removed from the application during time.

## Automation reports

After every test execution, you will need to generate a report that explains the test results, to make it efficient, please follow the next guidelines:  

* In a case of failure, a link to the debugging information collected during the execution.
* The report is sent automatically to the relevant people.
* Link to the labs that used to run the tests.
* The report should be clear to the reader.
* Details about the tests that failed/pass.
* The name of the Automation owner.  
* Execution Start and End time. 

## Know which test cases to automate

There is an endless amount of test cases that we can run during a testing cycle, but in reality, we just cannot afford the time to write and execute them, so just like in manual testing, we will need to determine which test cases should be automated based on a few simple factors:

* Automate the test cases that will increase the automation ROI.
* Automate any test case that requiring an intensive precision.
* Automate any test that is part of the regression cycle.
* Automate test cases that you cannot perform manually.
* Automate any test case that executed repeatedly.
* Automate any test case that is time-consuming.
* Automate any test case that runs per build.
* Automate high-risk scenarios.

### **And what about the test cases that you should not automate?**

* Do not automate test cases for which the requirements are changing multiple times \(The maintainability of such cases will reduce the automation ROI\).
* Do not automate test cases that reside under “Usability” testing.
* Do not automate the application GUI if the objects are frequently modified.
* Do not automate test cases that are not verified manually.
* Do not automate Ad-Hoc random tests. 

## Know the answer for “Why to automate? “

Without knowing the answer for the above question, you should not start any automation project, it’s a major key to understanding the drive to behind the decision to automate and in addition will help to reduce the expectation gap between test/automation team and management.

## [ ](https://www.blogger.com/null)

## Automation will not fix all problems

We should always remember that the primary reason to implement an automation process in to free up the manual testers time, so they can design more complex and high-risk test cases, increase the knowledge in the application being tested and perform exploratory testing which helps to increase the confidence in the product.

Automation will not fix all problems, do not expect automation to reveal all bugs and problems, the number of bugs found by automation will always be lower that the number of defects found by exploratory and manual testing.

### **If you still not convinced, know this:**

* Automation will not help you if you have chaos in the current testing effort.
* Automation testing will consume a large amount of time and resources.
* Automation will not help you if you already behind schedule.
* Automation testing will not replace manual testing.
* Automation testing will not eliminate the basic testing process of Test Design, planning and writing. 

## Automate only what is necessary

When designing an automation project, you should always consider the time and investment factors, therefore, adding an unnecessary test case will affect the ROI of the entire project, therefore, you should always remember that your automation should cover only the necessary test cases, there is no benefit in writing tests that will not contribute to the testing coverage.

**In addition, before determining the test cases to automate, just ask yourself a few basic questions:**

* What maintenance should be performed to adjust this test in future/other versions?
* What is the preparation involving in creating the test?
* Is the test case can be used in future versions?
* Is the test expected results are defined?
* Do you have the test data for this test?
* What is the objective of the test case?
* Do you have the Pass/Fail criteria?

**If you still have thoughts, think about the tasks and consequences involve in creating a new test case:**

**Tasks**

* Design the test case.
* Write it down.
* Write the code.
* Maintain it.
* Review the execution results.

**
Consequences**

* The Automation execution time is increased.
* You will loose this time to write test cases that will really contribute to the overall testing effort. 

## Independent tests

In a case of test failure, you will want to debug the ROOT cause of the problem as fast as you can, the last thing we want to do is to our time investigating numerous automation steps that can affect the failed test.

Independent tests, will allow you to understand the cause of the failure faster and will remove the dependency in another automation step. Another Hugh advantage in creating independent tests is the ability to run each test separately as a single unit without any relation to the other tests. 

## You must be familiar with the application being tested

Automated testing should be treated in the same way as manual testing, the resources are responsible for building and designing the test scenarios must be familiar with the application being tested, which includes:

* Know the technologies used to develop the software.
* Know the main flows of the End to End scenarios.
* Remember, there is no other way beside knowing your product, this is the only way to achieve the best and efficient testing process. 
* Know the architecture of the application.
* Know which platforms are supported.

## Planning prior to implementation

Just like any other project, you cannot write any code line prior to knowing the different aspects that come prior to the implementation, just for example:

* Determine the testing tools and programming language that you will use.
* Understand the deliverables of the automation project.
* Select the appropriate automation Framework
* Understand the set of expectations.
* Preparing the automation design
* The expected test coverage. 

## Build the right automation team

Selecting the right automation tool is very important, but it is more important to hire the person/team that will use it during the developing phase. My recommendations:

* Hire an automation architect that will design the automation architecture.
* Manual testers should focus on manual testing if you want them to automate, make sure that they are dedicated only to the automated testing work.
* The team must include at least one authority that can lead the technical aspects and guide the other automation engineers.
* Manual testers are not programmers, do not ask them to program without the appropriate training.
* Make sure that your team contains enough resources to meet the project requirements.

## Manual verification before automate

Before automating your tests, you must verify that each test case is tested and verified manually, if you decide to skip this phase, you will have trouble to understand the source of failures during the automated process \(Failure is due to a coding problem or does it happen due to a real product bug?\).

Another consequence of skipping the manual verification is that it will consume more time to stop the coder work and start the investigation about the failure if you do the manual verification, you will make sure that the coder will reduce the investigation time which allowing him to keep its focus. 

## Choose the automation tool which is known to your team members

You can spend thousandsof dollars to buy the best automated tool, but if your team resources are not familiar with this tool they will fail to get the most of it and probably waste more time in learning it than do the actual development.

**Therefore, when selecting the automation tool, we should follow a few basic guidelines:**

* If your resources have older experience in automation tool that meets the project requirements than select it, their experience will help you to meet the targets quicker.
* When selecting the tool, ask yourself if you can use it in future projects.
* Select the tool that is most suitable to meet the project requirements.
* Select the automation tool that allowing your team to develop in a programming language that their familiar with \(C\#, Java etc.\).





Source:http://www.machtested.com/2017/08/best-practices-for-test-automation.html


