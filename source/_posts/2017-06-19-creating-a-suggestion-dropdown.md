---
title: Creating a Suggestion Dropdown
---

![](http://img2.tuicool.com/jUFrIjb.jpg!web)

#### The Ultimate Guide to Dropdowns in ASP.NET MVC Series

* [Introduction](https://www.danylkoweb.com/Blog/the-ultimate-guide-to-aspnet-mvc-dropdowns-JO)
* [Basics of ASP.NET MVC DropdownLists](https://www.danylkoweb.com/Blog/basics-of-aspnet-mvc-dropdowns-J7)
* [Dropdowns in WebGrids](https://www.danylkoweb.com/Blog/using-dropdowns-in-grids-JX)
* [Cascading Dropdowns](https://www.danylkoweb.com/Blog/cascading-dropdowns-in-aspnet-mvc-JY)
* Creating a Suggestion Dropdown

As far as dropdowns go, the most popular one on the Internet is Google's AutoSuggest.

As you start to type, Google tries to guess what the user is looking for and provides a dropdown with suggestions so the user doesn't have to type everything.

In the last post of this \[link\]series, we'll discuss how to create a autosuggest dropdown control for your own UI.

## Overview

Throughout this series, you already know by now that we need to write JavaScript for our control.

For our autosuggest dropdown, we'll use a standard Text Box along with a custom DIV that displays below it.

As the user types in the text box, we'll take their input and send it back to the server using a Web API.

This is probably the only post in the series without a ViewModel since everything is done through JavaScript.

## Our WebAPI

For our autosuggest to work, we need a Web API similar to our[Cascading Dropdown WebAPI](https://www.danylkoweb.com/Blog/cascading-dropdowns-in-aspnet-mvc-JY).

It's similar, but instead we want distinct make and models of cars and we only want 10 of them displayed in the dropdown.

#### /SearchController.cs

```
public
class
SearchController
 : 
ApiController

{
    [HttpGet]
    
public
 Vehicle[] 
For
(
string
 id
)
    
{
        
var
 connection = ConfigurationManager.ConnectionStrings[
"DropdownDatabase"
].ToString();
        
var
 repository = 
new
 VehicleRepository(connection);
        
var
 records = repository.Search(id);
        
return
 records
            .Distinct(
new
 VehicleMakeModelComparer())
            .Select(e =
>
new
 Vehicle { Make = e.Make, Model = e.Model })
            .OrderBy(e=
>
 e.Make)
            .ThenBy(e=
>
 e.Model)
            .Take(
10
)
            .ToArray();
    }
}
```

#### ViewModels/VehicleMakeModelComparer.cs

```
public
class
VehicleMakeModelComparer
 : 
IEqualityComparer
<
Vehicle
>

{
    
public
 bool Equals(Vehicle x, Vehicle y)
    {
        
var
 xKey = x.Make + 
" "
 + x.Model;
        
var
 yKey = y.Make + 
" "
 + y.Model;
        
return
 xKey.Equals(yKey);
    }
    
public
 int GetHashCode(Vehicle obj)
    {
        
var
 key = obj.Make + 
" "
 + obj.Model;
        
return
 key.GetHashCode();
    }
}
```

Now, when we call our API, it looks like this:

`/api/search/for/<query>`

and will return specific JSON to the UI.

## Setting up the UI

As mentioned, our UI only has one TextBox and a DIV.

```
<
div 
class
=
"form-group"
>

    @Html.Label(
"SearchLabel"
, 
"Search"
, 
new
 { @
class
 = 
"col-sm-1 control-label"
 })
    
<
div 
class
=
"col-sm-2"
>

        @Html.TextBox(
"SearchTerm"
, 
string
.Empty, 
new
 { @
class
 = 
"search-term form-control"
 })
        
<
div 
class
=
"suggestions hidden"
>
<
ul 
class
=
"suggest-list list-unstyled"
 /
>
<
/div
>
<
/div
>
<
/div
>
```

We don't have anything in our ".suggestions" until we make our call to our Web API.

## Time For Scripting

JavaScript is what powers the autosuggest. It's simple to understand and easy enough to enhance.

Our list is contained in a unordered list named ".suggest-list".

Our script requires the SearchTerm text box to have an onKeyUp event attached to it. Once they press the key, we call the API.

Views/Home/SuggestionDropdown.cshtml\(&lt;script&gt; section\)

```
$(
function
(
) 
{
    $(
"#SearchTerm"
).on(
"keyup keypress"
,
        
function
(
e
) 
{
            
var
 active = $(
"li.active"
, 
".suggest-list"
);
            
if
 (e.which === 
27
) {
                $(
".suggestions"
).addClass(
"hidden"
);
            } 
else
if
 (e.which === 
40
) {
                
if
 (active.length 
>
0
) {
                    
var
 next = $(active).next();
                    $(active).removeClass(
"active"
);
                    $(next).addClass(
"active"
);
                } 
else
 {
                    $(
"li:first"
, 
".suggest-list"
).addClass(
"active"
);
                }
            } 
else
if
 (e.which === 
38
) {
                
if
 (active.length 
>
0
) {
                    
var
 previous = $(active).prev();
                    $(active).removeClass(
"active"
);
                    $(previous).addClass(
"active"
);
                } 
else
 {
                    $(
"li:last"
, 
".suggest-list"
).addClass(
"active"
);
                }
            } 
else
if
 (e.which === 
13
) {
                e.preventDefault();
                $(
this
).val($(active).text());
                $(
".suggestions"
).addClass(
"hidden"
);
                
return
false
;
            } 
else
 {
                
// We have a good value w/ no special keys.
var
 value = $(
"#SearchTerm"
).val();
                
if
 (value === 
""
) {
                    $(
".suggestions"
).addClass(
"hidden"
);
                } 
else
 {
                    
var
 uri = 
"/api/search/for/"
 + value;
                    $(
".suggestions"
).removeClass(
"hidden"
);
                    $.getJSON(uri)
                        .done(
function
 (
data
) 
{
                            
var
 list = $(
".suggest-list"
);
                            $(list).empty();
                            $.each(data,
                                
function
 (
key, value
) 
{
                                    
var
 anchor = 
"
<
a href='#'
>
"
 +
                                        value.Make +
                                        
" "
 +
                                        value.Model +
                                        
"
<
/a
>
"
;
                                    $(list).append($(
"
<
li
>
<
/li
>
"
)
                                        .html(anchor));
                                    
// On mouse click, set the value.

                                    $(
"a"
, list).on(
"click"
,
                                        
function
 (
e
) 
{
                                            e.preventDefault();
                                            
var
 selected = $(
this
).text();
                                            $(
".search-term"
).val(selected);
                                            $(
".suggestions"
).addClass(
"hidden"
);
                                        });
                                });
                        });
                }
            }
        });
});
```

When the user presses a key, we check to see the following codes:

* ESC \(27\) - Close the dropdown when it's visible.
* Down Arrow \(40\) - Move to the next option in the dropdown.
* Up Arrow \(38\) - Move to the previous option in the dropdown.
* Enter \(13\) - Select the highlighted item in the dropdown.

In the end, when none of our keys are caught, we assume the user is entering their search criteria.

We show the "dropdown" by removing the hidden CSS class and make our call to the Web API.

Once retrieved, we add the items to our list and attach click events to our anchors in the list.

## Conclusion

In this final post to our dropdown series, I wanted to show how easy it is to create an autosuggest dropdown. Not only did we make our dropdown list clickable, we also added keyboard events for those keyboard-jockeys who avoid the mouse.

This dropdown series explained thebasics of dropdowns, how to use[dropdowns inside and outside of webgrids](https://www.danylkoweb.com/Blog/using-dropdowns-in-grids-JX), mutiple ways to[implement cascading dropdowns](https://www.danylkoweb.com/Blog/cascading-dropdowns-in-aspnet-mvc-JY), and, of course, how to create an autosuggest dropdown.

I hope this series has shown a detailed and easy way to implement dropdowns in ASP.NET MVC.

Was this autosuggest easy to implement? Is there a better way to do this? Post your comments below and let's discuss.

#### The Ultimate Guide to Dropdowns in ASP.NET MVC Series

* [Introduction](https://www.danylkoweb.com/Blog/the-ultimate-guide-to-aspnet-mvc-dropdowns-JO)
* [Basics of ASP.NET MVC DropdownLists](https://www.danylkoweb.com/Blog/basics-of-aspnet-mvc-dropdowns-J7)
* [Dropdowns in WebGrids](https://www.danylkoweb.com/Blog/using-dropdowns-in-grids-JX)
* [Cascading Dropdowns](https://www.danylkoweb.com/Blog/cascading-dropdowns-in-aspnet-mvc-JY)
* Creating a Suggestion Dropdown

Source: [https://www.danylkoweb.com/Blog/creating-a-suggestion-dropdown-K1](http://www.tuicool.com/articles/hit/ZvmMri2)

