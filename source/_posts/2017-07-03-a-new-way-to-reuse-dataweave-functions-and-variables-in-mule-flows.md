---
title: A New Way to Reuse DataWeave Functions and Variables in Mule Flows
---

A New Dataweave Function Makes It Easier for You to Store, Reuse, and Share Dataweave Functions Between Flows and Mule Applications.

## Reusing Dataweave Code

[MuleSoft’s](http://www.mulesoft.com/)[DataWeave](https://docs.mulesoft.com/mule-user-guide/v/3.8/dataweave)technology is a powerful and efficient way to transform complex structured data between popular data formats, including JSON, XML, CSV, and Java objects.

I'm a courseware developer and trainer at[MuleSoft](http://www.mulesoft.com/), and recently I've been spending a lot of time learning about DataWeave.

In the[DataWeave](https://docs.mulesoft.com/mule-user-guide/v/3.8/dataweave)1.x version included in the Mule runtime v3.8, there has been limited support for reusing DataWeave functions and variables between Transform Message components \(the component that applies DataWeave code\). In particular, there is currently no direct support for importing modules or libraries of DataWeave code. But starting with Mule Runtime v3.8.4 there is a new`readUrl`function you can now use to start reusing DataWeave code across applications and even across deployments.

In this post, you’ll learn how to use the new`readUrl`function to separate out reusable DataWeave code, and then reuse that code between multiple Transform Message components and flows, including flows in separate applications and MUnit flows. This is a nice new tool to add to your DataWeave tool box.

## Creating a Mule Project With Reusable Dataweave Library Files

An example Mule project is available in this[GitHub repository](https://github.com/ethanport/dataweave-reuse). You can import this project into the latest Anypoint Studio to follow along with this post. Alternatively, you can create a new Mule project in Anypoint Studio and copy the examples from this blog post.

This project has added a folder named`dw`to`src/main/resources`, and then created a file named`myLib.wev`inside the`dw`folder. When this Mule project is exported as a deployable archive file, all the files in`src/main/resources`will be automatically added to the project's classes folder, so will be in the classpath when the Mule application is deployed to a Mule runtime. In this sample project, the HTTP listener is listening for requests on port 8081.

![](http://img0.tuicool.com/niUVRva.jpg!web)

## Coding the Reusable Dataweave File

The myLib.wev file contains some reusable variables and functions.

```
%dw 1.0

//Reusable constant
%var exchangeRateFromUSDToBritishPounds = 1.35

%function convertPriceFromUSDToBritishPounds ( input )
//Can 
use
 the getIntroString() 
function
 which 
is
 defined further down

"$(getIntroString()) :  $(input * exchangeRateFromUSDToBritishPounds)"


%
function
 getIntroString()

"The price converted to British Pounds is"
---

//Provide 
external
names
for
variables
and
 functions defined 
in
 the header
{
  exchangeRate : exchangeRateFromUSDToBritishPounds,

  convertPrice : convertPriceFromUSDToBritishPounds,

  //
Use
 an anonymous lambda 
to
define
 the 
function

  formatString : (aString, formatter) -
>
 formatter(aString)
}
```

The body expression creates key names for the variables and functions. The`exchangeRate`key has as value the variable`exchangeRateFromUSDToBritishPounds`. This variable acts as a constant in other DataWeave functions.

The`convertPrice`key references the more lengthy function name`convertPriceFromUSDToBritishPounds`. This function requires a parameter, which is used in the function's expression to print out the String returned from the later`getIntroString()`function, plus the result of multiplying the`input`value by the`exchangeRateFromUSDToBritishPounds`variable.

The`formatString`key is different from the other two keys in the body expression. The`formatString`key has a value which is an anonymous function implementation. These types of unnamed functions are also called lambdas. The lambda requires two input parameters. The first parameter labeled`aString`is supplied to the`formatString`function with any string value, which then has the`formatter`function applied to`aString`.

Next, you will see how to use these functions, including`formatString`, in a DataWeave flow.

## Reading in and Using an External Dataweave File

The next step is to read in this external DataWeave file and use it in a Transform Message component. The first step is to use the new readUrl function to read in the DataWeave function from the classpath. Define a variable`myLib`as a reference to the DataWeave file`myLib.wev`.

```
%dw
1.0
%output
 application/json


%var
 myLib = readUrl(
"classpath://dw/myLib.wev"
)
```

In this example, we are embedding the DataWeave library file inside the project, so we give the URL relative to the classpath`dw/myLib.wev`. If you are deploying into a customer-hosted on-prem Mule runtime, you could also store your DataWeave libraries in a common external location that you add to the Mule runtime's classpath.

Note: This is a similar technique to the way you can store Mule application properties files in an external location. You can learn more about this technique in the Anypoint[product documentation](https://docs.mulesoft.com/mule-user-guide/v/3.8/configuring-properties), or[Tanuki Java Service Wrapper](https://wrapper.tanukisoftware.com/doc/english/props-envvars.html#definition)documentation.

Like the related read\(\) function, readUrl\(\) can also include a second parameter to specify the mime type, such as`application/java`,`application/json`,`application/csv`, or`application/xml`. When not specified, the default mime type is`application/dw`. So in this example, we could also have written:

```
%dw
1.0
%output
 application/json


%var
 myLib = readUrl(
"classpath://dw/myLib.wev"
, 
"application/dw"
)
```

In Anypoint Studio, the file is stored in`src/main/resources`, but in the deployable archive, all the files from the`src/main/resources`folder are moved into the`classes`folder.

Here is a complete Transform Message component in the convertPrice flow:

```
%dw 
1.0


%output application/json

%
var
 myLib = readUrl(
"classpath://dw/myLib.wev"
)


//Access functions in the myLib reference

%
function
printPrice
(priceInUSD)
myLib
.
formatString
( myLib.convertPrice
(priceInUSD)
, 
(price)
 -
>
 upper price )

---

{ 
  
//Format the key

  ( 
    myLib.formatString( 
"result"
, (aString) -
>
 capitalize aString ) 
  ) : 

  
//Format the value - read in the input price as an HTTP query param

  printPrice( inboundProperties.
'http.query.params'
.price )
}
```

## Previewing and Testing Dataweave Code That Uses External Dataweave Library Files

You can preview example data transformations using the Preview pane in the Transform Message component editor. In the Transform Message component, in the left-side Input pane, right click on Inbound Properties &gt; http.query.params.

![](http://img1.tuicool.com/bUNrIrV.jpg!web)

Set an example price:

```
%dw 
1.0

%output application/java

---

{

price:
600

}
```

In the right-side Output pane, select the Preview button, which opens the Preview pane. In the Preview pane, you should see the result of the body expression.

![](http://img1.tuicool.com/E73UZrU.jpg!web)

Change the price from 600 to 500 and verify the output in the Preview pane also changes. This shows you that you can preview live changes to DataWeave code, even when you are reading in external DataWeave files.

Here is the entire**reuseDataWeaveCode.**xmlfile**:**

```
<
?
xml version=
"1.0"
 encoding=
"UTF-8"
?
>
<
mule
xmlns:tracking
=
"http://www.mulesoft.org/schema/mule/ee/tracking"
xmlns:dw
=
"http://www.mulesoft.org/schema/mule/ee/dw"
xmlns:http
=
"http://www.mulesoft.org/schema/mule/http"
xmlns
=
"http://www.mulesoft.org/schema/mule/core"
xmlns:doc
=
"http://www.mulesoft.org/schema/mule/documentation"
xmlns:spring
=
"http://www.springframework.org/schema/beans"
xmlns:xsi
=
"http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation
=
"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-current.xsd
http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
http://www.mulesoft.org/schema/mule/ee/dw http://www.mulesoft.org/schema/mule/ee/dw/current/dw.xsd
http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.mulesoft.org/schema/mule/ee/tracking http://www.mulesoft.org/schema/mule/ee/tracking/current/mule-tracking-ee.xsd"
>
<
http:listener-config
name
=
"HTTP_Listener_Configuration"
host
=
"0.0.0.0"
port
=
"8081"
doc:name
=
"HTTP Listener Configuration"
 /
>
<
flow
name
=
"convertPrice"
>
<
http:listener
config-ref
=
"HTTP_Listener_Configuration"
path
=
"/"
doc:name
=
"HTTP"
 /
>
<
dw:transform-message
doc:name
=
"Transform Message"
>
<
dw:input-inbound-property
doc:sample
=
"sample_data/map_string_string.dwl"
propertyName
=
"http.query.params"
 /
>
<
dw:set-payload
>
<
![CDATA[%dw 1.0
%var myLib = readUrl("classpath://dw/myLib.wev")

%output application/json

%function printPrice(priceInUSD)
myLib.formatString( myLib.convertPrice(priceInUSD), (price) -
>
 upper price )

%function headerString ()
"the price2"

---


{ 
  //format the key
  (myLib.formatString( "result", (aString) -
>
 capitalize aString )) : 

  //Read in the input price as an HTTP query param
  printPrice(inboundProperties.'http.query.params'.price)
}
]]
>
<
/
dw:set-payload
>
<
/
dw:transform-message
>
<
logger
level
=
"INFO"
doc:name
=
"Logger"
message
=
"#[message.payload]"
 /
>
<
/
flow
>
<
/
mule
>
```

## Deploying and Testing the Application

Deploy the reuseDataWeaveCode project to a Mule runtime. For example, here I am deploying the project to an Anypoint Platform account from Anypoint Studio.

![](http://img1.tuicool.com/YBJFRvF.jpg!web)

In this example, I deployed the application to a public Anypoint Platform URL[http://reuse-dataweave-code.cloudhub.io](http://reuse-dataweave-code.cloudhub.io/).

After the application deploys, open a web client \(you can use a web browser\), and make a GET request to the HTTP listener. If you deployed to a Mule runtime on your local machine, the URL is`http://localhost:8081?price=300`. For my CloudHub deployment, I'll make requests from a web client to`http://reuse-dataweave-code.cloudhub.io/?price=700`. You can click this URL now to try it out.

My web browser has a JSON parser extension and shows this response:

![](http://img2.tuicool.com/iiyY7rj.jpg!web)

As you build up more complex DataWeave transformation for your projects, you'll want to reuse some of your transformation logic. Today, you can do this using the readUrl\(\) function. Please let us know what you think of this feature, and also let us know what additional modularity you'd like to see in future releases.



Source: [https://dzone.com/articles/reusing-dataweave-functions-and-variable-in-mule-f](http://www.tuicool.com/articles/hit/bYBzUbZ)

