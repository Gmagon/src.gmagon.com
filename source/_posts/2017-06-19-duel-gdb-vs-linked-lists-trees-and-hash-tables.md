---
title: 'Duel: gdb vs. linked lists, trees, and hash tables'
---

My first encounter with the gdb command`duel`was on some old IRIX about 15 years ago. I immediately loved how convenient it was for displaying various data structures during MySQL debugging, and I wished Linux had something similar. Later I found out that Duel was not something IRIX specific, but a public domain patch for gdb 4.6 written in ’93 by Michael Golan. Unfortunately, it never got into gdb \(for licensing reasons, so I’ve heard\). Now the gdb 8 is out, and the patch, obviously doesn’t apply. Instead of fixing the patch, I’ve re-implemented Duel in Python, using[gdb Python API](https://sourceware.org/gdb/onlinedocs/gdb/Python-API.html)and the[Arpeggio](https://github.com/igordejanovic/Arpeggio)parser. Now it can be loaded run-time into your gdb, no patching or compilation is needed. And, hopefully, it will work over many gdb versions, as it no longer relies on undocumented gdb internals. So, allow me to introduce…**Duel.py**for gdb!

## Examples

Let’s start with a few examples, to get the taste of it. Michael Golan managed to create a concise but very naturally-looking language. For example, while`a->b`means the element`b`of the structure pointer`a`, in Duel`a-->b`means to walk the linked list, producing the sequence of values`a`,`a->b`,`a->b->b`, and so on. In MariaDB, all tables of a query are stored in a linked list, and it can be printed with just one command:

```
(gdb) dl table_list--
>
next_local-
>
table_name
tables-
>
table_name = 
0x7fffc40126b8
"t2"

tables-
>
next_local-
>
table_name = 
0x7fffc4012d18
"t1"

tables--
>
next_local[[
2
]]-
>
table_name = 
0x7fffc4013388
"t1"
```

Also, quite naturally, instead of a number, you can specify a range, great for printing arrays:

```
(gdb) dl longopts[
0.
.405
].name
longopts[
0
].name = 
"help"

longopts[
1
].name = 
"allow-suspicious-udfs"
<
...
 cut 
...
>

longopts[
404
].name = 
"session_track_transaction_info"

longopts[
405
].name = 
"session_track_state_change"
```

And instead of any expression, you can specify a set of expressions:

```
(gdb) 
dl
 my_long_options[
1
..
3
].(name,def_value)
my_long_options[
1
].(name) = 
"allow-suspicious-udfs"

my_long_options[
1
].(def_value) = 
0

my_long_options[
2
].(name) = 
"ansi"

my_long_options[
2
].(def_value) = 
0

my_long_options[
3
].(name) = 
"autocommit"

my_long_options[
3
].(def_value) = 
1
```

## Concepts

Duel is built on the idea that every expression can return multiple values. You’ve seen`a..b`,`a-->b`, and`a,b`as examples of such expressions. Any such expression can be used normally with other operators. Like in

```
(
gdb
) dl (
1
..
3
)+(
100
,
200
)
(
1
) + (
100
) = 
101

(
1
) + (
200
) = 
201

(
2
) + (
100
) = 
102

(
2
) + (
200
) = 
202

(
3
) + (
100
) = 
103

(
3
) + (
200
) = 
203
```

Besides operators that generate multiple values, there are operators that stop generation and grep-like operators that filter generated values. Let’s take a closer look.

## Operators

Duel syntax is C-like, C operators work as expected, one can use C-style casts, refer to variables and invoke functions of the inferior \(program, being debugged\). But additionally one can use special Duel operators that deal with multiple values.

#### Ranges and lists,`..`and`,`

You’ve seen examples above. These operators look rather familiar, they exist in other languages too. A range can have both or only one end specified,`..x`means a range of`x`elements, same as`0..x-1`. An open range`x..`will generate values ad infinitum \(or until the counter overflows, whatever comes first\), one usually uses it with the`@`“until” operator.

#### Until,`@`

In the`x@y`expression,`x`will keep generating values until`y`becomes true. For example,

```
(gdb) 
dl
 arr[
0
..]@(
count
>
10
)
```

will print elements of the`arr`array, until`arr[i].count`becomes larger than ten. As a convenient shortcut, the second argument can be a constant, in this case the generation stops as soon as the generated value becomes equal to this constant. For example, to print all command-line arguments:

```
(gdb) 
dl
argv
[
0
..]@
0
argv
[
0
] = 
"./mysqld"
argv
[
1
] = 
"--log-output=file"
argv
[
2
] = 
"--gdb"
argv
[
3
] = 
"--core-file"
```

Although this can be also achieved with

```
(gdb) 
dl
argv
[..
argc
]

argv
[
0
] = 
"./mysqld"
argv
[
1
] = 
"--log-output=file"
argv
[
2
] = 
"--gdb"
argv
[
3
] = 
"--core-file"
```

#### Walk the list,`-->`

The operator`x-->y`produces multiple values,`x`,`x->y`,`x->y->y`,`x->y->y->y`, and so on, until it hits NULL. This can be obviously used to print the whole linked list in one command. But it works for trees just the same:

```
(gdb)
dl
tree
-
>
(left,right)
-
>
data
```

#### Evaluating braces,`{ }`

Curly braces work just like parentheses, but they replace the expression with its value in the output. It’s easier to explain with the example, assume that`i = 5`:

```
(gdb) 
dl
 i+
6

i+
6
 = 
11

(gdb) 
dl
 {i}+
6
5
+
6
 = 
11

(gdb) 
dl
 {i+
6
}

11
 = 
11
```

This is useful in complex expressions around array indexes:

```
(gdb) dl 
if
 (my_long_options[i:=
1.
.20
].name[
0
] == 
'd'
) my_long_options[i].name

if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[i].name = 
"debug-abort-slave-event-count"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[i].name = 
"debug-assert-on-error"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[i].name = 
"debug-assert-if-crashed-table"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[i].name = 
"debug-disconnect-slave-event-count"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[i].name = 
"debug-exit-info"

(gdb) dl 
if
 (my_long_options[i:=
1.
.20
].name[
0
] == 
'd'
) my_long_options[{i}].name 

if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[
16
].name = 
"debug-abort-slave-event-count"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[
17
].name = 
"debug-assert-on-error"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[
18
].name = 
"debug-assert-if-crashed-table"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[
19
].name = 
"debug-disconnect-slave-event-count"
if
(my_long_options[i].name[
0
] == 
'd'
) my_long_options[
20
].name = 
"debug-exit-info"
```

Note, how in the second example curly braces allow us to see what array elements satisfy the condition.

#### Filters,`<?`,`>?`,`<=?`,`>=?`,`==?`,`!=?`

These operators work kind of like grep, they select values of left argument that satisfy the condition. In other words, the result of`x ==? y`is`x`, if it’s equal to`y`, otherwise there is no result at all. The previous, rather complex, example could be simplified using filters:

```
(gdb) dl my_long_options[
1.
.20
].(name[
0
] ==? 
'd'
 =
>
 name)
my_long_options[
16
].(name) = 
"debug-abort-slave-event-count"

my_long_options[
17
].(name) = 
"debug-assert-on-error"

my_long_options[
18
].(name) = 
"debug-assert-if-crashed-table"

my_long_options[
19
].(name) = 
"debug-disconnect-slave-event-count"

my_long_options[
20
].(name) = 
"debug-exit-info"
```

#### Other operators

There are also aliases \(`:=`\), grouping operators \(`#/`, etc\), conditional`if`operator, and other rarely needed things.

### Advanced

Few more examples from the manual.

Print the cyclic list \(start from`head`and follow the`next`pointer until you see`head`again\):

```
dl head--
>
(
next
!=?head)
```

Find the third positive element in the array \(uses`[[ ]]`operator that selects a value from a sequence\):

```
(gdb) dl (x[
0.
.] 
>
? 
0
)
[[2]]
```

Find the last element in the linked list \(uses the counter`#/`operator that returns the number of values in a sequence\):

```
(gdb) head--
>
next
[[
#/head--
>
next - 1]]
```

See if the array is sorted:

```
(gdb) 
dl
 x
[i:=..100]
>
? x
[i+1]
```

## Summary a.k.a. tl;dr

Duel in gdb works \(again \(after 24 years\)\). It’s ridiculously useful in debugging anything more complex than “Hello, world”. Practically you’ll only need to remember four constructs:`..`,`,`,`-->`, and`@0`.

You can get it from my repository:[https://github.com/vuvova/gdb-tools](https://github.com/vuvova/gdb-tools)

Disclaimer: while Duel itself is very stable and time-proven language, Duel.py is new, expect bugs.



Source: http://www.tuicool.com/articles/eauMNzr

