---
title: 'Beginner’s guide : 4 linux group management commands'
---

Learn to manage groups in Linux with these group management commands. Article includes how to create, modify, delete and administer groups.

![](http://img0.tuicool.com/MN7zEze.png!web)

Group management in Linux

Groups on Linux system are bunch of users created for easy access/permission management. One user can be member of one or many groups. User will have only one primary and one/many secondary groups. In our another article we have seen[user management commands](https://kerneltalks.com/linux/linux-user-management-useradd-userdel-usermod/)in Linux/Unix. In this article we will discuss group management. There are mainly 4 commands used to manage user groups on Linux systems :

1. groupadd
2. groupmod
3. groupdel
4. gpasswd

Lets check all these commands and fields they are responsible in/etc/group file.

### groupadd command

As name suggests, it is used to create new groups on Linux system. groupadd command needs group name as a argument.

```
# groupadd sysadmins
# cat /etc/group
sysadmins:
x:
502
:
 

```

This command creates group named sysadmins. Newly created group can be verified in /etc/group file. Study fields in /etc/group filehere.

Several common switches which works with groupadd are :

* -g : Specify GID of your choice
* -o : Create group with non-unique GID
* -r : Create system group. \(GID will be taken from system group GID range

### groupmod command

If you want to edit parameters like name, GID, uniqueness of group which already exist in system then you can modify group using groupmod. Below list of switch with their desired values should feed to this command –

* -g : new GID
* -o : Make it non-unique
* -n : New name

```
# groupmod -n newsysadmins sysadmins
# cat /etc/group |grep sys
newsysadmins:
x:
502
:
 

# groupmod -g 9999 sysadmins
# cat /etc/group 
sysadmins:
x:
9999
:
 

# groupmod -o -g 3 sysadmins
# cat /etc/group |grep sys
sys:
x:
3
:bin,adm

sysadmins:
x:
3
:
 

```

Observe above outputs where we changed name, gid of group and lastly we assigned same GID 3 \(non-unique\) to our group which was already existing.

### groupdel command

Thats the command where group ends their life! Yes, group deletion is performed using this command. This command is pretty simple. Just supply your group name and it will be deleted from system.

```
# groupdel sysadmins
```

### gpasswd command

This command is used to administer group. Administering groups includes :

1. Adding/removing users to/from group
2. Setting and removing group password
3. Making user administrator/member of group

Adding and removing user in group is done with switch -a and -d followed by user name and lastly group name. Check below examples :

```
# gpasswd -a shri sysadmins

Adding 
user
 shri to group sysadmins
 

# cat /etc/group | grep sysadmin

sysadmins:x:
3
:shri
 

# gpasswd -d shri sysadmins

Removing 
user
 shri 
from
 group sysadmins
 

# cat /etc/group | grep sysadmin

sysadmins:x:
3
:
 

```

Password set is done without any switch while password removal is with -r switch as below :

```
# gpasswd sysadmins

Changing the password 
for
group
 sysadmins

New
 Password:
Re-enter 
new
 password:
 

```

#### What is the use of group password in Linux? 

This question comes to many of us. Hardly rather no one use this feature at all. Idea must be to secure group from non-member users. But since group password should be known to all group members, its actually doesnt make any sense to use it. Then you might ask then why group password exist in first place? It may be just following user \(password security\) model to groups as well to maintain symmenty in design. I mean its just my thought. Let me know if you have any other reason which suits group password existence!

Making any user administrator of group grants him privilege to administer group. Member user is just member of group and can not administer it. You can make user administrator of group with -A switch and member with -M. By default user is added to group as a member

```
# gpasswd -A shri sysadmins
# gpasswd -M shri sysadmins
```

Those are all group management commands in Linux with their most used switches. Let us know any addition/correction/feedback in comments!



Source: [https://kerneltalks.com/commands/4-linux-group-management-commands/](http://www.tuicool.com/articles/hit/jYNBji)

