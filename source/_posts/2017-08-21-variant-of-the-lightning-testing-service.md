---
title: variant of the Lightning Testing Service
---

## Lightning Testing Service Part 2 - Custom Jasmine Reporter

![](http://img0.tuicool.com/YRrAnam.jpg!web)

\(Note: This blog applies to the Jasmine variant of the Lightning Testing Service\)

## Introduction

One of the cool things about Jasmine is how easy it is to add your own reporter. Compared to some of the other JavaScript testing frameworks I’ve used in the past, it’s entirely straightforward. Essentially you are implementing an interface, although as JavaScript doesn’t have interfaces it’s very much based on what you**should**rather than**must**implement. A Jasmine Reporter is a JavaScript object with the appropriate functions for the framework to call when something interesting happens. Even cooler is the fact that the framework first checks that you have provided the function before it is invoked, so if you don’t care about specific events, you just leave out the functions to handle those events and you are all good.

## Functions

Some or all of the following functions are required to handle the various events that occur as test are executed - basically things commencing and completing:

* jasmineStarted/jasmineDone - called before any specs \(tests\) execute/once all tests have completed
* suiteStarted/suiteDone - called before a specific suite \(group of tests\) execute/once they have completed
* specStarted/specDone - called before a specific test executes/once it has completed

Once you have your object with the desired functions, it must be registered before any tests are queued:

```
jasmine
.getEnv
()
.addReporter
(your_reporter);
```

and that’s all there is to it.

## Example

Below is an example lightning component that creates a simple reporter to capture the success/failure of each suite/spec and log information to the console. Note that this relies on the Jasmine artefacts installed by the latest version of the Lightning Testing Service unmanaged package. The component is named KABJasmineReporter:

### Component

```
<
aur
a:component
 extensible=
"true"
>
<
ltn
g:require
 scripts=
"{!join(',',

				$Resource.lts_jasmine + 
'/lib/jasmine-2.6.1/jasmine.js'
,
				$Resource.lts_jasmine + 
'/lib/jasmine-2.6.1/jasmine-html.js'
,
				$Resource.lts_jasmineboot
				)}
"

                  afterScriptsLoaded=
"{!c.doInit}"
 /
>
<
/aur
a:component
>
```

### Controller

```
({
	
doInit 
: 
function
(component, event, helper) {
		helper.
initialiseJasmineReporter
(component, event);
	}
})
```

### Helper

```
({
    myReporter : {
        content : 
''
,
        suites : [],
        totalSuccesses:
0
,
        totalFailures:
0
,
        totalTests:
0
,
        output : function(message) {
            console.log(message);
            
this
.content+=message;
        },
        clear: function() {
            
this
.content=
''
;
            
this
.suites=[];
            
this
.totalSuccesses=
0
;
            
this
.totalFailures=
0
;
            
this
.totalTests=
0
;
        },
        getCurrentSuite: function() {
            
return
this
.suites[
this
.suites.length
-1
];
        },
        getCurrentSpec : function() {
            
return
this
.getCurrentSuite().specs[
this
.getCurrentSuite().specs.length - 
1
];
        },
        jasmineStarted: function(suiteInfo) {
            
this
.output(
'Running suite with '
 + suiteInfo.totalSpecsDefined + 
' specs'
);
        },
        suiteStarted: function(result) {
            
this
.output(
'Suite started: '
 + result.description + 
' whose full description is: '
 + result.fullName);
            
this
.suites.push({name : result.fullName,
                              specs : []});
        },
        specStarted: function(result) {
            
this
.output(
'Spec started: '
 + result.description + 
' whose full description is: '
 + result.fullName);
            
this
.getCurrentSuite().specs.push({name: result.description,
                                               failures: [],
                                               failureCount: 
0
,
                                               successes: 
0
});
        },
        specDone: function(result) {
            
this
.output(
'Spec: '
 + result.description + 
' complete status was '
 + result.status);
            
this
.output(result.failedExpectations.length + 
' failures'
);
            
for
(
var
 i = 
0
; i 
<
 result.failedExpectations.length; i++) {
                
var
 failure=result.failedExpectations[i];
                
this
.output(
'Failure: '
 + failure.message);
                
this
.output(failure.stack);
                
this
.getCurrentSpec().failures.push({message: failure.message,
                                                     stack : failure.stack});
                
this
.getCurrentSpec().failureCount++;
                
this
.totalFailures++;
            }
            
this
.output(result.passedExpectations.length + 
' successes'
);
            
this
.getCurrentSpec().successes+=result.passedExpectations.length;
            
this
.totalSuccesses+=result.passedExpectations.length;
        },
        suiteDone: function(result) {
            
this
.output(
'Suite: '
 + result.description + 
' was '
 + result.status);
            
for
(
var
 i = 
0
; i 
<
 result.failedExpectations.length; i++) {
                
this
.output(
'AfterAll '
 + result.failedExpectations[i].message);
                
this
.output(result.failedExpectations[i].stack);
            }
        },
        jasmineDone: function() {
            
this
.totalTests=
this
.totalSuccesses+
this
.totalFailures;
	        
this
.output(
'Finished tests'
);
    	    
this
.output(
'Successes : '
 + 
this
.totalSuccesses);
	        
this
.output(
'Failures : '
 + 
this
.totalFailures);
	        
this
.output(
'Details : '
 + JSON.stringify(
this
.suites, 
null
, 
4
));
        }
    },
    initialiseJasmineReporter : function(component, event) {
        console.log(
'Initialising jasmine reporter'
);
        
var
 self=
this
;
        
this
.myReporter.clear();
        
var
 env = jasmine.getEnv();
        jasmine.getEnv().addReporter(
this
.myReporter);
    }
})
```

A couple of tweaks to the jasmineTests app to include my reporter \(and to limit to a couple of tests, otherwise there’s a lot of information in the console log\):

### App

```
<
aura:application
>
<
c:KAB_JasmineReporter
 /
>
<
c:lts_jasmineRunner
testFiles
=
"
{!join(',',
    	$Resource.jasmineHelloWorldTests
    )}
"
 /
>
<
/
aura:application
>
```

Executing the app produces the following console output:

```
Initialising jasmine reporter
Running suite with 
2
 specs
Suite 
started:
 A simple passing test whose full description 
is:
 A simple passing test
Spec 
started:
 verifies that 
true
 is always 
true
 whose full description 
is:
 A simple passing test verifies that 
true
 is always 
true
Spec:
 verifies that 
true
 is always 
true
 complete status was passed

0
 failures

1
 successes

Suite:
 A simple passing test was finished
Suite 
started:
 A simple failing test whose full description 
is:
 A simple failing test
Spec 
started:
 fails when 
false
 does not equal 
true
 whose full description 
is:
 A simple failing test fails when 
false
 does not equal 
true
Spec:
 fails when 
false
 does not equal 
true
 complete status was pending

0
 failures

0
 successes

Suite:
 A simple failing test was finished
Finished tests

Successes :
1
Failures :
0
Details :
 [
    {
        
"name"
: 
"A simple passing test"
,
        
"specs"
: [
            {
                
"name"
: 
"verifies that true is always true"
,
                
"failures"
: [],
                
"failureCount"
: 
0
,
                
"successes"
: 
1

            }
        ]
    },
    {
        
"name"
: 
"A simple failing test"
,
        
"specs"
: [
            {
                
"name"
: 
"fails when false does not equal true"
,
                
"failures"
: [],
                
"failureCount"
: 
0
,
                
"successes"
: 
0

            }
        ]
    }
]
```

## Conclusion

While this has been a simple example, there’s a lot more that can be done with custom reporters, such as posting notifications with the tests results, which I plan to explore in later posts.



Source: [http://bobbuzzard.blogspot.com/2017/08/lightning-testing-service-part-2-custom.html](http://www.tuicool.com/articles/hit/Zv2I3q2)

