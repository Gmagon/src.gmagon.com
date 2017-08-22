---
title: What Is Bitwise and Is It Still Relevant in Modern PHP?
---

Many of you probably scratched your heads reading this title. “Bitwhat?”

In this article, we’ll look at what bitwise operators are, and whether or not their use is still relevant in this modern age of computing.

![](http://img2.tuicool.com/ANfaUjA.jpg!web)

--ADVERTISEMENT--

## Example Use Case

Bitwise operators are[listed here](http://php.net/manual/en/language.operators.bitwise.php), but to really drive the example home, we’ll focus on just one: the_bitwise and_\(`&`\). An example made it click for me. So that’s what we’ll do – dive straight into an example.

Imagine you have a website on which a given user can have specific permissions. For example, a magazine like SitePoint:

* a author can CRUD drafts, and and edit their profile.
* an editor can, in addition to the above, CRUD drafts and finished posts, and CRUD author profiles.
* an administrator can, in addition to the above, add administrator permissions.

Since a user can have multiple permissions, there are several ways of defining permissions in a database and the system using it.

### The Double Join

Add roles, add permissions, attach permissions to roles in a join table, then create another join table and bind some roles to some users.

This approach creates four extra tables:



* permissions
* roles
* permissions&lt;\_&gt;roles
* roles&lt;\_&gt;users

Quite a bit of overhead. Imagine having to edit these or list them in the app regularly in some frequently visited lists. Only heavy caching would save this app from collapsing under heavy load.

One advantage, though, is that by defining roles really well with intricate permissions, you only have to stick users into roles and you’re good – it keeps that join table light and fast.

### The Single Join

Add permissions, add a join table, attach some permissions to some users

This approach creates two extra tables:

* permissions
* permissions&lt;\_&gt;users

Much less overhead than the previous example, but you have many more entries in the join table because a user can have a LOT of permissions \(just the CRUD for drafting is 4 permissions on its own\). With a lot of users and a lot of permissions, this table can get heavy quickly.

### The Column Stampede

Add a column into the users table for each permission, then make its datatype a tinyint\(1\) \(basically a boolean\) to check the permission as “on” or “off”.

Setting permissions for a user would then look something like this:

    UPDATE `users` SET `editProfile` = 1, `deleteProfile` = 0, `createDraft` = 1, `publishDraft` = 0 ... WHERE `id` = 5

This approach adds no extra tables, but needlessly expands the table into gargantuan width, and requires a modification of the database every time a new permission is added. It’s a fine approach for when you know you’ll have at most two or three permissions for the foreseeable future, but shouldn’t be used for anything more than that.

However, because the list of columns, when looked at from afar, resembles a binary number \(1010\), this approach is an excellent segway into another…

## The Bitwise Approach

Before we dive deeper into this approach, let’s have a crash course in binary.

### Binary Numbers

All computers store data as binary: 0 or 1. So, the number 14 is actually stored as: 1110. How so?

Binary numbers are evaluated from right to left when calculating their value, just like real numbers. So the number 1337 means:

* 1 x 7
* + 3 x 10
* + 3 x 100
* + 1 x 1000

Because each digit in the decimal system \(base 10\) gets multiplied by 10. The first one is 1, the next one is 10, the next after that 100, the next 1000, etc.

In binary, the base is 2, so each digit gets multiplied by 2. The number 1110 is therefore:

* 0 x 1
* + 1 x 2
* + 1 x 4
* + 1 x 8

That’s 2 + 4 + 8, which is 14.

Yes, it’s that simple to convert binary numbers to decimal.

So when we look at our columns of permissions from before being 1010, that might as well be seen as the number 10 written in binary form. Hmm, maybe we’re onto something here.

If we have 1010 as permissions, that means the 2nd and 4th bit are set, whereas the first and third are not \(because they are 0\).

In binary parlance, we actually say the 0th and 2nd bit are not set, because they’re counted from 0, just like arrays. This is because their ordinal number \(1st, 2nd, 3rd\) corresponds to their exponent. The 0th bit is actually 2 to the power of 0 \(2^0\) which equals 1. The 1st bit is 2 to the power of 1 \(2^1\) which is 2. The 2nd is 2 squared \(2^2\) which equals 4, etc. That way it’s all very easy to remember.

So how does this help us?

### The Bitwise Approach

Well, by looking at permissions from afar, we can represent the state of_all the columns at once_with a single binary number. If we can represent all the columns at once with a single binary number, that means we can also represent it with a single integer when translated into decimal!

If we had a single`permissions`column which contained the value`14`, we would now know that this is actually`1110`, and we would know that we have three out of four permissions! But which 3 our of 4?

Imagine the following mapping of permissions:

| CHANGE PERMISSIONS | PROFILE CREATE | PROFILE EDIT | PROFILE DELETE | DRAFT CREATE | DRAFT EDIT | DRAFT DELETE | DRAFT PUBLISH | FINISHED EDIT | FINISHED DELETE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |

The number 14 in binary is 1110, but the number of zeroes on the left doesn’t matter, so we can pad it until we reach the number of the permissions in the table: 0000001110. This is still 14, only representative of the permissions from the table above. For all intents and purposes, 0000001110 === 1110.

According to this, we see that the account with a permission of`14`has the permissions:`DRAFT_DELETE`,`DRAFT_PUBLISH`, and`FINISHED_EDIT`. Granted, not exactly representative of a real world permission setup, but it’s just an example through which we can extrapolate that if one were to have 1111111111, they would have ALL the permissions \(likely an admin user\). In decimal, this is 1023. So, someone with the value`1023`in the`permissions`column is someone with all the permissions.

But how would we check for this in our code? In other words, how can we know if a permission’s bit is set \(1\) or not \(0\), especially if a number is stored as decimal, and not binary?

That’s what bitwise operators are for – particularly the single ampersand`&`, also known as the_bitwise and_.

MySQL supports it like so:

```
SELECT * FROM user WHERE id = 5 AND 512 & permissions
```

This translates literally to “select all users with the ID 5 who also have the_512 bit_of the column`permissions`set to 1″. You would check for other bits by just changing their value: 256, 128, 64, 32, 16, 8, 4, 2, or 1.

### The \[optional\] “let’s get technical” side-note

Skip this divided section if you don’t want to know how this operator, or similar operators work, but are just interested in continuing with the example.

When we say`AND 512 & permissions`we’re looking for the part after AND to be TRUE, because that’s how SQL queries operate – they evaluate conditions and return those rows which return true in regards to requirements.

Therefore,`512 & permissions`has to evaluate to true. We know that any non-zero value, be it an integer, a boolean that says “true”, or a string that is not empty, is actually considered “true”. So 512 is true. 1 is true. 0 is false. 128 is true. Etc.

512 is a base-10 integer, and`permissions`is a column which can contain a base-10 integer. The_bitwise and_actually looks at the cross-section of these two numbers, and returns the bits that are set \(1\) in both of them. So, if the number 512 is 1000000000, and if the permissions value is 1023, when converted into binary that’s 1111111111. The cross section of those returns 1000000000 because only the left-most bit is set in both numbers. When we convert this back into decimal, that’s 512, which is considered`true`.

These are actually logical, not arithmetic operators, in that they check for truthiness based on a condition. If we have the numbers 1110 and 1010, here’s what they produce given the different bitwise operators:

| – | & | \| | ^ | ~ |
| :--- | :--- | :--- | :--- | :--- |
| Operand A | 1110 | 1110 | 1110 | 1110 |
| Operand B | 1010 | 1010 | 1010 | / |
| Result | 1010 | 1110 | 0100 | 0001 |

* `&`returns a binary number in which all bits are set that are set in both operands.
* `|`returns a binary number with all bits set that are set in either operand.
* `^`returns a binary number with all bits set that are set in either operand, but not both.
* `~`just returns the opposite – all those not set in the original operand are now set.

There are also the bitwise shift operators: left shift`<<`and right shift`>>`. These dramatically change the values of binary numbers by literally moving all set bits one place to the right or left. Their use in our context is questionable, so we won’t be covering them here.

And in PHP we can test if a bit is set like so:

```
if (1023 & 1) {

}
```

But this is really, really hard to decipher – just looking at raw numbers isn’t really readable or understandable. So, in PHP, it’s better to use constants defining permissions as bits, and fetching the permission’s integer value from the column. Then, you end up with something like this:

```
if ($user->permissions & \MyNamespace\Role::FINISHED_DELETE) {
  // 
}
```

Here we assume we’ve got a`\MyNamespace\Role`class defined and loaded with constants like these:

```
const FINISHED_DELETE = 1;
const FINISHED_EDIT = 2;
const DRAFT_PUBLISH = 8;
...
const CHANGE_PERMISSIONS = 512;
```

Suddenly, you’ve got a really easy way of storing multiple permissions per user without using extra tables and creating unnecessary overhead.

So how do we store this in the database when permissions change? Just sum the permissions together, and store them as integer! A person who can`FINISHED_DELETE`and`FINISHED_EDIT`has permission 1 and 2, as per the constants above. Therefore, to save their permissions, you simply sum them up \(1+2=3\) and save 3 into the`permissions`column. There is_no other way_to get the number 3 with binary combinations – the number 3 cannot be represented in binary in any other way than 0011 – so you can be 100% certain that number 3 always means the user has permission 1 and permission 2, corresponding to their values in constants.

This seems too simple and practical, right? What’s the catch?

## Watch Exploring PHP

### Learning more about PHP, one video at a time



[Start Watching Now](https://www.sitepoint.com/premium/courses/exploring-php-2951)[Start Watching Now](https://www.sitepoint.com/premium/courses/exploring-php-2951)

## Caveats

There are two major caveats:

1. You need to keep in mind to use the power of 2 when calculating the next permission’s bit value. So if you need to add a new permission, you can’t just willy-nilly pick 543 if you already have 512 – it’ll have to be 1024. This gets a little more complex as the numbers get bigger.
2. Since our computers are running 64 bit operating systems on 64 bit CPUs \(mostly – some are even stuck on 32bit still!\), that means a number can have a maximum of 64 bits only. What this means is that you can only store permutations of a maximum of 64 permission on a given user. For small to medium sites this is quite enough, but on enormous websites, this can turn into a problem. The solution there is to use different columns for different permission contexts \(
   `draft_permissions`
   ,
   `account_permissions`
   , etc.\). Each of those columns can then contain permutations of 64 permissions on its own, which is enough for even the most demanding websites.

## Conclusion

Bitwise operations definitely still have a place in modern programming. While it may be counterintuitive to use something so seemingly complex \(it’s really not – it’s just not nearly as familiar as modern day join tables\), this approach brings many benefits – not the least of which is a dramatic boost in performance, both in data size \(a lot less information to store in the database, and to subsequently fetch\) and speed \(a user object can have their permission value pre-fetched – it’s just an int – and thus can be checked for it at all times\).

Packages as those presented[here](https://laravel-news.com/two-best-roles-permissions-packages)certainly make things simple, but only if you’re not already aware of even simpler alternatives like the ones demonstrated above.

How do you feel about using bitwise operators for checking permissions and this approach to storing them? Any obvious pros / cons? Let us know how you do it, and why!



Source: [https://www.sitepoint.com/bitwise-operators-still-relevant-modern-php/](http://www.tuicool.com/articles/hit/6jIJnmu)

