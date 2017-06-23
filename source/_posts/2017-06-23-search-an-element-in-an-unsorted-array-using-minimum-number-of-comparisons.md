---
title: Search an element in an unsorted array using minimum number of comparisons
---

Given an array of **n **distinct integers and an element **x**. Search the element **x **in the array using minimum number of comparisons. Any sort of comparison will contribute 1 to the count of comparisons. For example, the condition used to terminate a loop, will also contribute 1 to the count of comparisons each time it gets executed. Expressions like **while \(n\) {n–;} **also contribute to the count of comparisons as value of **n **is being compared internally so as to decide whether or not to terminate the loop.

Examples:

```
Input :
 arr[] = {
4
, 
6
, 
1
, 
5
, 
8
}, 
        x = 
1
Output :
 Found


Input :
 arr[] = {
10
, 
3
, 
12
, 
7
, 
2
, 
11
, 
9
}, 
        x = 
15
Output :
 Not Found
```

Asked in Adobe Interview

## [Recommended: Please try your approach on**{IDE}**first, before moving on to the solution.](http://ide.geeksforgeeks.org/)

Below simple method to search requires**2n + 1**comparisons in worst case.

```
for
 (i = 
0
; i 
<
 n; i++)  
// Worst case n+1
if
 (arr[i] == x)  
// Worst case n
return
 i;
```

How to reduce number of comparisons?

The idea is to copy x \(element to be searched\) to last location so that one last comparison when x is not present in arr\[\] is saved.

**Algorithm:**

```
search(arr, n, x)

if
 arr[n
-1
] == x  
// 1 comparison
return
"true"

    backup = arr[n
-1
]
    arr[n
-1
] = x


for
 i=
0
, i++ 
// no termination condition
if
 arr[i] == x 
// execute at most n times
// that is at-most n comparisons

            arr[n
-1
] = backup

return
 (i 
<
 n
-1
) 
// 1 comparison
```

```
// C++ implementation to search an element in
// the unsorted array using minimum number of
// comparisons
#
include
<
bits/stdc++.h
>
using
namespace
std
;


// function to search an element in
// minimum number of comparisons
string
search
(
int
 arr[], 
int
 n, 
int
 x)
{

// 1st comparison
if
 (arr[n
-1
] == x)

return
"Found"
;


int
 backup = arr[n
-1
];
    arr[n
-1
] = x;


// no termination condition and thus
// no comparison
for
 (
int
 i = 
0
; ;i++)
    {

// this would be executed at-most n times
// and therefore at-most n comparisons
if
 (arr[i] == x)
        {

// replace arr[n-1] with its actual element
// as in original 'arr[]'

            arr[n
-1
] = backup;


// if 'x' is found before the '(n-1)th'
// index, then it is present in the array
// final comparison
if
 (i 
<
 n
-1
)

return
"Found"
;


// else not present in the array
return
"Not Found"
;
        }
    }
}


// Driver program to test above
int
main
()
{

int
 arr[] = {
4
, 
6
, 
1
, 
5
, 
8
};

int
 n = 
sizeof
(arr) / 
sizeof
(arr[
0
]);

int
 x = 
1
;

cout
<
<
 search(arr, n, x);

return
0
;
}
```

Output:

```
Found
```

Time Complexity: O\(n\)

Number of Comparisons: atmost**\(n+2\)**comparisons

This article is contributed by**Ayush Jauhari**. If you like GeeksforGeeks and would like to contribute, you can also write an article using[contribute.geeksforgeeks.org](http://www.contribute.geeksforgeeks.org/)or mail your article to contribute@geeksforgeeks.org. See your article appearing on the GeeksforGeeks main page and help other Geeks.

Please write comments if you find anything incorrect, or you want to share more information about the topic discussed above.

Source: [http://www.geeksforgeeks.org/search-element-unsorted-array-using-minimum-number-comparisons/](http://www.tuicool.com/articles/hit/iQrQvm3)

