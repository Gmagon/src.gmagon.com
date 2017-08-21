---
title: ' Resource Manager on the command line'
---

![](http://img0.tuicool.com/J36RFv6.png!web)

This article contains a complete working example for the Resource Manager on the command line for those of you who can’t use the Enterprise Manager fort it. Believe me, I feel your pain :wink:

As a good practice, PL/SQL procedures should be using DBMS\_APPLICATION\_INFO to mark their modules and actions. Not only for monitoring purpose but also to provide a way to tweak the system if things start going ugly in terms of performance. Here’s where the Resource Manager steps in.

Sessions can be assigned to different consumer groups depending on the module. Say we have an application with certain modules that sometimes consume an awful lot of CPU resources or way too much parallel processes. When the problem surfaces, you may not have enough time to fix the coding because it’s a live production run. The mentioned tweak – if prepared beforehand – may save the day. Let’s look at an example:

```
 
BEGIN
  DBMS_RESOURCE_MANAGER.CREATE_PENDING_AREA();

  DBMS_RESOURCE_MANAGER.SET_CONSUMER_GROUP_MAPPING_PRI(
    EXPLICIT =
>
1
,
    SERVICE_MODULE_ACTION =
>
2
,
    SERVICE_MODULE =
>
3
,
    MODULE_NAME_ACTION =
>
4
,
    MODULE_NAME =
>
5
,
    SERVICE_NAME =
>
6
,
    ORACLE_USER =
>
7
,
    CLIENT_PROGRAM =
>
8
,
    CLIENT_OS_USER =
>
9
,
    CLIENT_MACHINE =
>
10
,
    CLIENT_ID =
>
11
);

  DBMS_RESOURCE_MANAGER.VALIDATE_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.SUBMIT_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.CLEAR_PENDING_AREA();
END;
/
```

The above set the priority of MODULE\_NAME over ORACLE\_USER, which is not the default. The state of the priorities can be seen in DBA\_RSRC\_MAPPING\_PRIORITY. Now I create two consumer groups:

```
BEGIN
DBMS_RESOURCE_MANAGER
.CREATE_PENDING_AREA
();

  
DBMS_RESOURCE_MANAGER
.CREATE_CONSUMER_GROUP
 (
     CONSUMER_GROUP =
>
'A_GROUP'
,
     COMMENT        =
>
'A Group'
);

  
DBMS_RESOURCE_MANAGER
.CREATE_CONSUMER_GROUP
 (
     CONSUMER_GROUP =
>
'B_GROUP'
,
     COMMENT        =
>
'B Group'
);

  
DBMS_RESOURCE_MANAGER
.VALIDATE_PENDING_AREA
();
  
DBMS_RESOURCE_MANAGER
.SUBMIT_PENDING_AREA
();
  
DBMS_RESOURCE_MANAGER
.CLEAR_PENDING_AREA
();

END
;
/
```

My demo user ADAM gets the right to be a member of these consumer groups:

```
BEGIN
  DBMS_RESOURCE_MANAGER.CREATE_PENDING_AREA();

  DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP (
   GRANTEE_NAME   =
>
'ADAM'
,
   CONSUMER_GROUP =
>
'A_GROUP'
,
   GRANT_OPTION   =
>
FALSE
);

  DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP (
   GRANTEE_NAME   =
>
'ADAM'
,
   CONSUMER_GROUP =
>
'B_GROUP'
,
   GRANT_OPTION   =
>
FALSE
);

  DBMS_RESOURCE_MANAGER.VALIDATE_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.SUBMIT_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.CLEAR_PENDING_AREA();
END;
/
```

Now the part where consumer group and module is combined respectively mapped:

```
BEGIN
DBMS_RESOURCE_MANAGER
.CREATE_PENDING_AREA
();

  
DBMS_RESOURCE_MANAGER
.SET_CONSUMER_GROUP_MAPPING

     (DBMS_RESOURCE_MANAGER.MODULE_NAME, 
'A_MODULE'
, 
'A_GROUP'
);

  
DBMS_RESOURCE_MANAGER
.SET_CONSUMER_GROUP_MAPPING

     (DBMS_RESOURCE_MANAGER.MODULE_NAME, 
'B_MODULE'
, 
'B_GROUP'
);

  
DBMS_RESOURCE_MANAGER
.VALIDATE_PENDING_AREA
();
  
DBMS_RESOURCE_MANAGER
.SUBMIT_PENDING_AREA
();
  
DBMS_RESOURCE_MANAGER
.CLEAR_PENDING_AREA
();

END
;
/
```

Next comes the Resource Manager Plan. The restrictions are a bit rigid to show an obvious effect – 95 to 5 percent favors Group A very much over Group B:

```
BEGIN
  DBMS_RESOURCE_MANAGER.CREATE_PENDING_AREA();

  DBMS_RESOURCE_MANAGER.CREATE_PLAN(
     PLAN    =
>
'TESTPLAN'
,
     COMMENT =
>
'test'
);

  DBMS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE (
     PLAN                     =
>
'MYPLAN'
, 
     GROUP_OR_SUBPLAN         =
>
'SYS_GROUP'
,    
/* built-in group */

     COMMENT                  =
>
'SYS Group'
,
     MGMT_P1                  =
>
100
);

  DBMS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE (
     PLAN                     =
>
'MYPLAN'
, 
     GROUP_OR_SUBPLAN         =
>
'A_GROUP'
,
     COMMENT                  =
>
'A GROUP'
,
     parallel_degree_limit_p1 =
>
8
 ,          
/* RESTRICTION HERE */

     MGMT_P2                  =
>
95
);

  DBMS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE (
     PLAN                     =
>
'MYPLAN'
, 
     GROUP_OR_SUBPLAN         =
>
'B_GROUP'
,
     COMMENT                  =
>
'B GROUP'
,
      parallel_degree_limit_p1 =
>
2
 ,          
/* RESTRICTION HERE */

      MGMT_P2                  =
>
5
);

  DBMS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE (
     PLAN                     =
>
'MYPLAN'
, 
     GROUP_OR_SUBPLAN         =
>
'OTHER_GROUPS'
, 
/* built-in group */

     COMMENT                  =
>
'Others'
,
     MGMT_P3                  =
>
100
);

  DBMS_RESOURCE_MANAGER.VALIDATE_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.SUBMIT_PENDING_AREA();
  DBMS_RESOURCE_MANAGER.CLEAR_PENDING_AREA();

END;
/
```

So far, no restriction is in place, because the plan is not yet active. But everything is now prepared. Should Module B consume too much CPU or demand too much parallel processes, the plan can be set with this :

```
BEGIN

    DBMS_RESOURCE_MANAGER.SWITCH_PLAN(plan_name =
>
'MYPLAN'
);

END
;
/
```

The sessions that have the module set are subject to the restrictions as soon as the plan is activated. If a new module is set during an existing session, the session is switched into the new consumer group. The parallel restriction have precedence over parallel hints:

```
SQL
>
connect adam/adam@prima

Connected.
SQL
>
select
distinct
 sid 
from
 v$mystat;


       SID
----------
	 
4


SQL
>
exec dbms_application_info.set_module(module_name =
>
'A_MODULE',action_name =
>
 'A-ACTION'
)


PL/SQL procedure successfully completed.

SQL
>
select
 resource_consumer_group 
from
 v$session 
where
 sid=
4
;


RESOURCE_CONSUMER_GROUP
--------------------------------
A_GROUP

SQL
>
select
 /*+ parallel (dual,
16
) */ * 
from
 dual;


D
-
X

SQL
>
select
 * 
from
 v$pq_sesstat;
 

STATISTIC		       LAST_QUERY SESSION_TOTAL     CON_ID
------------------------------ ---------- ------------- ----------
Queries Parallelized			
1
1
0

DML Parallelized			
0
0
0

DDL Parallelized			
0
0
0

DFO Trees				
1
1
0
Server Threads				
8
0
0

Allocation Height			
8
0
0

Allocation Width			
1
0
0

Local Msgs Sent 		       
24
24
0

Distr Msgs Sent 			
0
0
0

Local Msgs Recv
'd		       22	     22 	 0

Distr Msgs Recv
'd			0	      0 	 0

DOP					
8
0
0

Slave Sets				
1
0
0
13
 rows selected.

SQL
>
exec dbms_application_info.set_module(module_name =
>
'B_MODULE',action_name =
>
 'B-ACTION')

PL/SQL procedure successfully completed.

SQL
>
select
 resource_consumer_group 
from
 v$session 
where
 sid=
4
;


RESOURCE_CONSUMER_GROUP
--------------------------------
B_GROUP

SQL
>
select
 /*+ parallel (dual,
16
) */ * 
from
 dual;


D
-
X

SQL
>
select
 * 
from
 v$pq_sesstat; 

STATISTIC		       LAST_QUERY SESSION_TOTAL     CON_ID
------------------------------ ---------- ------------- ----------
Queries Parallelized			
1
2
0

DML Parallelized			
0
0
0

DDL Parallelized			
0
0
0

DFO Trees				
1
2
0
Server Threads				
2
0
0

Allocation Height			
2
0
0

Allocation Width			
1
0
0

Local Msgs Sent 			
8
32
0

Distr Msgs Sent 			
0
0
0

Local Msgs Recv
'd			8	     30 	 0

Distr Msgs Recv
'd			0	      0 	 0

DOP					
2
0
0

Slave Sets				
1
0
0
13
 rows selected.
```

To test the CPU restrictions, I used scripts like this:

```
set
 serveroutput 
on
declare

    v_starttime timestamp;
    v_endtime timestamp;
begin
    dbms_application_info.set_module(module_name =
>
'A_MODULE',action_name =
>
 'A-ACTION');

    v_starttime:=current_timestamp;
    
for
 i 
in
1.
.1000000000
loop
for
 j 
in
1.
.1000000000
loop
for
 k 
in
1.
.10000
loop

                null;
            
end
loop
;
        
end
loop
;
    
end
loop
;
    v_endtime:=current_timestamp;
    dbms_output.put_line(
'Seconds elapsed Module A: '||to_char(extract(second from v_endtime-v_starttime)));
end
;
/
```

With CPU\_COUNT set to 1 \(remember this is a dynamic parameter since 11g and this_Instance Caging_feature requires a Resource Manager plan to be active\), two sessions each running scripts like that one setting module A and the other module B are enough to see the effect. On my system, both sessions need about 15 seconds without the plan while module A completes in about 10 seconds vs module B in 20 seconds with the plan active.

Apart from the shown restrictions, there are other useful options available like A_ctive Session Pool, Maximum Estimated Execution Time, Undo Quota_and_Idle Blocker Time_. Each of these can come in handy to tweak or troubleshoot a misbehaving application without having to touch the code. See[here](http://docs.oracle.com/database/122/ADMIN/managing-resources-with-oracle-database-resource-manager.htm#ADMIN027)for a whole lot of more details.

The demo was done with 12c but works the same in 11g, probably also in 10g. As always: Don’t believe it, test it! ��



Source: [http://uhesse.com/2017/08/20/combining-resource-consumer-groups-with-application-modules-in-oracle/](http://www.tuicool.com/articles/hit/Ynyqiiy)

